//Source: Axel Curmi

package rv_protocol.event_replayer;

import java.util.List;
import java.util.Map;

import com.google.gson.annotations.SerializedName;

public class Event{
    private long id;
    private long timestamp;
    private String when;
    private String what;
	private Map<String, Object> watch;

    @SerializedName("func_args")
	private List<Object> functionArgs;
	
	@SerializedName("func_kwargs")
	private Map<String, Object> functionKwargs;
	
	public Event(long timestamp, String when, String what, 
			Map<String, Object> watch, List<Object> functionArgs,
			Map<String, Object> functionKwargs) {
		this.timestamp = timestamp;
		this.when = when;
		this.what = what;
		this.watch = watch;
		this.functionArgs = functionArgs;
		this.functionKwargs = functionKwargs;
	}

	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public long getTimestamp() {
		return timestamp;
	}

	public String getWhen() {
		return when;
	}

	public String getWhat() {
		return what;
	}

	public Map<String, Object> getWatch() {
		return watch;
	}

	public List<Object> getFunctionArgs() {
		return functionArgs;
	}
	
	public Map<String, Object> getFunctionKwargs() {
		return functionKwargs;
	}
	
	public void replay() {
		System.out.println(String.format("[%d] %s %s",
				id, when, what));
	}

	@Override
	public String toString() {
		return String.format("[%d] %s %s", id, when, what);
	}

}