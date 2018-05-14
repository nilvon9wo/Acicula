public abstract class ACI_OR_ProjectionAbs 
		implements ACI_COL_CollectorLikeIntf, 
			ACI_OPT_OptionableIntf,
			ACI_OR_ProjectionIntf, 
			ACI_STM_Streamable,  
			Iterable<Object> { 
				
	protected ACI_OR_Either either;
	 
	public ACI_OR_ProjectionAbs(ACI_OR_Either either) {
		this.either = either;
	}
	 
	protected ACI_OR_ProjectionAbs() {
	}

   	public abstract Boolean isDefined();   
    public abstract Object get();   
 	public abstract ACI_OR_Either applyToAll(ACI_FUNC_ObjectToObjectIntf function);
	public abstract ACI_OR_Either flatApplyToAll(ACI_FUNC_ObjectToObjectIntf function);
	public abstract ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf predicate); 
	public abstract ACI_OR_Either sequence(ACI_OR_Either either);
    public abstract Object when(ACI_FUNC_ObjectToObjectIntf objectToObjectFunction);

	// Getters ------------------------------------------------------------------------------------------

   	public Object getOrNull(){
		return this.isDefined()
			? this.get()
			: null;  
   	} 

   	public Object getOrError(ACI_SUPL_StringSupplier errorMessageFunction){
		return toOption().getOrError(errorMessageFunction); 
   	}

   	public Object getOrThrow(ACI_SUPL_ExceptionSupplier errorFunction){
		return toOption().getOrThrow(errorFunction); 
   	}

    public Object getOr(ACI_SUPL_SupplierIntf supplier){
		return this.isDefined()
			? this.get()
			: supplier.get(); 
   	} 
   	
   	public Object getOrElse(Object value){
		return this.isDefined()
			? this.get()
			: value; 
   	} 
   	

	// Common ---------------------------------------------------------------------------

	public ACI_OR_Either either() { 
		return this.either; 
	}
	
	public Iterator<Object> iterator() { 
		return toOption().iterator();   
	} 

    public Boolean isEmpty() {
    	 return !this.isDefined(); 
    } 

	public ACI_OPT_Option toOption() { 
		 return this.isDefined()
		 	? (ACI_OPT_Option) new ACI_OPT_Some(this.get())
		 	: (ACI_OPT_Option) new ACI_OPT_None();
	}

	public ACI_OPT_Option toOptional() { 
		return this.toOption().toOptional(); 
	}

	public ACI_STM_StreamIntf toStream() { 
		return this.toOption().toStream(); 
	}

	public Boolean exists(ACI_FUNC_ObjectToBooleanIntf predicate) { 
		return this.isDefined() && predicate.apply(this.get()); 
	}

	public Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate) {
		return this.isEmpty() || predicate.apply(this.get()); 
	}

	public ACI_OR_Either forEach(ACI_INTF_ConsumerIntf consumer) {
		if (this.isDefined()) {
			consumer.accept(this.get());
		}
		return this.either;
	}
	
	// Placeholders ---------------------------------------------------------------------------------------------------------

	public virtual ACI_COL_CollectorLikeIntf sequence(ACI_COL_CollectorLikeIntf either) {
		throw new ACI_EXCP_NotImplementedException('Sequence has not been implemented for Projections ... yet.');
	} 
	
	public virtual Object fold(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight)  {
		throw new ACI_EXCP_NotImplementedException('Fold has not been implemented for Projections ... yet.');
	} 
	
	public virtual ACI_OR_Either bidirectionalApplyToAll(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight)  {
		throw new ACI_EXCP_NotImplementedException('Bidirectional Apply-To-All has not been implemented for Projections ... yet.');
	} 
	
	
}