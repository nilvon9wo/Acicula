public class ACI_SUPL_SupplierHelper {
	public static ACI_SUPL_SupplierIntf createInstanceFor(Object value) {
		return new ACI_SUPL_ObjectSupplier(value); 
	}     
	
	public static ACI_SUPL_SupplierIntf compose(ACI_FUNC_ObjectToSupplierIntf transform, ACI_SUPL_SupplierIntf firstSupplier) {
		return transform.apply(firstSupplier); 
	}
}