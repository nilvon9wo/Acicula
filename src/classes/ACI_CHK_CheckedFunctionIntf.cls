public interface ACI_CHK_CheckedFunctionIntf extends ACI_FUNC_ObjectToObjectIntf{
    Object apply(Object value);
    ACI_TRY_Try lift();
} 