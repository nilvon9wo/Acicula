public class ACI_SUPL_ExceptionSupplier implements ACI_SUPL_SupplierIntf {
	Exception value;
	public ACI_SUPL_ExceptionSupplier(Exception value) {
		this.value = value;
	}
	
	public Exception get() {
		return this.value;
	}
}