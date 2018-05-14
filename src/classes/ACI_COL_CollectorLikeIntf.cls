public interface ACI_COL_CollectorLikeIntf {
	ACI_COL_CollectorLikeIntf applyToAll(ACI_FUNC_ObjectToObjectIntf function);
	ACI_COL_CollectorLikeIntf flatApplyToAll(ACI_FUNC_ObjectToObjectIntf function);
	Boolean exists(ACI_FUNC_ObjectToBooleanIntf predicate);
	Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate);
	ACI_COL_CollectorLikeIntf forEach(ACI_INTF_ConsumerIntf consumer);
	ACI_COL_CollectorLikeIntf sequence(ACI_COL_CollectorLikeIntf otherCollection);
	ACI_COL_CollectorLikeIntf filter(ACI_FUNC_ObjectToBooleanIntf predicate);
	Object fold(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight);
	ACI_COL_CollectorLikeIntf bidirectionalApplyToAll(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight);
} 