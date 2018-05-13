public interface ACI_ITER_StacklikeIntf {
    Iterator<Object> push(Object value);
    ACI_ITER_SingleValueOffloadableIntf pop();
    ACI_ITER_SingleValueOffloadableIntf shift();
    Iterator<Object> unshift(Object value);
}