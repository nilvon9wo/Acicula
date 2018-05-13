public interface ACI_ConsumerIntf {
    void accept(Object value);
    ACI_ConsumerIntf andThen(ACI_ConsumerIntf after);
}