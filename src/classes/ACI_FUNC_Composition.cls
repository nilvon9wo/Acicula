public class ACI_FUNC_Composition implements ACI_FUNC_ObjectToObjectIntf, ACI_INTF_SerializableIntf {
	private static final long serialVersionUID = 0;
		
	ACI_FUNC_ObjectToObjectIntf f;
	ACI_FUNC_ObjectToObjectIntf g;
	
    public ACI_FUNC_Composition(ACI_FUNC_ObjectToObjectIntf f, ACI_FUNC_ObjectToObjectIntf g) {
    	this.f = (ACI_FUNC_ObjectToObjectIntf) ACI_UTIL_ValueValidator.requireNotNull(f, 'Function f can not be null.');
    	this.g = (ACI_FUNC_ObjectToObjectIntf) ACI_UTIL_ValueValidator.requireNotNull(g, 'Function g can not be null.');
    }
    
    public Object apply(Object value) {
    	return this.f.apply(this.g.apply(value));
    } 
    
    public Boolean equals(Object that) { 
    	return (that instanceof ACI_FUNC_Composition) 
    		&& this.f.equals(((ACI_FUNC_Composition) that).f) 
    		&& this.g.equals(((ACI_FUNC_Composition) that).g);
    } 
    
    public Integer hashcode() {
    	return this.f.hashCode() ^ this.g.hashCode(); 
    }
    
    public override String toString() {
    	return this.f.toString() + '(' + this.g.toString() + ')';
    }
     
}