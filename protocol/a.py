'''
    This is a simple example of how to use the x3dh library to perform a key agreement between two parties.
'''

#Import libraries
import x3dh
from typing import Dict
import asyncio

#Create dictionary to store bundles
bundles: Dict[bytes, x3dh.Bundle] = {}

#Create sub-class of x3dh.state.State
class myState(x3dh.state.State):
    def _publish_bundle(self, bundle: x3dh.Bundle) -> None:
        bundles[bundle.identity_key] = bundle

    @staticmethod
    def _encode_public_key(key_format: x3dh.IdentityKeyFormat, pub: bytes) -> bytes:
        return b"\x42" + pub + b"\x13\x37" + key_format.value.encode("ASCII")

#Initialize state settings  - taken from test_x3dh.py
state_settings = {
    "identity_key_format": x3dh.IdentityKeyFormat.CURVE_25519, # OR x3dh.IdentityKeyFormat.ED_25519
    "hash_function": x3dh.HashFunction.SHA_256, # OR x3dh.HashFunction.SHA_512
    "info": "x3dh".encode("ASCII"),
    "signed_pre_key_rotation_period": 7*24*60*60, # 7 days
    "pre_key_refill_threshold": 25,
    "pre_key_refill_target": 100
}


#Function to initialize key agreement
async def initialize_key_agreement() -> None:
    #Create states for Alice and Bob
    state_a = myState.create(**state_settings)
    state_b = myState.create(**state_settings)

    #Get bundles for Alice and Bob
    bundle_a = bundles[state_a.bundle.identity_key]
    bundle_b = bundles[state_b.bundle.identity_key]

    #Perform the first, active half of the key agreement
    shared_secret_active, associated_data_active, header = await state_a.get_shared_secret_active(bundle_b, "ad appendix". encode("ASCII"))

    #Perform the second, passive half of the key agreement
    shared_secret_passive, associated_data_passive, _ = await state_b.get_shared_secret_passive(header, "ad appendix". encode("ASCII"))

    #Get bundles for Alice and Bob
    bundle_a_after = bundles[state_a.bundle.identity_key]
    bundle_b_after = bundles[state_b.bundle.identity_key]

    #Check that bundle_a stayed the same, but bundle_b changed
    assert bundle_a == bundle_a_after
    assert bundle_b != bundle_b_after


    


#Main function
if __name__ == "__main__":
    agreement = initialize_key_agreement()
    asyncio.run(agreement)