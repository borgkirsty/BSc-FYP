package aspects;

import event_replayer.Event;

import larva.*;
public aspect _asp_Properties0 {

public static Object lock = new Object();

boolean initialized = false;

after():(staticinitialization(*)){
if (!initialized){
	initialized = true;
	_cls_Properties0.initialize();
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("delete_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
boolean pkDeleted;
e =e1 ;
pkDeleted =(boolean )e1 .getWatch ().get ("pre_key_deleted");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_Properties0.pkDeleted = pkDeleted;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1810/*after_delete_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1810/*after_delete_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("rotate_signed_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
boolean rotateExpected;
e =e1 ;
rotateExpected =(boolean )e1 .getWatch ().get ("rotation_expected");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_Properties0.rotateExpected = rotateExpected;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1816/*before_rotate_signed_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1816/*before_rotate_signed_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("delete_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1808/*before_delete_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1808/*before_delete_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("rotate_signed_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
boolean pkRotate;
e =e1 ;
pkRotate =(boolean )e1 .getWatch ().get ("pre_key_rotated");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_Properties0.pkRotate = pkRotate;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1818/*after_rotate_signed_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1818/*after_rotate_signed_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("get_shared_secret_active"))) {

synchronized(_asp_Properties0.lock){
Event e;
boolean pkAvailable;
e =e1 ;
pkAvailable =(boolean )e1 .getWatch ().get ("pre_keys_available");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_Properties0.pkAvailable = pkAvailable;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1820/*before_get_shared_secret_active*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1820/*before_get_shared_secret_active*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("generate_pre_keys"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1804/*before_generate_pre_keys*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1804/*before_generate_pre_keys*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("publish_bundle"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1812/*before_publish_bundle*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1812/*before_publish_bundle*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("create"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1800/*before_create*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1800/*before_create*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("KeyAgreementException")&& e1 .getWhat ().equals ("get_shared_secret_active"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1822/*exception_get_shared_secret_active*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1822/*exception_get_shared_secret_active*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("generate_pre_keys"))) {

synchronized(_asp_Properties0.lock){
Event e;
boolean generatedPreKeys;
e =e1 ;
generatedPreKeys =(boolean )e1 .getWatch ().get ("pre_key_generated");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_Properties0.generatedPreKeys = generatedPreKeys;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1806/*after_generate_pre_keys*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1806/*after_generate_pre_keys*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("publish_bundle"))) {

synchronized(_asp_Properties0.lock){
boolean bundleModified;
Event e;
boolean bundleCreated;
e =e1 ;
bundleCreated =(boolean )e1 .getWatch ().get ("bundle_created");
bundleModified =(boolean )e1 .getWatch ().get ("bundle_modified");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.bundleModified = bundleModified;
_cls_Properties0.e = e;
_cls_Properties0.bundleCreated = bundleCreated;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1814/*after_publish_bundle*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1814/*after_publish_bundle*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("get_shared_secret_active"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1824/*after_get_shared_secret_active*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1824/*after_get_shared_secret_active*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("KeyAgreementException")&& e1 .getWhat ().equals ("get_shared_secret_passive"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1828/*exception_get_shared_secret_passive*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1828/*exception_get_shared_secret_passive*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("get_shared_secret_passive"))) {

synchronized(_asp_Properties0.lock){
boolean pkUsed;
boolean spkFound;
Event e;
boolean pkRefillExpected;
e =e1 ;
pkRefillExpected =(boolean )e1 .getWatch ().get ("refill_expected");
pkUsed =(boolean )e1 .getWatch ().get ("prekey_used");
spkFound =(boolean )e1 .getWatch ().get ("signed_pre_key_found");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.pkUsed = pkUsed;
_cls_Properties0.spkFound = spkFound;
_cls_Properties0.e = e;
_cls_Properties0.pkRefillExpected = pkRefillExpected;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1826/*before_get_shared_secret_passive*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1826/*before_get_shared_secret_passive*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("get_shared_secret_passive"))) {

synchronized(_asp_Properties0.lock){
boolean spkSame;
boolean associatedDataSame;
Event e;
boolean bundleBChanged;
boolean pkSame;
boolean spkSigSame;
boolean sharedSecretSame;
boolean ikSame;
e =e1 ;
bundleBChanged =(boolean )e1 .getWatch ().get ("bundleB_changed");
ikSame =(boolean )e1 .getWatch ().get ("identity_key_same");
spkSame =(boolean )e1 .getWatch ().get ("signed_pre_key_same");
spkSigSame =(boolean )e1 .getWatch ().get ("signed_pre_key_signature_same");
pkSame =(boolean )e1 .getWatch ().get ("pre_keys_same");
sharedSecretSame =(boolean )e1 .getWatch ().get ("shared_secret_same");
associatedDataSame =(boolean )e1 .getWatch ().get ("associated_data_same");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.spkSame = spkSame;
_cls_Properties0.associatedDataSame = associatedDataSame;
_cls_Properties0.e = e;
_cls_Properties0.bundleBChanged = bundleBChanged;
_cls_Properties0.pkSame = pkSame;
_cls_Properties0.spkSigSame = spkSigSame;
_cls_Properties0.sharedSecretSame = sharedSecretSame;
_cls_Properties0.ikSame = ikSame;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1830/*after_get_shared_secret_passive*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1830/*after_get_shared_secret_passive*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("create"))) {

synchronized(_asp_Properties0.lock){
boolean ikType;
Event e;
boolean skType;
boolean pkType;
e =e1 ;
ikType =(boolean )e1 .getWatch ().get ("identity_key_type");
skType =(boolean )e1 .getWatch ().get ("signed_pre_key_type");
pkType =(boolean )e1 .getWatch ().get ("pre_keys_type");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.ikType = ikType;
_cls_Properties0.e = e;
_cls_Properties0.skType = skType;
_cls_Properties0.pkType = pkType;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 1802/*after_create*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 1802/*after_create*/);
}
}
}