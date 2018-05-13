public class ACI_OPT_Some extends ACI_OPT_Option {
	private final Object value; 
	 
	public ACI_OPT_Some(Object value) {  
	   	this.value = value; 
	}
	
	public override Object get() { return this.value; }
    public override Object getOrElse(Object orElse) { return this.get(); }
    public override ACI_OPT_Option orElse(Object orElse) { return this; }
    public override Object getOrError(ACI_OPT_ExceptionMessageSupplierIntf errorMessageFunction) { return this.value; }
    public override Object getOrThrow(ACI_OPT_ExceptionSupplierIntf errorFunction) { return this.value; }
    
    public override Boolean isDefined() { return true; }

    public override Boolean exists(ACI_FUNC_ObjectToBooleanIntf trueExpression) { 
    	return trueExpression.apply(this.value); 
    }

    public override ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf trueExpression) { 
    	return !this.exists(trueExpression) 
        	? none() 
        	: this;   
    } 

    public override void foreach(ACI_FUNC_ObjectToVoidIntf unitExpression) {
	    unitExpression.apply(this.get());
    }

    public override ACI_OPT_Option nestedMap(ACI_FUNC_ObjectToOptionIntf mapExpression) {
       	return some(mapExpression.apply(this.get()));
    }

    public override ACI_OPT_Option flatMap(ACI_FUNC_ObjectToOptionIntf flatMapExpression) {
       	return flatMapExpression.apply(this.get());  
    }

    public override List<Object> toList() {
        return new List<Object>{
        	this.get()
        };
    }
 
    public override String toString() {
        return 'Some(' + this.value + ')';
    }    
}