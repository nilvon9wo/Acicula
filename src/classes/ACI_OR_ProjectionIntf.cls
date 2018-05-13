public interface ACI_OR_ProjectionIntf extends ACI_INTF_MaybeIntf{
    ACI_OR_Either either();
    ACI_OPT_Option toOption();
    ACI_STM_StreamIntf toStream();
    Object when(ACI_FUNC_ObjectToObjectIntf objectToObjectFunction);
}