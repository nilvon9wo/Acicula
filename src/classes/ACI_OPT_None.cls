public class ACI_OPT_None extends ACI_OPT_Option {
	public ACI_OPT_None() {}    
	
    public override Object get() { 
    	throw new ACI_EXCP_UnsupportedOperationException('Cannot resolve value on None');
    }
 
    public override Object getOrElse(Object orElse) { return orElse; }
	public override Object getOrElse(ACI_SUPL_SupplierIntf supplier) { return supplier.get(); }  
    public override Object getOrError(ACI_SUPL_StringSupplier errorMessageFunction) { 
    	throw new ACI_EXCP_AssertionException(errorMessageFunction.get());  
	}
	public override Object getOrNull(){ return null; }  
	
    public override Object getOrThrow(ACI_SUPL_ExceptionSupplier errorFunction) { 
    	throw errorFunction.get(); 
    }
    public override ACI_OPT_Option orElse(Object orElse) { return some(orElse); }
	
    
    public override Boolean isDefined() { return false; }
    public override Boolean exists(ACI_FUNC_ObjectToBooleanIntf trueExpression) { return false; }
    public override ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf trueExpression) { return this; }
    public override void forEach(ACI_FUNC_ObjectToVoidIntf unitExpression) { }

    public override ACI_OPT_Option nestedMap(ACI_FUNC_ObjectToOptionIntf mapExpression) { return none(); }
    public override ACI_OPT_Option flatMap(ACI_FUNC_ObjectToOptionIntf flatMapExpression) { return none(); }
	    
	public override List<Object> toList() { 
	   	return new List<Object>(); 
	} 

	public override String toString() { return 'None'; }  
}