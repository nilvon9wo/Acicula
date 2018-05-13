public class ACI_CHK_Checked {
	private  ACI_CHK_Checked(){
	}
	   
	public static ImmediateObjectToTryFunction lift(ACI_CHK_CheckedFunctionIntf checkedFunction) {
		return new ImmediateObjectToTryFunction(checkedFunction);
	}  

	public static DelayedObjectToTryFunction delayedLift(ACI_CHK_CheckedFunctionIntf checkedFunction) {
		return new DelayedObjectToTryFunction(checkedFunction);
	}  
	
	public static ACI_TRY_Try now(ACI_CHK_CheckedSupplierIntf checkedSupplier) {
		try {
			return ACI_TRY_Try.successful(checkedSupplier.get());
		}
		catch (Exception ex) {
			return  ACI_TRY_Try.failure(ex);
		}
	}  
	
	public static ACI_TRY_Try of (ACI_CHK_CheckedSupplierIntf checkedSupplier) {
		return now(checkedSupplier);
	}
 
	public static ACI_TRY_Try delay(ACI_CHK_CheckedSupplierIntf checkedSupplier) {
		return ACI_TRY_Try.delayed(new DelayedSupplier(checkedSupplier));
	} 
	
	// Inner Function Classes -----------------------------------------------------------------------------------------
	
	public class ImmediateObjectToTryFunction implements ACI_FUNC_ObjectToTryIntf {
		ACI_CHK_CheckedFunctionIntf checkedFunction;
		public ImmediateObjectToTryFunction(ACI_CHK_CheckedFunctionIntf checkedFunction) {
			this.checkedFunction = checkedFunction;
		}
		  
		public ACI_TRY_Try apply(Object value) {
			return now(new FunctionToSupplierFunction(checkedFunction, value));
		}
	}

	public class DelayedObjectToTryFunction implements ACI_FUNC_ObjectToTryIntf {
		ACI_CHK_CheckedFunctionIntf checkedFunction;
		public DelayedObjectToTryFunction(ACI_CHK_CheckedFunctionIntf checkedFunction) {
			this.checkedFunction = checkedFunction;
		}
		  
		public ACI_TRY_Try apply(Object value) {
			return delay(new FunctionToSupplierFunction(checkedFunction, value));
		}
	}
	
	// Inner Supplier Classes -----------------------------------------------------------------------------------------
	
	public class FunctionToSupplierFunction implements ACI_CHK_CheckedSupplierIntf {
		ACI_CHK_CheckedFunctionIntf checkedFunction;
		Object value;
		public FunctionToSupplierFunction(ACI_CHK_CheckedFunctionIntf checkedFunction, Object value) {
			this.checkedFunction = checkedFunction;
			this.value = value;
		}
		
		public Object get() {
			return this.checkedFunction.apply(value);
		}
	}

	public class DelayedSupplier implements ACI_SUPL_SupplierIntf {
		ACI_CHK_CheckedSupplierIntf checkedSupplier;
		public DelayedSupplier(ACI_CHK_CheckedSupplierIntf checkedSupplier) {
			this.checkedSupplier = checkedSupplier;
		}
		
		public Object get() {
			return this.checkedSupplier.get(); 
		}
	}
}