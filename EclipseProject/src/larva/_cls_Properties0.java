package larva;


import java.util.Arrays;
import java.util.ArrayList;

import event_replayer.Event;

import java.util.LinkedHashMap;
import java.io.PrintWriter;

public class _cls_Properties0 implements _callable{

public static PrintWriter pw; 
public static _cls_Properties0 root;

public static LinkedHashMap<_cls_Properties0,_cls_Properties0> _cls_Properties0_instances = new LinkedHashMap<_cls_Properties0,_cls_Properties0>();
static{
try{
RunningClock.start();
pw = new PrintWriter("C:\\Users\\borgk\\workspace\\rv_protocol/src/output_Properties.txt");

root = new _cls_Properties0();
_cls_Properties0_instances.put(root, root);
  root.initialisation();
}catch(Exception ex)
{ex.printStackTrace();}
}

_cls_Properties0 parent; //to remain null - this class does not have a parent!
public static Event e;
public static Event e1;
int no_automata = 2;
 public boolean generatedPreKeys =false ;
 public boolean ikType =false ;
 public boolean skType =false ;
 public boolean pkType =false ;
 public boolean bundleCreated =false ;
 public boolean bundleModified =false ;
 public boolean bundleChanged =false ;
 public boolean pkRefillExpected =false ;
 public boolean bundleBChanged =false ;
 public boolean ikSame =false ;
 public boolean spkSame =false ;
 public boolean spkSigSame =false ;
 public boolean pkDeleted =false ;
 public boolean pkSame =false ;
 public boolean sharedSecretSame =false ;
 public boolean associatedDataSame =false ;

public static void initialize(){}
//inheritance could not be used because of the automatic call to super()
//when the constructor is called...we need to keep the SAME parent if this exists!

public _cls_Properties0() {
}

public void initialisation() {
}

public static _cls_Properties0 _get_cls_Properties0_inst() { synchronized(_cls_Properties0_instances){
 return root;
}
}

public boolean equals(Object o) {
 if ((o instanceof _cls_Properties0))
{return true;}
else
{return false;}
}

public int hashCode() {
return 0;
}

public void _call(String _info, int... _event){
synchronized(_cls_Properties0_instances){
_performLogic_create(_info, _event);
_performLogic_refill(_info, _event);
}
}

public void _call_all_filtered(String _info, int... _event){
}

public static void _call_all(String _info, int... _event){

_cls_Properties0[] a = new _cls_Properties0[1];
synchronized(_cls_Properties0_instances){
a = _cls_Properties0_instances.keySet().toArray(a);}
for (_cls_Properties0 _inst : a)

if (_inst != null) _inst._call(_info, _event);
}

public void _killThis(){
try{
if (--no_automata == 0){
synchronized(_cls_Properties0_instances){
_cls_Properties0_instances.remove(this);}
}
else if (no_automata < 0)
{throw new Exception("no_automata < 0!!");}
}catch(Exception ex){ex.printStackTrace();}
}

int _state_id_create = 357;

public void _performLogic_create(String _info, int... _event) {

_cls_Properties0.pw.println("[create]AUTOMATON::> create("+") STATE::>"+ _string_create(_state_id_create, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_create==355){
		if (1==0){}
		else if ((_occurredEvent(_event,676/*after_publish_bundle*/)) && (bundleCreated )){
		
		_state_id_create = 356;//moving to state bundlePublished
		_goto_create(_info);
		}
}
else if (_state_id_create==353){
		if (1==0){}
		else if ((_occurredEvent(_event,664/*after_create*/)) && (!ikType ||!skType ||!pkType )){
		_cls_Properties0.pw .println ("--> "+e .toString ());

		_state_id_create = 354;//moving to state bad
		_goto_create(_info);
		}
}
else if (_state_id_create==356){
		if (1==0){}
		else if ((_occurredEvent(_event,664/*after_create*/)) && (ikType &&skType &&pkType )){
		
		_state_id_create = 353;//moving to state stateCreated
		_goto_create(_info);
		}
}
else if (_state_id_create==357){
		if (1==0){}
		else if ((_occurredEvent(_event,668/*after_generate_pre_keys*/)) && (generatedPreKeys )){
		
		_state_id_create = 355;//moving to state prekeyGenerated
		_goto_create(_info);
		}
}
}

public void _goto_create(String _info){
_cls_Properties0.pw.println("[create]MOVED ON METHODCALL: "+ _info +" TO STATE::> " + _string_create(_state_id_create, 1));
_cls_Properties0.pw.flush();
}

public String _string_create(int _state_id, int _mode){
switch(_state_id){
case 355: if (_mode == 0) return "prekeyGenerated"; else return "prekeyGenerated";
case 354: if (_mode == 0) return "bad"; else return "!!!SYSTEM REACHED BAD STATE!!! bad "+new _BadStateExceptionProperties().toString()+" ";
case 353: if (_mode == 0) return "stateCreated"; else return "(((SYSTEM REACHED AN ACCEPTED STATE)))  stateCreated";
case 356: if (_mode == 0) return "bundlePublished"; else return "bundlePublished";
case 357: if (_mode == 0) return "start"; else return "start";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}
int _state_id_refill = 361;

public void _performLogic_refill(String _info, int... _event) {

_cls_Properties0.pw.println("[refill]AUTOMATON::> refill("+") STATE::>"+ _string_refill(_state_id_refill, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_refill==358){
		if (1==0){}
		else if ((_occurredEvent(_event,668/*after_generate_pre_keys*/)) && (generatedPreKeys )){
		
		_state_id_refill = 359;//moving to state prekeyGenerated
		_goto_refill(_info);
		}
}
else if (_state_id_refill==359){
		if (1==0){}
		else if ((_occurredEvent(_event,676/*after_publish_bundle*/)) && (bundleModified )){
		
		_state_id_refill = 360;//moving to state bundleModified
		_goto_refill(_info);
		}
}
else if (_state_id_refill==361){
		if (1==0){}
		else if ((_occurredEvent(_event,696/*before_get_shared_secret_passive*/)) && (pkRefillExpected )){
		
		_state_id_refill = 358;//moving to state refillExpected
		_goto_refill(_info);
		}
}
}

public void _goto_refill(String _info){
_cls_Properties0.pw.println("[refill]MOVED ON METHODCALL: "+ _info +" TO STATE::> " + _string_refill(_state_id_refill, 1));
_cls_Properties0.pw.flush();
}

public String _string_refill(int _state_id, int _mode){
switch(_state_id){
case 358: if (_mode == 0) return "refillExpected"; else return "refillExpected";
case 359: if (_mode == 0) return "prekeyGenerated"; else return "prekeyGenerated";
case 360: if (_mode == 0) return "bundleModified"; else return "bundleModified";
case 361: if (_mode == 0) return "start"; else return "start";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}

public boolean _occurredEvent(int[] _events, int event){
for (int i:_events) if (i == event) return true;
return false;
}
}