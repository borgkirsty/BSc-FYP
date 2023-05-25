package aspects;

import java.util.Arrays;
import java.util.ArrayList;

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
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 672/*after_delete_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 672/*after_delete_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("rotate_signed_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 678/*before_rotate_signed_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 678/*before_rotate_signed_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("delete_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 670/*before_delete_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 670/*before_delete_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("rotate_signed_pre_key"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 680/*after_rotate_signed_pre_key*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 680/*after_rotate_signed_pre_key*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("get_shared_secret_active"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 690/*before_get_shared_secret_active*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 690/*before_get_shared_secret_active*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("from_model"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 684/*after_from_model*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 684/*after_from_model*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("generate_pre_keys"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 666/*before_generate_pre_keys*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 666/*before_generate_pre_keys*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("publish_bundle"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 674/*before_publish_bundle*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 674/*before_publish_bundle*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("delete_hidden_pre_keys"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 688/*after_delete_hidden_pre_keys*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 688/*after_delete_hidden_pre_keys*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("create"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 662/*before_create*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 662/*before_create*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("KeyAgreementException")&& e1 .getWhat ().equals ("get_shared_secret_active"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 692/*exception_get_shared_secret_active*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 692/*exception_get_shared_secret_active*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("generate_pre_keys"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;
boolean generatedPreKeys;
generatedPreKeys =(boolean )e1 .getWatch ().get ("pre_key_generated");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 668/*after_generate_pre_keys*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 668/*after_generate_pre_keys*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("publish_bundle"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;
boolean bundleCreated;
boolean bundleModified;
bundleCreated =(boolean )e1 .getWatch ().get ("bundle_created");
bundleModified =(boolean )e1 .getWatch ().get ("bundle_modified");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 676/*after_publish_bundle*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 676/*after_publish_bundle*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("get_shared_secret_active"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 694/*after_get_shared_secret_active*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 694/*after_get_shared_secret_active*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("KeyAgreementException")&& e1 .getWhat ().equals ("get_shared_secret_passive"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 698/*exception_get_shared_secret_passive*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 698/*exception_get_shared_secret_passive*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("delete_hidden_pre_keys"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 686/*before_delete_hidden_pre_keys*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 686/*before_delete_hidden_pre_keys*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("from_model"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 682/*before_from_model*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 682/*before_from_model*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("BEFORE")&& e1 .getWhat ().equals ("get_shared_secret_passive"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;
boolean pkRefillExpected;
pkRefillExpected =(boolean )e1 .getWatch ().get ("refill_expected");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 696/*before_get_shared_secret_passive*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 696/*before_get_shared_secret_passive*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("get_shared_secret_passive"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;
boolean bundleBChanged;
boolean ikSame ;
boolean spkSame ;
boolean spkSigSame;
boolean pkSame ;
boolean sharedSecretSame ;
boolean associatedDataSame;
bundleBChanged =(boolean )e1 .getWatch ().get ("bundleB_changed");
ikSame =(boolean )e1 .getWatch ().get ("identity_key_same");
spkSame =(boolean )e1 .getWatch ().get ("signed_pre_key_same");
spkSigSame =(boolean )e1 .getWatch ().get ("signed_pre_key_signature_same");
pkSame =(boolean )e1 .getWatch ().get ("pre_keys_same");
sharedSecretSame =(boolean )e1 .getWatch ().get ("shared_secret_same");
associatedDataSame =(boolean )e1 .getWatch ().get ("associated_data_same");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 700/*after_get_shared_secret_passive*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 700/*after_get_shared_secret_passive*/);
}
}
before ( Event e1) : (call(* Event.replay(..)) && target(e1) && !cflow(adviceexecution()) && !cflow(within(larva.*))  && !(within(larva.*)) && if (e1 .getWhen ().equals ("AFTER")&& e1 .getWhat ().equals ("create"))) {

synchronized(_asp_Properties0.lock){
Event e;
e =e1 ;
boolean ikType ;
boolean skType ;
boolean pkType ;
ikType =(boolean )e1 .getWatch ().get ("identity_key_type");
skType =(boolean )e1 .getWatch ().get ("signed_pre_key_type");
pkType =(boolean )e1 .getWatch ().get ("pre_keys_type");

_cls_Properties0 _cls_inst = _cls_Properties0._get_cls_Properties0_inst();
_cls_inst.e1 = e1;
_cls_Properties0.e = e;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 664/*after_create*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 664/*after_create*/);
}
}
}