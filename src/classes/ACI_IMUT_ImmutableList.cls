public class ACI_IMUT_ImmutableList implements Iterable<Object>, Iterator<Object>, ACI_ITER_StacklikeIntf {
    private List<Object> seedList;
    private Integer iteratorIndex = 0;   
    
    public ACI_IMUT_ImmutableList(List<Object> seedList) {
    	this.seedList = seedList;
    }
    
    public ACI_IMUT_ImmutableList(ACI_IMUT_ImmutableList copy) {
    	this.seedList = copy.seedList;
    }
    
    public ACI_IMUT_ImmutableList() {
    	this(new List<Object>());
    }

    public static final Boolean PRESERVE_ID = true;
    public static final Boolean PRESERVE_READONLY_TIMESTAMPS = true;
    public static final Boolean PRESERVE_AUTONUMBER = true;    
    private static final Integer FIRST_INDEX = 0;
    
    public ACI_IMUT_ImmutableList perfectClone() {
    	return new ACI_IMUT_ImmutableList(this.rawClone());
    }
    
	public Boolean isSObjectList() {
		return this.seedList instanceof List<SObject>;
	}    
    
    private List<Object> rawClone() {
    	return (this.isSObjectList())
    			? ((List<SObject>) this.seedList).deepClone(PRESERVE_ID, PRESERVE_READONLY_TIMESTAMPS, PRESERVE_AUTONUMBER)
    			: this.seedList.clone();
    }

    public ACI_IMUT_ImmutableList deepClone(Boolean preserveId, Boolean preserveReadonlyTimestamps, Boolean preserveAutonumber) {
    	List<Object> cloneList;
		try {
			cloneList = ((List<SObject>) this.seedList).deepClone(preserveId, preserveReadonlyTimestamps, preserveAutonumber);
		}
		catch (System.TypeException ex) {
			throw new ACI_EXCP_ImmutableListException('deepClone() is only supported for List<SObject>', ex); 
		}
    	return new ACI_IMUT_ImmutableList(cloneList);
    }
    
    public ACI_IMUT_ImmutableList add(Object value) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.add(value);
    	return new ACI_IMUT_ImmutableList(cloneList);
    }
    
    public ACI_IMUT_ImmutableList add(Integer index, Object value) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.add(index, value);
    	return new ACI_IMUT_ImmutableList(cloneList);
    }

    public ACI_IMUT_ImmutableList addAll(ACI_IMUT_ImmutableList immutableList) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.addAll(immutableList.toList());
    	return new ACI_IMUT_ImmutableList(cloneList);
    }

    public ACI_IMUT_ImmutableList addAll(List<Object> objectList) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.addAll(objectList);
    	return new ACI_IMUT_ImmutableList(cloneList);
    }

    public ACI_IMUT_ImmutableList addAll(Set<Object> objectSet) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.addAll(objectSet);
    	return new ACI_IMUT_ImmutableList(cloneList);
    }
    
    public ACI_IMUT_ImmutableList clear() {
    	List<Object> cloneList = this.rawClone();
    	cloneList.clear();
    	return new ACI_IMUT_ImmutableList(cloneList);
    }

    public Boolean contains(Object value) {
    	return this.seedList.contains(value);
    }

    public Boolean equals(List<Object> thatList) {
    	return this.seedList.equals(thatList);
    }

    public Object get(Integer index) {
    	return this.rawClone().get(index);
    }

    public SObjectType getSObjectType() {
		try {
			return ((List<SObject>) this.seedList).getSObjectType();
		}
		catch (System.TypeException ex) {
			throw new ACI_EXCP_ImmutableListException('getSObjectType() is only supported for List<SObject>', ex); 
		}
    }

    public Integer getSeedListHashCode() {
    	return this.seedList.hashCode();
    }

    public Integer indexOf(Object value) {
    	return this.seedList.indexOf(value);
    }

    public Boolean isEmpty() {
    	return this.seedList.isEmpty();
    }

    public ACI_IMUT_ImmutableList remove(Integer index) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.remove(index);
    	return new ACI_IMUT_ImmutableList(cloneList);
    }

    public ACI_IMUT_ImmutableList set(Integer index, Object value) {
    	List<Object> cloneList = this.rawClone();
    	cloneList.set(index, value);
    	return new ACI_IMUT_ImmutableList(cloneList);
    }
    
    public Integer size() {
    	return this.seedList.size();
    }

    public Integer lastIndex() {
    	return this.size() - 1;
    }

    public ACI_IMUT_ImmutableList sort() {
    	List<Object> cloneList = this.rawClone();
    	cloneList.sort();
    	return new ACI_IMUT_ImmutableList(cloneList);
    }
    
    public List<Object> toList() {
    	return this.rawClone();
    }
    
    // Iterator ----------------------------------------------------------
    
    public Iterator<Object> iterator() { 
    	return toList().iterator();  
    }

    // Iterable  ----------------------------------------------------------

    public Boolean hasNext() {
    	return this.iteratorIndex < this.size();
    }

    public Object next() {
    	this.iteratorIndex++;
    	return this.get(this.iteratorIndex - 1);
    }

    // Stacklike  ----------------------------------------------------------

	public ACI_IMUT_ImmutableList push(Object value) {
		return this.add(value);
    }
    
    public PopResult pop() {
    	return new PopResult(this);
    } 

    public ShiftResult shift() {
    	return new ShiftResult(this);
    }
    
	public ACI_IMUT_ImmutableList unshift(Object value) {
		return (new ACI_IMUT_ImmutableList(new List<Object>{value})).addAll(this); 
    }
    
	// ----------------------------------------------------------------------------------------------------------------
	
   	@testVisible
	private abstract class UnloadOneValueFromStackResultAbstract implements ACI_ITER_SingleValueOffloadableIntf {
    	private Object value;
    	private Iterator<Object> remainder;
    	
    	@testVisible 
    	protected UnloadOneValueFromStackResultAbstract(ACI_IMUT_ImmutableList thisList, Integer targetIndex) {
    		this.value = thisList.get(targetIndex);
    		this.remainder = thisList.remove(targetIndex);
    	}
    	
		public Object getValue() {
			return this.value;
		}
		
		public Iterator<Object> getRemainder() {
			return this.remainder;
		}    	
	}
	
    public class PopResult extends UnloadOneValueFromStackResultAbstract{
    	@testVisible
    	private PopResult(ACI_IMUT_ImmutableList thisList) {
    		super(thisList, thisList.lastIndex());
    	}
    }   

    public class ShiftResult extends UnloadOneValueFromStackResultAbstract{
    	@testVisible
    	private ShiftResult(ACI_IMUT_ImmutableList thisList) {
    		super(thisList, FIRST_INDEX);
    	}
    }   

}