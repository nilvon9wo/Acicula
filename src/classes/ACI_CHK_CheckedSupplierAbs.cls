public abstract class ACI_CHK_CheckedSupplierAbs implements ACI_CHK_CheckedSupplierIntf {
    public abstract Object get();

    public virtual ACI_TRY_Try attempt() {
    	return  ACI_CHK_Checked.now(this); 
    }
}