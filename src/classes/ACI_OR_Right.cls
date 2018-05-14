public class ACI_OR_Right extends ACI_OR_Either{
	Object value; 
    public ACI_OR_Right(Object value) {  
    	this.value = ACI_UTIL_ValueValidator.requireNotNull(value, 'Right value can not be null.');
    } 
    
    public override Object getRight() {
    	return this.value;
    } 
     
    public override Boolean isLeft() {
    	return false;
    } 
    
    public override Boolean isRight()  {
    	return true;
    }
    
    public override ACI_OR_Either swap() { 
    	return ACI_OR_Either.left(this.value); 
    }    

    public override Object fold(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight) {
    	 return ifRight.apply(this.value); 
   	}
   	
    public override ACI_OR_Either bidirectionalApplyToAll(ACI_FUNC_ObjectToObjectIntf ifLeft, ACI_FUNC_ObjectToObjectIntf ifRight) {
    	 return this.right().applyToAll(ifLeft); 
   	}
   	 
    public Boolean equals(Object that) {
    	if (this == that) {
    		return true;
    	}
    	
    	if (that == null || !(that instanceof ACI_OR_Right)) {
    		return false;
    	}
    	
    	return this.value.equals(((ACI_OR_Right) that).value);
    }

    
    public Integer hashCode() {
    	return this.value.hashCode();
    }
    
    public override String toString() {
    	return 'Either.Right(' + this.value.toString() + ')';
    }
}