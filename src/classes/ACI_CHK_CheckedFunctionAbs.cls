public abstract class ACI_CHK_CheckedFunctionAbs implements ACI_CHK_CheckedFunctionIntf {
    public abstract Object apply(ACI_FUNC_FunctionIntf function);
    public virtual ACI_TRY_Try lift() {
    	return  ACI_CHK_Checked.lift(this);
    }
}