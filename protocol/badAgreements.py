'''
    This is a script which will include monkey-patching to the x3dh library            
'''

#Import libraries
import random
import time
import x3dh
from typing import Dict, Iterator, Any
import asyncio
import json


shared_secret_active = None
associated_data_active = None
shared_secret_passive = None
associated_data_passive = None

'''
    Key agreement
'''

#Create dictionary to store bundles
bundles: Dict[bytes, x3dh.Bundle] = {}

#Create sub-class of x3dh.state.State
class myState(x3dh.state.State):
    def _publish_bundle(self, bundle: x3dh.Bundle) -> None:
        bundles[bundle.identity_key] = bundle

    @staticmethod
    def _encode_public_key(key_format: x3dh.IdentityKeyFormat, pub: bytes) -> bytes:
        return b"\x42" + pub + b"\x13\x37" + key_format.value.encode("ASCII")

#From python-x3dh protocol implementation
def generate_settings(
    info: bytes,
    signed_pre_key_rotation_period: int = 7 * 24 * 60 * 60,
    pre_key_refill_threshold: int = 25,
    pre_key_refill_target: int = 100
) -> Iterator[Dict[str, Any]]:
    """
    Generate state creation arguments.

    Args:
        info: The info to use constantly.
        signed_pre_key_rotation_period: The signed pre key rotation period to use constantly.
        pre_key_refill_threshold: The pre key refill threshold to use constantly.
        pre_key_refill_target. The pre key refill target to use constantly.

    Returns:
        An iterator which yields a set of state creation arguments, returning all valid combinations of
        identity key format and hash function with the given constant values.
    """

    for identity_key_format in [ x3dh.IdentityKeyFormat.CURVE_25519, x3dh.IdentityKeyFormat.ED_25519 ]:
        for hash_function in [ x3dh.HashFunction.SHA_256, x3dh.HashFunction.SHA_512 ]:
            state_settings: Dict[str, Any] = {
                "identity_key_format": identity_key_format,
                "hash_function": hash_function,
                "info": info,
                "signed_pre_key_rotation_period": signed_pre_key_rotation_period,
                "pre_key_refill_threshold": pre_key_refill_threshold,
                "pre_key_refill_target": pre_key_refill_target
            }

            yield state_settings


#Function from python-x3dh protocol implementation
def flip_random_bit(data: bytes, exclude_msb: bool = False) -> bytes:
    """
    Flip a random bit in a byte array.

    Args:
        data: The byte array to flip a random bit in.
        exclude_msb: Whether the most significant bit of the byte array should be excluded from the random
            selection. See note below.

    For Curve25519, the most significant bit of the public key is always cleared/ignored, as per RFC 7748 (on
    page 7). Thus, a bit flip of that bit does not make the signature verification fail, because the bit flip
    is ignored. The `exclude_msb` parameter can be used to disallow the bit flip to appear on the most
    significant bit and should be set when working with Curve25519 public keys.

    Returns:
        The data with a random bit flipped.
    """

    while True:
        modify_byte = random.randrange(len(data))
        modify_bit = random.randrange(8)

        # If the most significant bit was randomly chosen and `exclude_msb` is set, choose again.
        if not (exclude_msb and modify_byte == len(data) - 1 and modify_bit == 7):
            break

    data_mut = bytearray(data)
    data_mut[modify_byte] ^= 1 << modify_bit
    return bytes(data_mut)

#Function to initialize key agreement
async def initialize_key_agreement() -> None:
    for state_settings in generate_settings("badAgreement".encode("ASCII"), pre_key_refill_target=10, pre_key_refill_threshold=5):
        #Create states for Alice and Bob
        state_a = myState.create(**state_settings)
        state_b = myState.create(**state_settings)

        #Get bundles for Alice and Bob
        bundle_a = bundles[state_a.bundle.identity_key]
        bundle_b = bundles[state_b.bundle.identity_key]

        #Perform the first, active half of the key agreement
        shared_secret_active, associated_data_active, header = await state_a.get_shared_secret_active(bundle_b, "ad appendix". encode("ASCII"), )

        #Flip a random bit in the signature
        signed_pre_key_sig = flip_random_bit(bundle_b.signed_pre_key_sig)
        bundle_modified = x3dh.Bundle(
            identity_key=bundle_b.identity_key,
            signed_pre_key=bundle_b.signed_pre_key,
            signed_pre_key_sig=signed_pre_key_sig,
            pre_keys=bundle_b.pre_keys
        )
        try:
            await state_a.get_shared_secret_active(bundle_modified)
            assert False
        except:
            pass



#Main function
if __name__ == "__main__":
    
    #Time the program
    start_time = time.time()

    agreement = initialize_key_agreement()
    asyncio.run(agreement)

    #Print the time taken
    print("Bad Agreements Time:--- %s seconds ---" % (time.time() - start_time))