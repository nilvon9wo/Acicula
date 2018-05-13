public class ACI_OR_RightProjection extends ACI_OR_ProjectionAbs implements ACI_OR_ProjectionIntf  {
   	public ACI_OR_RightProjection(ACI_OR_Either either) { 
   		super(either);
   	} 

    public override Object get(){ 
		return this.either.getRight();   
	} 

   	public override Boolean isDefined(){ 
   		return this.either.isRight(); 
	}
    	
    public override Object when(ACI_FUNC_ObjectToObjectIntf objectToObjectFunction) { 
		return  this.either.isRight()
			? this.get()
			: objectToObjectFunction.apply(this.either.left().get());
    }
    	
 	public override ACI_OR_Either applyToAll(ACI_FUNC_FunctionIntf function) { 
		return  this.either.isRight()
			? (ACI_OR_Either) new ACI_OR_Right(function.apply(this.get()))
			: (ACI_OR_Either) this.toLeft();
 	}
 	
	public override ACI_OR_Either flatApplyToAll(ACI_FUNC_FunctionIntf function)  { 
		return  this.either.isRight()
			? (ACI_OR_Either) function.apply(this.get())
			: (ACI_OR_Either) this.toLeft();
 	} 
 	
    public override ACI_OR_Either sequence(ACI_OR_Either either) {
    	return this.flatApplyToAll(new ACI_FUNC_Constant(either));
    }
 	
	public override ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf predicate) {
		return (this.either.isRight() && predicate.apply(this.get())) 
			? (ACI_OPT_Option) new ACI_OPT_Some(new ACI_OR_Right(this.get()))
			: (ACI_OPT_Option) new ACI_OPT_None();
	}
	  
	public ACI_OR_Either apply(ACI_OR_Either either) {
		return either.right().flatApplyToAll(new ACI_OR_Either.FlatApplyToAll(this.either));
	}

	public ACI_OR_Either coerceTo() {
		return ACI_OR_Either.right(this.get());
	}
		  
    public ACI_OR_Left toLeft() {
    	return new ACI_OR_Left(this.either.getLeft());
    }
}