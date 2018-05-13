public abstract class ACI_OPT_Option  
		implements ACI_COL_CollectorLikeIntf,
			ACI_INTF_MaybeIntf,
			ACI_OPT_OptionableIntf,
			ACI_STM_Streamable,
			Iterable<Object>  
		{

	protected ACI_OPT_Option() {} 

    public abstract Object get(); 
    public abstract Object getOrElse(Object orElse);
    public abstract ACI_OPT_Option orElse(Object orElse);
    public abstract Object getOrError(ACI_OPT_ExceptionMessageSupplierIntf errorMessageFunction);
    public abstract Object getOrThrow(ACI_OPT_ExceptionSupplierIntf errorFunction);

    public abstract Boolean isDefined(); 
    public Boolean isEmpty() { return !isDefined(); }
    public abstract Boolean exists(ACI_FUNC_ObjectToBooleanIntf trueExpression);
    public abstract ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf trueExpression);

    public abstract List<Object> toList();
    public Iterator<Object> iterator() { 
    	return toList().iterator();  
    }   

    public abstract void foreach(ACI_FUNC_ObjectToVoidIntf unitExpression);

    public abstract ACI_OPT_Option nestedMap(ACI_FUNC_ObjectToOptionIntf mapExpression);
    public abstract ACI_OPT_Option flatMap(ACI_FUNC_ObjectToOptionIntf flatMapExpression);
 
    public static ACI_OPT_Option some(Object value) { 
    	return new ACI_OPT_Some(value); 
    }  
    public static ACI_OPT_Option none() {  
    	return new ACI_OPT_None(); 
    }

    public static ACI_OPT_Option option(Object value) { 
    	return value == null 
    		? ACI_OPT_Option.none() 
    		: ACI_OPT_Option.some(value); 
    }
	
	public Object getOrElse(ACI_SUPL_SupplierIntf supplier) { return null; } // TODO  
	public Object getOrNull() { return null; } // TODO
	public Object getOrError(ACI_SUPL_StringSupplier errorMessageFunction) { return null; } // TODO 
	public Object getOrThrow(ACI_SUPL_ExceptionSupplier errorFunction) { return null; } // TODO 

	public ACI_OPT_Option applyToAll(ACI_FUNC_FunctionIntf function) { return null; } // TODO
	public ACI_OPT_Option flatApplyToAll(ACI_FUNC_FunctionIntf function) { return null; } // TODO
	public Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate) { return null; } // TODO
	public ACI_OPT_Option forEach(ACI_INTF_ConsumerIntf consumer) { return null; } // TODO

	public Object fold(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight) { return null; } // TODO
	public ACI_OPT_Option bidirectionalApplyToAll(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight) { return null; } // TODO
	public ACI_OPT_Option toOption() { return null; } // TODO
	public ACI_OPT_Option toOptional() { return null; } // TODO
	public ACI_STM_StreamIntf toStream() { return null; } // TODO

	// Placeholders ---------------------------------------------------------------------------------------------------------
	
	public virtual ACI_COL_CollectorLikeIntf sequence(ACI_COL_CollectorLikeIntf either) {
		throw new ACI_EXCP_NotImplementedException('Sequence has not been implemented for Option ... yet.');
	} 
	 
}