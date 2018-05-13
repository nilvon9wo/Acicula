public interface ACI_INTF_CollectorLikeIntf {
	ACI_INTF_CollectorLikeIntf applyToAll(ACI_FUNC_FunctionIntf function);
	ACI_INTF_CollectorLikeIntf flatApplyToAll(ACI_FUNC_FunctionIntf function);
	Boolean exists(ACI_FUNC_ObjectToBooleanIntf predicate);
	Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate);
	ACI_INTF_CollectorLikeIntf forEach(ACI_INTF_ConsumerIntf consumer);
	ACI_INTF_CollectorLikeIntf sequence(ACI_INTF_CollectorLikeIntf otherCollection);
	ACI_INTF_CollectorLikeIntf filter(ACI_FUNC_ObjectToBooleanIntf predicate);
	Object fold(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight);
	ACI_INTF_CollectorLikeIntf bidirectionalApplyToAll(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight);
}