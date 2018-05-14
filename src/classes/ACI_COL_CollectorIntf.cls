public interface ACI_COL_CollectorIntf {
	ACI_SUPL_SupplierIntf supplier();
	ACI_COL_AccumulatorIntf accumulator();
	ACI_COL_CollectorIntf finisher();
	ACI_COL_CollectorIntf apply(ACI_COL_AccumulatorIntf accumulator);
}