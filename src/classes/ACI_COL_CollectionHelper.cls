public class ACI_COL_CollectionHelper {
    public static ACI_IMUT_ImmutableList collectingAndThen(List<Object> sObjectList, ACI_FUNC_ListToUnmodifiableListIntf listToUnmodifiableList) {
    	return listToUnmodifiableList.apply(sObjectList);
    }
    
    public static ACI_IMUT_ImmutableList unmodifiableList(List<Object> sObjectList) {
    	return new ACI_IMUT_ImmutableList(sObjectList);
    }
}