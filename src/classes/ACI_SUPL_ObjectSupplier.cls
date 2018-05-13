public class ACI_SUPL_ObjectSupplier implements ACI_SUPL_SupplierIntf {
	Object value;
	public ACI_SUPL_ObjectSupplier(Object value) {
		this.value = value;
	}
	
	public Object get() {
		return this.value;
	}
}