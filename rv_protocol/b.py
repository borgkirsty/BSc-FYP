'''
    This is a script which will include monkey-patching to the x3dh library            
'''

#Import libraries
import x3dh
from typing import Dict
import asyncio
from datetime import datetime
import json
import aspectlib

(
    GENERATE_PRE_KEYS_ASPECT,
    DELETE_PRE_KEY_ASPECT,
    PUBLISH_BUNDLE_ASPECT,
    ROTATE_SIGNED_PRE_KEY_ASPECT,
    FROM_MODEL_ASPECT,
    DELETE_HIDDEN_PRE_KEYS_ASPECT,
    GET_SHARED_SECRET_ACTIVE_ASPECT,
    GET_SHARED_SECRET_PASSIVE_ASPECT
) = range(0,8)

ASPECT_TABLE = {}

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

    #Rotate signed pre-key for Alice
    state_a.rotate_signed_pre_key()

    #Rotate signed pre-key for Bob
    state_b.rotate_signed_pre_key()

    #Get bundles for Alice and Bob
    bundle_a_after = bundles[state_a.bundle.identity_key]
    bundle_b_after = bundles[state_b.bundle.identity_key]

    #Check that bundle_a stayed the same, but bundle_b changed
    assert bundle_a == bundle_a_after
    assert bundle_b != bundle_b_after


'''
    JSON trace file 
'''
id = 0
def add_event(when, what, watch={}):

    global id

    event_data = {
        "id": id,
        "timestamp": datetime.timestamp(datetime.now()),
        "when": when,
        "what": what,
        "watch": watch
    }

    try:
        with open("./rv_protocol/trace.json", "r") as f:
            trace_data = json.load(f)
    except:
        trace_data = []

    trace_data.append(event_data)

    with open("./rv_protocol/trace.json", "w") as f:
        json.dump(trace_data, f)
        
    id += 1


'''
    Monkey-patching
'''
@aspectlib.Aspect
def _generate_pre_keys_aspect(*args):
    add_event("BEFORE", "generate_pre_keys")
    try:
        yield
    finally:
        add_event("AFTER", "generate_pre_keys")

@aspectlib.Aspect
def _delete_pre_key_aspect(*args):
    add_event("BEFORE", "delete_pre_key")
    try:
        yield
    finally:
        add_event("AFTER", "delete_pre_key")
    
@aspectlib.Aspect
def _publish_bundle_aspect(*args):
    add_event("BEFORE", "publish_bundle")
    try:
        yield
    finally:
        add_event("AFTER", "publish_bundle")
    
@aspectlib.Aspect
def _rotate_signed_pre_key_aspect(*args):
    add_event("BEFORE", "rotate_signed_pre_key")
    try:
        yield
    finally:
        add_event("AFTER", "rotate_signed_pre_key")

@aspectlib.Aspect
def _from_model_aspect(*args):
    add_event("BEFORE", "from_model")
    try:
        yield
    finally:
        add_event("AFTER", "from_model")

@aspectlib.Aspect
def _delete_hidden_pre_keys_aspect(*args):
    add_event("BEFORE", "delete_hidden_pre_keys")
    try:
        yield
    finally:
        add_event("AFTER", "delete_hidden_pre_keys")

@aspectlib.Aspect
def _get_shared_secret_active_aspect(*args):
    global shared_secret_active, associated_data_active
    add_event("BEFORE", "get_shared_secret_active")
    try:
        shared_secret_active, associated_data_active, _ = yield
    finally:
        add_event("AFTER", "get_shared_secret_active")

@aspectlib.Aspect
def _get_shared_secret_passive_aspect(*args):

    global shared_secret_passive, associated_data_passive, shared_secret_active, associated_data_active
    add_event("BEFORE", "get_shared_secret_passive")
    stateB = args[0]
    bundleB_before = bundles[stateB.bundle.identity_key]
    try:
        shared_secret_passive, associated_data_passive, _ = yield
    finally:
        bundleB_after = bundles[stateB.bundle.identity_key]
        add_event("AFTER", "get_shared_secret_passive", watch = {
            #The bundle of the passive party should have been modified and published again
            "bundleB_changed": bundleB_before != bundleB_after,
            "identity_key_same": bundleB_before.identity_key == bundleB_after.identity_key,
            "signed_pre_key_same": bundleB_before.signed_pre_key == bundleB_after.signed_pre_key,
            "signed_pre_key_signature_same": bundleB_before.signed_pre_key_sig == bundleB_after.signed_pre_key_sig,
            "pre_key_deleted": len(bundleB_after.pre_keys) == len(bundleB_before.pre_keys) -1,
            "pre_keys_same": all(pre_key in bundleB_before.pre_keys for pre_key in bundleB_after.pre_keys),

            #Both parties should have derived the same shared secret and built the same associated data
            "shared_secret_same": shared_secret_active == shared_secret_passive,
            "associated_data_same": associated_data_active == associated_data_passive
        })



#Main function
if __name__ == "__main__":

    #Monkey-patching
    ASPECT_TABLE[GENERATE_PRE_KEYS_ASPECT] = aspectlib.weave(myState.generate_pre_keys, _generate_pre_keys_aspect) #good
    ASPECT_TABLE[DELETE_HIDDEN_PRE_KEYS_ASPECT] = aspectlib.weave(myState.delete_pre_key, _delete_pre_key_aspect) #good
    ASPECT_TABLE[PUBLISH_BUNDLE_ASPECT] = aspectlib.weave(myState._publish_bundle, _publish_bundle_aspect) #good
    ASPECT_TABLE[ROTATE_SIGNED_PRE_KEY_ASPECT] = aspectlib.weave(myState.rotate_signed_pre_key, _rotate_signed_pre_key_aspect) #good
    ASPECT_TABLE[FROM_MODEL_ASPECT] = aspectlib.weave(myState.from_model, _from_model_aspect)
    ASPECT_TABLE[DELETE_HIDDEN_PRE_KEYS_ASPECT] = aspectlib.weave(myState.delete_hidden_pre_keys, _delete_hidden_pre_keys_aspect) #good
    ASPECT_TABLE[GET_SHARED_SECRET_ACTIVE_ASPECT] = aspectlib.weave(myState.get_shared_secret_active, _get_shared_secret_active_aspect) #good
    ASPECT_TABLE[GET_SHARED_SECRET_PASSIVE_ASPECT] = aspectlib.weave(myState.get_shared_secret_passive, _get_shared_secret_passive_aspect) #good


    agreement = initialize_key_agreement()
    asyncio.run(agreement)