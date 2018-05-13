public class ACI_OR_LeftProjection extends ACI_OR_ProjectionAbs implements ACI_COL_CollectorLikeIntf, ACI_OR_ProjectionIntf {
   	public ACI_OR_LeftProjection(ACI_OR_Either either) {
   		this(either);
   	}  

    public override Object get(){ 
		return this.either.getLeft();   
	} 

   	public override Boolean isDefined(){
   		return this.either.isLeft();  
	}

    public override Object when(ACI_FUNC_ObjectToObjectIntf objectToObjectFunction) { 
		return  this.either.isLeft()
			? this.get()
			: objectToObjectFunction.apply(this.either.right().get());
    }
 
 	public override ACI_OR_Either applyToAll(ACI_FUNC_FunctionIntf function) { 
		return  this.either.isLeft()
			? (ACI_OR_Either) new ACI_OR_Left(function.apply(this.get()))
			: (ACI_OR_Either) this.toRight();
 	}
 	
	public override ACI_OR_Either flatApplyToAll(ACI_FUNC_FunctionIntf function)  { 
		return  this.either.isLeft()
			? (ACI_OR_Either) function.apply(this.get())
			: (ACI_OR_Either) this.toRight();
 	}  

    public override ACI_OR_Either sequence(ACI_OR_Either either) {
    	return this.flatApplyToAll(new ACI_FUNC_Constant(either));
    }

	public override ACI_OPT_Option filter(ACI_FUNC_ObjectToBooleanIntf predicate) {
		return (this.either.isLeft() && predicate.apply(this.get())) 
			? (ACI_OPT_Option) new ACI_OPT_Some(new ACI_OR_Left(this.get()))
			: (ACI_OPT_Option) new ACI_OPT_None();
	}
	
	public ACI_OR_Either apply(ACI_OR_Either either) {
		return either.left().flatApplyToAll(new ACI_OR_Either.FlatApplyToAll(this.either));
	}
	
	public ACI_OR_Either coerceTo() {
		return ACI_OR_Either.left(this.get());
	}
	  
    public ACI_OR_Right toRight() {
    	return new ACI_OR_Right(this.either.getRight());
    }
}