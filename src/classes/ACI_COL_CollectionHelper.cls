public class ACI_COL_CollectionHelper {
	
	public static ACI_COL_CollectorIntf unmodifiableList(Object obj) {
		return null; // TODO
	}
	
	public class GetUnmodifiableList implements ACI_FUNC_ListToUnmodifiableListIntf {
		public ACI_COL_CollectorIntf apply(Object obj) {
			return unmodifiableList(obj);
		}
	}
	
	public class UnmodifiableList implements ACI_COL_CollectorIntf {
		public ACI_SUPL_SupplierIntf supplier(){ return null; } // TODO
		public ACI_COL_AccumulatorIntf accumulator(){ return null; } // TODO
		public ACI_COL_CollectorIntf finisher(){ return null; } // TODO
		public ACI_COL_CollectorIntf apply(ACI_COL_AccumulatorIntf accumulator){ return null; } // TODO
	}
	
}