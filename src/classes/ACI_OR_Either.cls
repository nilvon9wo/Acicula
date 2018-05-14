public abstract class ACI_OR_Either implements ACI_COL_CollectorLikeIntf, 
			ACI_INTF_SerializableIntf,
			ACI_OPT_OptionableIntf,
			ACI_STM_Streamable {
    private static final long serialVersionUID = -1L; 
 
    protected ACI_OR_Either() {
    } 
       
    // Abstract --------------------------------------------------------------------------------------------------------
    
    public abstract Boolean isLeft();
    public abstract Boolean isRight();
    public abstract ACI_OR_Either swap();
    public abstract Object fold(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight);
    public abstract ACI_OR_Either bidirectionalApplyToAll(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight);

	// Left --------------------------------------------------------------------------------------------------------------
     
    public static ACI_OR_Either left(Object value) {
    	return new ACI_OR_Left(ACI_UTIL_ValueValidator.requireNotNull(value, 'Left value can not be null.'));
    }

    public ACI_OR_LeftProjection left() {
    	return new ACI_OR_LeftProjection(this); 
    }

    public Object leftOr(ACI_FUNC_ObjectToObjectIntf rightTransformer) {
    	return (this.left().isDefined())
    		? this.left().get() 
    		: rightTransformer.apply(this.right().get());
    }  
    
    public ACI_OR_Either leftMap(ACI_FUNC_ObjectToObjectIntf function) {
    	return this.left().applyToAll(function);
    } 

	public virtual Object getLeft() {
		throw new ACI_EXCP_NoSuchElementException('This instance has no Left element');
	}
 
	// Right --------------------------------------------------------------------------------------------------------------
 
    public static ACI_OR_Either right(Object value) { 
    	return new ACI_OR_Right(ACI_UTIL_ValueValidator.requireNotNull(value, 'Right value can not be null.'));
    }

    public ACI_OR_RightProjection right() {
    	return new ACI_OR_RightProjection(this);
    } 
    
    public Object rightOr(ACI_FUNC_ObjectToObjectIntf leftTransformer) {
    	return (this.right().isDefined())
    		? this.right().get()
    		: leftTransformer.apply(this.left().get());
    }

    public ACI_OR_Either rightMap(ACI_FUNC_ObjectToObjectIntf function) {
    	return this.right().applyToAll(function);
    }

	public virtual Object getRight() {
		throw new ACI_EXCP_NoSuchElementException('This instance has no Right element');
	}
 
	// Getters --------------------------------------------------------------------------------------------------------------

	public Object getOr(ACI_SUPL_SupplierIntf supplier) {
		return this.right().getOr(supplier); 
	} 

	public Object getOrElse(Object value) {
		return this.right().getOrElse(value); 
	} 

	public Object getOrNull() {
		return this.right().getOrNull(); 
	}  

	public Object getOrError(ACI_SUPL_StringSupplier errorMessageFunction) {
		return this.right().getOrError(errorMessageFunction); 
	} 
 
	public Object getOrThrow(ACI_SUPL_ExceptionSupplier ifUndefined) {
		return this.right().getOrThrow(ifUndefined); 
	} 

	// Collectors --------------------------------------------------------------------------------------------------------------

	public ACI_OR_Either applyToAll(ACI_FUNC_ObjectToObjectIntf function) {
		return this.right().applyToAll(function);
	}

	public ACI_OR_Either flatApplyToAll(ACI_FUNC_ObjectToObjectIntf function) {
		return this.right().flatApplyToAll(function);
	}
	
	public Boolean exists(ACI_FUNC_ObjectToBooleanIntf predicate) {
		return this.right().exists(predicate);
	}  

	public Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate) {
		return this.right().forAll(predicate);
	}
	
	public ACI_OR_Either forEach(ACI_INTF_ConsumerIntf consumer) {
		return this.right().forEach(consumer);
	}
	
	public ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf predicate) {
		return this.right().filter(predicate);
	}

	// Alternatives --------------------------------------------------------------------------------------------------------------
	
	public ACI_OR_Either orElse(ACI_OR_Either orElse) {
		return this.orElse(ACI_SUPL_SupplierHelper.createInstanceFor((Object) orElse));  
	}

	public ACI_OR_Either orElse(ACI_SUPL_SupplierIntf orElse) {
		if (this.right().isDefined()) {
			return new ACI_OR_Right(this.right().get());
		}
		
		return (ACI_OR_Either) orElse.get();
	}

	// Transformers --------------------------------------------------------------------------------------------------------------

	public ACI_OPT_Option toOptional() {
		return this.right().toOptional();
	}
	
	public ACI_OPT_Option toOption() {
		return this.right().toOption();
	}

	public ACI_STM_StreamIntf toStream() {
		return this.right().toStream(); 
	}

	public ACI_OR_Either sequence(ACI_OR_Either either) {
		return this.right().sequence(either);
	}

	// Placeholders ---------------------------------------------------------------------------------------------------------
	
	public virtual ACI_COL_CollectorLikeIntf sequence(ACI_COL_CollectorLikeIntf either) {
		throw new ACI_EXCP_NotImplementedException('Sequence has not been implemented for Either ... yet.');
	} 

	public ACI_OR_Either apply(ACI_OR_Either either) {
		return either.right().flatApplyToAll(new FlatApplyToAll(this));
	} 
	
	public class FlatApplyToAll implements ACI_FUNC_ObjectToObjectIntf {
		ACI_OR_Either either;
		public FlatApplyToAll (ACI_OR_Either either) {
			this.either = either;
		} 
		
		public ACI_OR_Either apply(Object applyToAll) {
			return this.either.flatApplyToAll((ACI_FUNC_ObjectToObjectIntf) applyToAll); 
		}
	}	
}