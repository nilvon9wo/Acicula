public abstract class ACI_TRY_Try {
    protected ACI_TRY_Try() {
    }

    public abstract Boolean isSuccess();
    public abstract Boolean isFailure();

    public abstract Object get(); 
    public abstract Object checkedGet();

    public abstract void forEach(ACI_FUNC_ObjectToVoidIntf objectToVoidFunction);
    public abstract ACI_TRY_Try nestedMap(ACI_FUNC_ObjectToFailableSupplierIntf objectToFailableSupplier);
    public abstract ACI_TRY_Try flatMap(ACI_FUNC_ObjectToFailableSupplierIntf objectToFailableSupplier);
    public abstract ACI_TRY_Try filter(ACI_FUNC_ObjectToBooleanIntf objectToBooleanFunction);
    public abstract ACI_TRY_Try recover(ACI_FUNC_ObjectToFailableSupplierIntf recoverFunction);
    public abstract ACI_TRY_Try recoverWith(ACI_FUNC_ObjectToFailableSupplierIntf recoverFunction);
    public abstract ACI_TRY_Try failed();

    public abstract ACI_OPT_Option toOptional(); 
    public abstract Object getOrElse(Object defaultValue); 
    public abstract ACI_TRY_Try orElse(ACI_TRY_Try defaultValue);

    public abstract ACI_TRY_Try transform(
    		ACI_FUNC_ObjectToFailableSupplierIntf successFunction, 
    		ACI_FUNC_ObjectToFailableSupplierIntf failureFunction
    	);

    public static ACI_TRY_Try apply(ACI_SUPL_FailableSupplierIntf supplier) {
        try {
            return new ACI_TRY_Success(supplier.get());
        } catch (Exception ex) {
            return new ACI_TRY_Failure(ex); 
        } 
    }  
 
    public static ACI_TRY_Try join(ACI_TRY_Try tryValue) { 
    	ACI_UTIL_ValueValidator.requireNotNull(tryValue, 'tryValue is null');
    	if (tryValue instanceof ACI_TRY_Success && tryValue.get() instanceof ACI_TRY_Try) {
    		return (ACI_TRY_Try) tryValue.get();
    	}
    	return tryValue;
    }

    // TODO;
    public static ACI_TRY_Try successful(Object value) {
    	return null; // TODO;
    }

    public static ACI_TRY_Try failure(Exception ex) {
    	return null; // TODO;
    }
    
    public static ACI_TRY_Try delayed(ACI_SUPL_SupplierIntf supplier) {
    	return null; // TODO;
    }
}