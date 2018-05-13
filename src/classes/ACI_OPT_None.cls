public class ACI_OPT_None extends ACI_OPT_Option {
	public ACI_OPT_None() {}    
	
    public override Object get() { 
    	throw new ACI_OPT_UnsupportedOperationException('Cannot resolve value on None');
    }
 
    public override Object getOrElse(Object orElse) { return orElse; }
    public override ACI_OPT_Option orElse(Object orElse) { return some(orElse); }
    public override Object getOrError(ACI_OPT_ExceptionMessageSupplierIntf errorMessageFunction) { 
    	throw new ACI_OPT_AssertionException(errorMessageFunction.get()); 
	}
    public override Object getOrThrow(ACI_OPT_ExceptionSupplierIntf errorFunction) { 
    	throw errorFunction.get(); 
    }
	
    
    public override Boolean isDefined() { return false; }
    public override Boolean exists(ACI_FUNC_ObjectToBooleanIntf trueExpression) { return false; }
    public override ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf trueExpression) { return this; }
    public override void foreach(ACI_FUNC_ObjectToVoidIntf unitExpression) { }

    public override ACI_OPT_Option nestedMap(ACI_FUNC_ObjectToOptionIntf mapExpression) { return none(); }
    public override ACI_OPT_Option flatMap(ACI_FUNC_ObjectToOptionIntf flatMapExpression) { return none(); }
	    
	public override List<Object> toList() { 
	   	return new List<Object>(); 
	}

	public override String toString() { return 'None'; }  
}