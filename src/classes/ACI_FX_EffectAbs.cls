public abstract class ACI_FX_EffectAbs implements ACI_FX_EffectIntf {
    public abstract void apply(Object value);
    
    public void accept(Object value) {
    	this.apply(value);
    }
}