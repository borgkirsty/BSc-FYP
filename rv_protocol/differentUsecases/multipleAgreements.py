'''
    This is a script which will include monkey-patching to the x3dh library            
'''

#Import libraries
import time
import x3dh
from typing import Any, Dict, Iterator
import asyncio
import json
import aspectlib

(
    CREATE_ASPECT,
    GENERATE_PRE_KEYS_ASPECT,
    GENERATE_SPK_ASPECT,
    DELETE_PRE_KEY_ASPECT,
    PUBLISH_BUNDLE_ASPECT,
    ROTATE_SIGNED_PRE_KEY_ASPECT,
    FROM_MODEL_ASPECT,
    GET_SHARED_SECRET_ACTIVE_ASPECT,
    GET_SHARED_SECRET_PASSIVE_ASPECT
) = range(0,9)

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
        
    for state_settings in generate_settings("prekeyrefill".encode("ASCII"), pre_key_refill_target=10, pre_key_refill_threshold=5):
        #Create states for Alice and Bob
        state_a = myState.create(**state_settings)
        state_b = myState.create(**state_settings)

        #Get bundles for Alice and Bob
        bundle_a = bundles[state_a.bundle.identity_key]
        bundle_b = bundles[state_b.bundle.identity_key]

       
    # Perform a lot of key agreements:
        for _ in range(50):                
            bundle_b = bundles[state_b.bundle.identity_key]
            header = (await state_a.get_shared_secret_active(bundle_b))[2]
            await state_b.get_shared_secret_passive(header)
       

'''
    JSON trace file 
'''
id = 0
def add_event(when, what, watch={}):

    global id

    event_data = {
        "id": id,
        "timestamp": int(time.time()),
        "when": when,
        "what": what,
        "watch": watch
    }

    try:
        with open("./rv_protocol/differentUsecases/multipleAgreements_trace.json", "r") as f:
            trace_data = json.load(f)
    except:
        trace_data = []

    trace_data.append(event_data)

    with open("./rv_protocol/differentUsecases/multipleAgreements_trace.json", "w") as f:
        json.dump(trace_data, f)
        
    id += 1


'''
    Monkey-patching
'''

@aspectlib.Aspect
def _create_aspect(*args, **kwargs):
    add_event("BEFORE", "create")
    try:
        state_returned = yield
    finally:
        add_event("AFTER", "create", watch = {
            "identity_key_type": type(state_returned.bundle.identity_key) == bytes,
            "signed_pre_key_type": type(state_returned.bundle.signed_pre_key) == bytes,
            "pre_keys_type": all(type(pre_key) == bytes for pre_key in state_returned.bundle.pre_keys)
        })

@aspectlib.Aspect
def _generate_pre_keys_aspect(*args):
    add_event("BEFORE", "generate_pre_keys")
    pre_key_target = args[1]
    try:
        yield
    finally:
        pre_keys_after = args[0].bundle.pre_keys
        add_event("AFTER", "generate_pre_keys", watch = {
            "pre_key_generated": len(pre_keys_after) == pre_key_target
        })

@aspectlib.Aspect
def _generate_spk_aspect(*args):
    add_event("BEFORE", "generate_spk")
    try:
        yield
    finally:
        add_event("AFTER", "generate_spk")

@aspectlib.Aspect
def _delete_pre_key_aspect(*args):
    add_event("BEFORE", "delete_pre_key")
    state_current = args[0]
    tot_prekeys_before = len(state_current._BaseState__pre_keys) + len(state_current._BaseState__hidden_pre_keys)
    try:
        yield
    finally:        
        tot_prekeys_after = len(state_current._BaseState__pre_keys) + len(state_current._BaseState__hidden_pre_keys)
        add_event("AFTER", "delete_pre_key", watch = {
            "pre_key_deleted": tot_prekeys_after == tot_prekeys_before - 1
        })
    
@aspectlib.Aspect
def _publish_bundle_aspect(*args):
    add_event("BEFORE", "publish_bundle")
    bundleLen_before = len(bundles)
    try:
        yield
    finally:
        bundleLen_after = len(bundles)
        add_event("AFTER", "publish_bundle", watch = {
            "bundle_created": bundleLen_after == bundleLen_before + 1,
            "bundle_modified": bundleLen_after == bundleLen_before
        })
    
@aspectlib.Aspect
def _rotate_signed_pre_key_aspect(*args):
    add_event("BEFORE", "rotate_signed_pre_key")
    state_current = args[0]
    spk = state_current._BaseState__signed_pre_key
    try:
        yield
    finally:
        add_event("AFTER", "rotate_signed_pre_key", watch = {
            "pre_key_rotated": state_current._BaseState__old_signed_pre_key == spk,
        })
        

# @aspectlib.Aspect
# def _from_model_aspect(*args):
#     add_event("BEFORE", "from_model")
#     try:
#         yield
#     finally:
#         add_event("AFTER", "from_model")

@aspectlib.Aspect
def _get_shared_secret_active_aspect(*args):
    global shared_secret_active, associated_data_active
    pre_keys_num = len(args[0].bundle.pre_keys)
    add_event("BEFORE", "get_shared_secret_active", watch = {
        "pre_keys_available": pre_keys_num > 0 })
    try:
        shared_secret_active, associated_data_active, _ = yield
    except Exception as e:
        add_event(type(e).__name__, "get_shared_secret_active")
    finally:
        add_event("AFTER", "get_shared_secret_active")

@aspectlib.Aspect
def _get_shared_secret_passive_aspect(*args):

    global shared_secret_passive, associated_data_passive, shared_secret_active, associated_data_active

    stateB = args[0]
    bundleB_before = bundles[stateB.bundle.identity_key]
    pre_keys_available = stateB.get_num_visible_pre_keys()
    pre_keys_threshold = stateB._State__pre_key_refill_threshold
    header = args[1]

    spkPassed = header.signed_pre_key
    spkCurrent = stateB._BaseState__signed_pre_key.pub
    if stateB._BaseState__old_signed_pre_key is not None:
        spkOld = stateB._BaseState__old_signed_pre_key

    add_event("BEFORE", "get_shared_secret_passive", watch = {
        "refill_expected": pre_keys_available - 1 <= pre_keys_threshold,
        "prekey_used": header.pre_key is not None,
        "signed_pre_key_found": spkPassed == spkCurrent or spkPassed == spkOld
    })
    try:
        shared_secret_passive, associated_data_passive, _ = yield
    except Exception as e:
        add_event(type(e).__name__, "get_shared_secret_passive")
    finally:
        bundleB_after = bundles[stateB.bundle.identity_key]
        add_event("AFTER", "get_shared_secret_passive", watch = {
            #The bundle of the passive party should have been modified and published again
            "bundleB_changed": bundleB_before != bundleB_after,
            "identity_key_same": bundleB_before.identity_key == bundleB_after.identity_key,
            "signed_pre_key_same": bundleB_before.signed_pre_key == bundleB_after.signed_pre_key,
            "signed_pre_key_signature_same": bundleB_before.signed_pre_key_sig == bundleB_after.signed_pre_key_sig,
            "pre_keys_same": all(pre_key in bundleB_before.pre_keys for pre_key in bundleB_after.pre_keys),

            #Both parties should have derived the same shared secret and built the same associated data
            "shared_secret_same": shared_secret_active == shared_secret_passive,
            "associated_data_same": associated_data_active == associated_data_passive
        })



#Main function
if __name__ == "__main__":

    #Monkey-patching
    ASPECT_TABLE[CREATE_ASPECT] = aspectlib.weave(myState.create, _create_aspect) 
    ASPECT_TABLE[GENERATE_PRE_KEYS_ASPECT] = aspectlib.weave(myState.generate_pre_keys, _generate_pre_keys_aspect) #good
    #ASPECT_TABLE[GENERATE_SPK_ASPECT] = aspectlib.weave(myState._BaseState__generate_spk , _generate_spk_aspect) '''This object is not and acceptable type in aspectlib to monkey-patch
    ASPECT_TABLE[PUBLISH_BUNDLE_ASPECT] = aspectlib.weave(myState._publish_bundle, _publish_bundle_aspect) #good
    ASPECT_TABLE[ROTATE_SIGNED_PRE_KEY_ASPECT] = aspectlib.weave(myState.rotate_signed_pre_key, _rotate_signed_pre_key_aspect) #good
    #ASPECT_TABLE[FROM_MODEL_ASPECT] = aspectlib.weave(myState.from_model, _from_model_aspect)
    ASPECT_TABLE[GET_SHARED_SECRET_ACTIVE_ASPECT] = aspectlib.weave(myState.get_shared_secret_active, _get_shared_secret_active_aspect) #good
    ASPECT_TABLE[DELETE_PRE_KEY_ASPECT] = aspectlib.weave(myState.delete_pre_key, _delete_pre_key_aspect) #good
    ASPECT_TABLE[GET_SHARED_SECRET_PASSIVE_ASPECT] = aspectlib.weave(myState.get_shared_secret_passive, _get_shared_secret_passive_aspect) #good


    agreement = initialize_key_agreement()
    asyncio.run(agreement)