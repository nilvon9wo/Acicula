public class ACI_FUNC_FunctionHelpers {
    private ACI_FUNC_FunctionHelpers(){}
    
    public static ACI_FUNC_ObjectToObjectIntf compose(ACI_FUNC_ObjectToObjectIntf f, ACI_FUNC_ObjectToObjectIntf g) {
    	return new ACI_FUNC_Composition(f, g);
    }
    
    public static ACI_FUNC_ObjectToObjectIntf performWithin(ACI_FUNC_MultistepFunctionIntf outerFunction, ACI_FUNC_ObjectToObjectIntf innerFunction) {
    	return new FunctionWithinFunction(outerFunction, innerFunction);
    }
    
    public class FunctionWithinFunction implements ACI_FUNC_ObjectToObjectIntf {
    	ACI_FUNC_MultistepFunctionIntf outerFunction;
    	ACI_FUNC_ObjectToObjectIntf innerFunction;
    	public FunctionWithinFunction(ACI_FUNC_MultistepFunctionIntf outerFunction, ACI_FUNC_ObjectToObjectIntf innerFunction) {
    		this.outerFunction = outerFunction;
    		this.innerFunction = innerFunction;
    	}
    	
    	public ACI_FUNC_ObjectToObjectIntf apply(Object value) {
    		return (ACI_FUNC_ObjectToObjectIntf) outerFunction.andThen(innerFunction.apply(value))
    			.apply(value);
    	}
    }
    
}  