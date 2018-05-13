public abstract class ACI_OPT_Option  
		implements ACI_INTF_CollectorLikeIntf,
			ACI_INTF_MaybeIntf,
			ACI_OPT_OptionableIntf,
			ACI_STM_Streamable,
			Iterable<Object>  
		{

	
	public Object get() { return null; } // TODO
	public Object getOrElse(Object other) { return null; } // TODO
	public Object getOrElse(ACI_SUPL_SupplierIntf supplier) { return null; } // TODO  
	public Object getOrNull() { return null; } // TODO
	public Object getOrError(ACI_SUPL_StringSupplier errorMessageFunction) { return null; } // TODO 
	public Object getOrThrow(ACI_SUPL_ExceptionSupplier errorFunction) { return null; } // TODO 
	public Boolean isDefined() { return null; } // TODO
	public Boolean isEmpty() { return null; } // TODO

	public ACI_OPT_Option applyToAll(ACI_FUNC_FunctionIntf function) { return null; } // TODO
	public ACI_OPT_Option flatApplyToAll(ACI_FUNC_FunctionIntf function) { return null; } // TODO
	public Boolean exists(ACI_FUNC_ObjectToBooleanIntf predicate) { return null; } // TODO
	public Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate) { return null; } // TODO
	public ACI_OPT_Option forEach(ACI_INTF_ConsumerIntf consumer) { return null; } // TODO

	public ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf predicate) { return null; } // TODO
	public Object fold(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight) { return null; } // TODO
	public ACI_OPT_Option bidirectionalApplyToAll(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight) { return null; } // TODO
	public Iterator<Object> iterator() { return null; } // TODO
	public ACI_OPT_Option toOption() { return null; } // TODO
	public ACI_OPT_Option toOptional() { return null; } // TODO
	public ACI_STM_StreamIntf toStream() { return null; } // TODO

	// Placeholders ---------------------------------------------------------------------------------------------------------
	
	public virtual ACI_INTF_CollectorLikeIntf sequence(ACI_INTF_CollectorLikeIntf either) {
		throw new ACI_EXCP_NotImplementedException('Sequence has not been implemented for Option ... yet.');
	} 
	 
}