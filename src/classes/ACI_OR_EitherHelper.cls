public class ACI_OR_EitherHelper {
    private ACI_OR_EitherHelper() {
    }
    
    public static Object meld (ACI_OR_Either either) {
    	return (either.isLeft())
    		? either.left().get()
    		: either.right().get();
    }
    
    public static ACI_OR_Either conditional(Boolean predicate, Object left, Object right) {
    	return predicate
    		? ACI_OR_Either.right(right)
    		: ACI_OR_Either.left(left);
    }
     
    public static Object getOrThrow(ACI_OR_Either either) {
    	if (either.isLeft()) { 
    		throw (Exception) either.left().get(); 
    	}
    	
    	return either.right().get();  
    } 
     
    // Left -----------------------------------------------------------------------------------
    
    public static ACI_FUNC_EitherToBooleanIntf isLeft() {
    	return new LeftTest(); 
    }

    public class LeftTest implements ACI_FUNC_EitherToBooleanIntf {
    	public Boolean apply(ACI_OR_Either either) { 
    		return either.isLeft();
    	}
    }

    public static ACI_FUNC_EitherToOptionIntf leftMapper() {
    	return new LeftOptionMapper();
    }

    public class LeftOptionMapper implements ACI_FUNC_EitherToOptionIntf {
    	public ACI_OPT_Option apply(ACI_OR_Either either) { 
    		return either.left().toOption();
    	}
    }
    
    public static ACI_FUNC_ObjectToEitherIntf toLeft() {
    	return (ACI_FUNC_ObjectToEitherIntf) new ToLeft();
    }

    public class ToLeft implements ACI_FUNC_ObjectToEitherIntf {
    	public ACI_OR_Left apply(Object value) { 
    		return (ACI_OR_Left) ACI_OR_Either.left(value);
    	}
    } 

    public static ACI_SUPL_SupplierIntf toLeft(Object value) {
    	return ACI_SUPL_SupplierHelper.compose(
    		(ACI_FUNC_ObjectToSupplierIntf) new ToSupplierEither(new ToLeft ()), 
    		ACI_SUPL_SupplierHelper.createInstanceFor(value)
    	);
    } 

    public static ACI_OR_Either upcastLeft(ACI_OR_Either either) {
    	return either.left().applyToAll(new ACI_Function_Identity()); 
    } 
    
    public static Iterable<Object> filterLeft(Iterable<ACI_OR_Either> iterable) {
    	return ACI_ITER_IterableHelper.collect(iterable, (ACI_FUNC_ObjectToOptionIntf) new LeftEitherToOptionMapper());
    }
     
    public class LeftEitherToOptionMapper implements ACI_FUNC_ObjectToOptionIntf{
    	public ACI_OPT_Option apply(Object value) { 
    		return ACI_OR_EitherHelper.leftMapper().apply((ACI_OR_Either) value);
    	}
    }
    
    // Right -------------------------------------------------------------------------------------

    public static ACI_FUNC_EitherToBooleanIntf isRight() {
    	return new RightTest();  
    }

    public class RightTest implements ACI_FUNC_EitherToBooleanIntf {
    	public Boolean apply(ACI_OR_Either either) { 
    		return either.isRight();
    	}
    }
    
    public static ACI_FUNC_EitherToOptionIntf rightMapper() {
    	return new RightOptionMapper();
    }

    public class RightOptionMapper implements ACI_FUNC_EitherToOptionIntf {
    	public ACI_OPT_Option apply(ACI_OR_Either either) { 
    		return either.right().toOption();
    	}
    }

    public static ACI_FUNC_ObjectToEitherIntf toRight() {
    	return (ACI_FUNC_ObjectToEitherIntf) new ToRight();
    }

    public class ToRight implements ACI_FUNC_ObjectToEitherIntf {
    	public ACI_OR_Right apply(Object value) { 
    		return (ACI_OR_Right) ACI_OR_Either.right(value);
    	}
    }

    public static ACI_SUPL_SupplierIntf toRight(Object value) { 
    	return ACI_SUPL_SupplierHelper.compose(
    		(ACI_FUNC_ObjectToSupplierIntf) new ToSupplierEither(new ToRight()), 
    		ACI_SUPL_SupplierHelper.createInstanceFor(value)
    	);
    } 
    
    public static ACI_OR_Either upcastRight(ACI_OR_Either either) {
    	return either.right().applyToAll(new ACI_Function_Identity()); 
    } 

    public static Iterable<Object> filterRight(Iterable<ACI_OR_Either> iterable) {
    	return ACI_ITER_IterableHelper.collect(iterable, (ACI_FUNC_ObjectToOptionIntf) new RightEitherToOptionMapper());
    }
     
    public class RightEitherToOptionMapper implements ACI_FUNC_ObjectToOptionIntf{
    	public ACI_OPT_Option apply(Object value) { 
    		return ACI_OR_EitherHelper.rightMapper().apply((ACI_OR_Either) value);
    	}
    }

    // ------------------------------------------------------------------------
    
    
    public class ToSupplierEither implements ACI_FUNC_ObjectToSupplierIntf {
    	ACI_FUNC_ObjectToEitherIntf objectToEither;
    	public ToSupplierEither(ACI_FUNC_ObjectToEitherIntf objectToEither) {
    		this.objectToEither = objectToEither;
    	}
    	
    	public ACI_SUPL_SupplierIntf apply(Object value) { 
    		return ACI_SUPL_SupplierHelper.createInstanceFor(objectToEither.apply(value));
    	}
    }
    

}