public class ACI_OR_Left extends ACI_OR_Either{
	Object value; 
    public ACI_OR_Left(Object value) { 
    	this.value = ACI_UTIL_ValueValidator.requireNotNull(value, 'Left value can not be null.');
    }
    
    public override Object getLeft() {
    	return this.value;
    } 
    
    public override Boolean isLeft() {
    	return true; 
    }
    
    public override Boolean isRight()  {
    	return false;
    }
    
    public override ACI_OR_Either swap() { 
    	return ACI_OR_Either.right(this.value); 
    }
    
    public override Object fold(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight) {
    	 return ifLeft.apply((ACI_OR_Either) this.value); 
   	}
   	
    public override ACI_OR_Either bidirectionalApplyToAll(ACI_FUNC_FunctionIntf ifLeft, ACI_FUNC_FunctionIntf ifRight) {
    	 return this.left().applyToAll(ifLeft); 
   	} 
    
    public Boolean equals(Object that) {
    	if (this == that) {
    		return true;
    	}
    	
    	if (that == null || !(that instanceof ACI_OR_Left)) {
    		return false;
    	}
    	
    	return this.value.equals(((ACI_OR_Left) that).value);
    }
    
    public Integer hashCode() {
    	return this.value.hashCode();
    }
    
    public override String toString() {
    	return 'Either.Left(' + this.value.toString() + ')';
    }
}