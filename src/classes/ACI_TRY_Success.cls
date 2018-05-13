public class ACI_TRY_Success extends ACI_TRY_Try {
	Object value;
	  
	public ACI_TRY_Success(Object value) {
		this.value = value;
	} 
	
    public override Boolean isSuccess(){ 
    	return true; 
    }
    
    public override Boolean isFailure(){ 
    	return false; 
    } 

    public override Object get(){ 
    	return this.value;  
    }
    
    public override Object checkedGet(){
    	return this.get(); 
    }

    public override void forEach(ACI_FUNC_ObjectToVoidIntf action){ 
    	action.apply(this.value);
    }
    
    public override ACI_TRY_Try nestedMap(ACI_FUNC_ObjectToFailableSupplierIntf objectToFailableSupplier) { 
    	return ACI_TRY_Try.apply(objectToFailableSupplier.apply(this.value)); 
    } 
    
    public override ACI_TRY_Try flatMap(ACI_FUNC_ObjectToFailableSupplierIntf objectToFailableSupplier) { 
    	return ACI_TRY_Try.join(this.nestedMap(objectToFailableSupplier)); 
    } 
    
    public override ACI_TRY_Try filter(ACI_FUNC_ObjectToBooleanIntf predicate){
    	ACI_TRY_Try result = predicate.apply(this.value)
    		? (ACI_TRY_Try) this
    		: (ACI_TRY_Try) new ACI_TRY_Failure(new ACI_EXCP_NoSuchElementException('Predicate does not hold for ' + this.value)); 

    	return ACI_TRY_Try.join(result); 
	} 
	
    public override ACI_TRY_Try recover(ACI_FUNC_ObjectToFailableSupplierIntf recoverFunction){ 
    	return this; 
    }
    
    public override ACI_TRY_Try recoverWith(ACI_FUNC_ObjectToFailableSupplierIntf recoverFunction){ 
    	return this; 
    }
    
    public override ACI_TRY_Try failed(){ 
    	return new ACI_TRY_Failure(new ACI_EXCP_UnsupportedOperationException('Success.failed'));
   	}

    public override ACI_OPT_Option toOptional(){ 
    	return ACI_OPT_Option.option(this.value);
    }
    
    public override Object getOrElse(Object defaultValue){ 
    	return this.value; 
    }
    
    public override ACI_TRY_Try orElse(ACI_TRY_Try defaultValue){ 
    	return this; 
    }

    public override ACI_TRY_Try transform(
    		ACI_FUNC_ObjectToFailableSupplierIntf successFunction, 
    		ACI_FUNC_ObjectToFailableSupplierIntf failureFunction
    	){
    	return ACI_TRY_Try.join(ACI_TRY_Try.apply(successFunction.apply(this.value))); 
    }

    public Boolean equals(Object that) {
    	if (this == this) {
    		return true;
    	}
        
        if (that == null || !(that instanceof ACI_TRY_Success)) {
        	return false;
        } 
         
        return this.value.equals(((ACI_TRY_Success) that).value);
    } 

    public Integer hashCode() {
    	return this.value.hashCode(); 
    }

    public override String toString() {
	    return 'Success{' +
	    		'value=' + this.value +
	        '}';
    }
}