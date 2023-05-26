package larva;


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
pw = new PrintWriter("C:\\Users\\borgk\\workspace\\x3dh/src/output_Properties.txt");

root = new _cls_Properties0();
_cls_Properties0_instances.put(root, root);
  root.initialisation();
}catch(Exception ex)
{ex.printStackTrace();}
}

_cls_Properties0 parent; //to remain null - this class does not have a parent!
public static boolean spkSame;
public static boolean ikType;
public static Event e;
public static boolean generatedPreKeys;
public static boolean pkRefillExpected;
public static boolean pkRotate;
public static boolean pkSame;
public static boolean rotateExpected;
public static Event e1;
public static boolean bundleCreated;
public static boolean pkDeleted;
public static boolean bundleModified;
public static boolean pkUsed;
public static boolean spkFound;
public static boolean associatedDataSame;
public static boolean bundleBChanged;
public static boolean spkSigSame;
public static boolean pkAvailable;
public static boolean skType;
public static boolean sharedSecretSame;
public static boolean pkType;
public static boolean ikSame;
int no_automata = 6;

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
_performLogic_rotate(_info, _event);
_performLogic_delete(_info, _event);
_performLogic_activeException(_info, _event);
_performLogic_passiveException(_info, _event);
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

int _state_id_create = 856;

public void _performLogic_create(String _info, int... _event) {

_cls_Properties0.pw.println("[create]AUTOMATON::> create("+") STATE::>"+ _string_create(_state_id_create, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_create==854){
		if (1==0){}
		else if ((_occurredEvent(_event,1814/*after_publish_bundle*/)) && (bundleCreated )){
		
		_state_id_create = 855;//moving to state bundlePublished
		_goto_create(_info);
		}
}
else if (_state_id_create==852){
		if (1==0){}
		else if ((_occurredEvent(_event,1802/*after_create*/)) && (!ikType )){
		_cls_Properties0.pw .println ("--> "+e .toString ());

		_state_id_create = 853;//moving to state bad
		_goto_create(_info);
		}
		else if ((_occurredEvent(_event,1802/*after_create*/)) && (!skType )){
		_cls_Properties0.pw .println ("--> "+e .toString ());

		_state_id_create = 853;//moving to state bad
		_goto_create(_info);
		}
		else if ((_occurredEvent(_event,1802/*after_create*/)) && (!pkType )){
		_cls_Properties0.pw .println ("--> "+e .toString ());

		_state_id_create = 853;//moving to state bad
		_goto_create(_info);
		}
}
else if (_state_id_create==855){
		if (1==0){}
		else if ((_occurredEvent(_event,1802/*after_create*/)) && (ikType &&skType &&pkType )){
		
		_state_id_create = 852;//moving to state stateCreated
		_goto_create(_info);
		}
}
else if (_state_id_create==856){
		if (1==0){}
		else if ((_occurredEvent(_event,1806/*after_generate_pre_keys*/)) && (generatedPreKeys )){
		
		_state_id_create = 854;//moving to state prekeyGenerated
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
case 854: if (_mode == 0) return "prekeyGenerated"; else return "prekeyGenerated";
case 853: if (_mode == 0) return "bad"; else return "!!!SYSTEM REACHED BAD STATE!!! bad "+new _BadStateExceptionProperties().toString()+" ";
case 852: if (_mode == 0) return "stateCreated"; else return "(((SYSTEM REACHED AN ACCEPTED STATE)))  stateCreated";
case 855: if (_mode == 0) return "bundlePublished"; else return "bundlePublished";
case 856: if (_mode == 0) return "start"; else return "start";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}
int _state_id_refill = 860;

public void _performLogic_refill(String _info, int... _event) {

_cls_Properties0.pw.println("[refill]AUTOMATON::> refill("+") STATE::>"+ _string_refill(_state_id_refill, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_refill==857){
		if (1==0){}
		else if ((_occurredEvent(_event,1806/*after_generate_pre_keys*/)) && (generatedPreKeys )){
		
		_state_id_refill = 858;//moving to state prekeyGenerated
		_goto_refill(_info);
		}
}
else if (_state_id_refill==858){
		if (1==0){}
		else if ((_occurredEvent(_event,1814/*after_publish_bundle*/)) && (bundleModified )){
		
		_state_id_refill = 859;//moving to state bundleModified
		_goto_refill(_info);
		}
}
else if (_state_id_refill==860){
		if (1==0){}
		else if ((_occurredEvent(_event,1826/*before_get_shared_secret_passive*/)) && (pkRefillExpected )){
		
		_state_id_refill = 857;//moving to state refillExpected
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
case 857: if (_mode == 0) return "refillExpected"; else return "refillExpected";
case 858: if (_mode == 0) return "prekeyGenerated"; else return "prekeyGenerated";
case 859: if (_mode == 0) return "bundleModified"; else return "bundleModified";
case 860: if (_mode == 0) return "start"; else return "start";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}
int _state_id_rotate = 864;

public void _performLogic_rotate(String _info, int... _event) {

_cls_Properties0.pw.println("[rotate]AUTOMATON::> rotate("+") STATE::>"+ _string_rotate(_state_id_rotate, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_rotate==863){
		if (1==0){}
		else if ((_occurredEvent(_event,1818/*after_rotate_signed_pre_key*/)) && (pkRotate )){
		
		_state_id_rotate = 862;//moving to state sigPreKeyRotated
		_goto_rotate(_info);
		}
		else if ((_occurredEvent(_event,1818/*after_rotate_signed_pre_key*/)) && (!pkRotate )){
		_cls_Properties0.pw .println ("--> "+e .toString ());

		_state_id_rotate = 861;//moving to state bad
		_goto_rotate(_info);
		}
}
else if (_state_id_rotate==864){
		if (1==0){}
		else if ((_occurredEvent(_event,1816/*before_rotate_signed_pre_key*/)) && (rotateExpected )){
		
		_state_id_rotate = 863;//moving to state pkRotateExpected
		_goto_rotate(_info);
		}
}
}

public void _goto_rotate(String _info){
_cls_Properties0.pw.println("[rotate]MOVED ON METHODCALL: "+ _info +" TO STATE::> " + _string_rotate(_state_id_rotate, 1));
_cls_Properties0.pw.flush();
}

public String _string_rotate(int _state_id, int _mode){
switch(_state_id){
case 861: if (_mode == 0) return "bad"; else return "!!!SYSTEM REACHED BAD STATE!!! bad "+new _BadStateExceptionProperties().toString()+" ";
case 863: if (_mode == 0) return "pkRotateExpected"; else return "pkRotateExpected";
case 864: if (_mode == 0) return "start"; else return "start";
case 862: if (_mode == 0) return "sigPreKeyRotated"; else return "sigPreKeyRotated";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}
int _state_id_delete = 869;

public void _performLogic_delete(String _info, int... _event) {

_cls_Properties0.pw.println("[delete]AUTOMATON::> delete("+") STATE::>"+ _string_delete(_state_id_delete, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_delete==868){
		if (1==0){}
		else if ((_occurredEvent(_event,1808/*before_delete_pre_key*/))){
		
		_state_id_delete = 865;//moving to state badDelete
		_goto_delete(_info);
		}
}
else if (_state_id_delete==866){
		if (1==0){}
		else if ((_occurredEvent(_event,1810/*after_delete_pre_key*/)) && (pkDeleted )){
		
		_state_id_delete = 867;//moving to state preKeyDeleted
		_goto_delete(_info);
		}
}
else if (_state_id_delete==869){
		if (1==0){}
		else if ((_occurredEvent(_event,1826/*before_get_shared_secret_passive*/)) && (pkUsed )){
		
		_state_id_delete = 866;//moving to state preKeyedPassive
		_goto_delete(_info);
		}
		else if ((_occurredEvent(_event,1826/*before_get_shared_secret_passive*/)) && (!pkUsed )){
		
		_state_id_delete = 868;//moving to state nonPreKeyedPassive
		_goto_delete(_info);
		}
}
}

public void _goto_delete(String _info){
_cls_Properties0.pw.println("[delete]MOVED ON METHODCALL: "+ _info +" TO STATE::> " + _string_delete(_state_id_delete, 1));
_cls_Properties0.pw.flush();
}

public String _string_delete(int _state_id, int _mode){
switch(_state_id){
case 867: if (_mode == 0) return "preKeyDeleted"; else return "preKeyDeleted";
case 868: if (_mode == 0) return "nonPreKeyedPassive"; else return "nonPreKeyedPassive";
case 866: if (_mode == 0) return "preKeyedPassive"; else return "preKeyedPassive";
case 869: if (_mode == 0) return "start"; else return "start";
case 865: if (_mode == 0) return "badDelete"; else return "!!!SYSTEM REACHED BAD STATE!!! badDelete "+new _BadStateExceptionProperties().toString()+" ";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}
int _state_id_activeException = 872;

public void _performLogic_activeException(String _info, int... _event) {

_cls_Properties0.pw.println("[activeException]AUTOMATON::> activeException("+") STATE::>"+ _string_activeException(_state_id_activeException, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_activeException==872){
		if (1==0){}
		else if ((_occurredEvent(_event,1820/*before_get_shared_secret_active*/)) && (!pkAvailable )){
		
		_state_id_activeException = 871;//moving to state throwException
		_goto_activeException(_info);
		}
}
else if (_state_id_activeException==871){
		if (1==0){}
		else if ((_occurredEvent(_event,1822/*exception_get_shared_secret_active*/))){
		
		_state_id_activeException = 872;//moving to state start
		_goto_activeException(_info);
		}
		else if ((_occurredEvent(_event,1824/*after_get_shared_secret_active*/))){
		
		_state_id_activeException = 870;//moving to state noExceptionThrown
		_goto_activeException(_info);
		}
}
}

public void _goto_activeException(String _info){
_cls_Properties0.pw.println("[activeException]MOVED ON METHODCALL: "+ _info +" TO STATE::> " + _string_activeException(_state_id_activeException, 1));
_cls_Properties0.pw.flush();
}

public String _string_activeException(int _state_id, int _mode){
switch(_state_id){
case 870: if (_mode == 0) return "noExceptionThrown"; else return "!!!SYSTEM REACHED BAD STATE!!! noExceptionThrown "+new _BadStateExceptionProperties().toString()+" ";
case 872: if (_mode == 0) return "start"; else return "start";
case 871: if (_mode == 0) return "throwException"; else return "throwException";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}
int _state_id_passiveException = 875;

public void _performLogic_passiveException(String _info, int... _event) {

_cls_Properties0.pw.println("[passiveException]AUTOMATON::> passiveException("+") STATE::>"+ _string_passiveException(_state_id_passiveException, 0));
_cls_Properties0.pw.flush();

if (0==1){}
else if (_state_id_passiveException==875){
		if (1==0){}
		else if ((_occurredEvent(_event,1826/*before_get_shared_secret_passive*/)) && (!spkFound )){
		
		_state_id_passiveException = 874;//moving to state throwException
		_goto_passiveException(_info);
		}
}
else if (_state_id_passiveException==874){
		if (1==0){}
		else if ((_occurredEvent(_event,1828/*exception_get_shared_secret_passive*/))){
		
		_state_id_passiveException = 875;//moving to state start
		_goto_passiveException(_info);
		}
		else if ((_occurredEvent(_event,1830/*after_get_shared_secret_passive*/))){
		
		_state_id_passiveException = 873;//moving to state noExceptionThrown
		_goto_passiveException(_info);
		}
}
}

public void _goto_passiveException(String _info){
_cls_Properties0.pw.println("[passiveException]MOVED ON METHODCALL: "+ _info +" TO STATE::> " + _string_passiveException(_state_id_passiveException, 1));
_cls_Properties0.pw.flush();
}

public String _string_passiveException(int _state_id, int _mode){
switch(_state_id){
case 873: if (_mode == 0) return "noExceptionThrown"; else return "!!!SYSTEM REACHED BAD STATE!!! noExceptionThrown "+new _BadStateExceptionProperties().toString()+" ";
case 875: if (_mode == 0) return "start"; else return "start";
case 874: if (_mode == 0) return "throwException"; else return "throwException";
default: return "!!!SYSTEM REACHED AN UNKNOWN STATE!!!";
}
}

public boolean _occurredEvent(int[] _events, int event){
for (int i:_events) if (i == event) return true;
return false;
}
}