public class ACI_SUPL_StringSupplier implements ACI_SUPL_SupplierIntf {
	String value;
	public ACI_SUPL_StringSupplier(String value) {
		this.value = value;
	}
	
	public String get() {
		return this.value;
	}
}