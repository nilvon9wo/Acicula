public interface ACI_CHK_CheckedFunctionIntf extends ACI_FUNC_FunctionIntf{
    Object apply(Object value);
    ACI_TRY_Try lift();
}