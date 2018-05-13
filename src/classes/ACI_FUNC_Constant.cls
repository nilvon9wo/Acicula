public class ACI_FUNC_Constant implements ACI_FUNC_FunctionIntf {
	Object returnValue;
	public ACI_FUNC_Constant(Object returnValue) {
		this.returnValue = returnValue;
	}
	
    public Object apply(Object value) {
    	return this.returnValue;
    }
}