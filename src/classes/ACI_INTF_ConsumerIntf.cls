public interface ACI_INTF_ConsumerIntf {
    void accept(Object value);
    ACI_INTF_ConsumerIntf andThen(ACI_INTF_ConsumerIntf after);
}