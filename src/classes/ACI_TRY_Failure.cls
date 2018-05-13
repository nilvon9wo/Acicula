public class ACI_TRY_Failure extends ACI_TRY_Try { 
	Exception ex;
	ACI_EXCP_GetOfFailureException unckeckedException;
	 
	public ACI_TRY_Failure(Exception ex) { 
		this.ex = ex;
		this.unckeckedException = new ACI_EXCP_GetOfFailureException(ex);
	} 
	
    public override Boolean isSuccess(){ 
    	return false; 
    }
    
    public override Boolean isFailure(){ 
    	return true; 
    }

    public override Object get(){
    	throw this.unckeckedException; 
	}
	
    public override Object checkedGet(){
    	throw this.ex;
	} 

    public override void forEach(ACI_FUNC_ObjectToVoidIntf objectToVoidFunction)  {
    }
    
    public override ACI_TRY_Try nestedMap(ACI_FUNC_ObjectToFailableSupplierIntf objectToFailableSupplier){ 
    	return this; 
    } 
    
    public override ACI_TRY_Try flatMap(ACI_FUNC_ObjectToFailableSupplierIntf objectToFailableSupplier){
    	return this; 
    }
    
    public override ACI_TRY_Try filter(ACI_FUNC_ObjectToBooleanIntf objectToBooleanFunction){
    	return this; 
    } 
    
    public override ACI_TRY_Try recover(ACI_FUNC_ObjectToFailableSupplierIntf recoverFunction){ 
    	return ACI_TRY_Try.apply(recoverFunction.apply(ex)); 
    }
    
    public override ACI_TRY_Try recoverWith(ACI_FUNC_ObjectToFailableSupplierIntf recoverFunction){
    	return ACI_TRY_Try.join(this.recover(recoverFunction)); 
   	}
    public override ACI_TRY_Try failed(){ 
    	return new ACI_TRY_Success(this.ex); 
    }

    public override ACI_OPT_Option toOptional(){ 
    	return new ACI_OPT_None(); 
    }
    
    public override Object getOrElse(Object defaultValue){ 
    	return defaultValue; 
    }
    
    public override ACI_TRY_Try orElse(ACI_TRY_Try defaultValue){ 
    	return defaultValue; 
    }

    public override ACI_TRY_Try transform(
    		ACI_FUNC_ObjectToFailableSupplierIntf successFunction, 
    		ACI_FUNC_ObjectToFailableSupplierIntf failureFunction
    	){
    	return ACI_TRY_Try.join(ACI_TRY_Try.apply(failureFunction.apply(this.ex))); 
    }

    public Boolean equals(Object that) {
    	if (this == this) {
    		return true;
    	}
        
        if (that == null || !(that instanceof ACI_TRY_Failure)) {
        	return false;
        } 
         
        return ((Object) this.ex).equals(((ACI_TRY_Failure) that).ex);
    } 

    public Integer hashCode() {
    	return ((Object) this.ex).hashCode(); 
    }

    public override String toString() {
	    return 'Failure{' + 
	    		'exception=' + this.ex +
	        '}';
    }
}