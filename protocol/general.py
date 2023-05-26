'''
    This is a simple example of how to use the x3dh library to perform a key agreement between two parties.
'''

#Import libraries
import x3dh
from typing import Dict, Any, Iterator
import asyncio
import time

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


#Function to initialize key agreement
async def initialize_key_agreement() -> None:
     for state_settings in generate_settings("generalX3DH".encode("ASCII"), pre_key_refill_target=10, pre_key_refill_threshold=5):
        #Create states for Alice and Bob
        state_a = myState.create(**state_settings)
        state_b = myState.create(**state_settings)

        #Get bundles for Alice and Bob
        bundle_a = bundles[state_a.bundle.identity_key]
        bundle_b = bundles[state_b.bundle.identity_key]

        #Perform the first, active half of the key agreement
        shared_secret_active, associated_data_active, header = await state_a.get_shared_secret_active(bundle_b, "ad appendix". encode("ASCII"), )

        #Perform the second, passive half of the key agreement
        shared_secret_passive, associated_data_passive, _ = await state_b.get_shared_secret_passive(header, "ad appendix". encode("ASCII"))

        #Rotate signed pre-key for Alice
        state_a.rotate_signed_pre_key()

        #Rotate signed pre-key for Bob
        state_b.rotate_signed_pre_key()

    


#Main function
if __name__ == "__main__":

    #Time the program
    start_time = time.time()


    agreement = initialize_key_agreement()
    asyncio.run(agreement)

    #Print the time taken
    print("General Time: --- %s seconds ---" % (time.time() - start_time))