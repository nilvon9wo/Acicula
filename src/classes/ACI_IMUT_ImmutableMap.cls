public class ACI_IMUT_ImmutableMap {
    Map<Object, Object> seedMap;
	ACI_UTIL_MapConverter mapConverter;

    public ACI_IMUT_ImmutableMap(Map<Object, Object> seedMap, ACI_UTIL_MapConverter mapConverter) {
    	this.seedMap = seedMap;
    	this.mapConverter = mapConverter;
    }

    public ACI_IMUT_ImmutableMap(Map<String, SObject> seedMap, ACI_UTIL_MapConverter mapConverter) {
    	this(mapConverter.convertToObjectByObjectMap(seedMap), mapConverter);
    }
    
    public ACI_IMUT_ImmutableMap(Map<Object, Object> seedMap) {
    	this(seedMap, new ACI_UTIL_MapConverter());
    }

    public ACI_IMUT_ImmutableMap(Map<String, SObject> seedMap) {
    	this(seedMap, new ACI_UTIL_MapConverter());
    }

    public ACI_IMUT_ImmutableMap() {
    	this(new Map<Object, Object>());
    }

    public ACI_IMUT_ImmutableMap perfectClone() {
    	return new ACI_IMUT_ImmutableMap(this.rawClone());
    }
    
	public Boolean isSObjectMap() {
		return this.seedMap.values() instanceof List<SObject>;
	}    
    
    private Map<Object, Object> rawClone() { 
    	return (this.isSObjectMap())
    			? ((Map<Object, SObject>) this.seedMap).deepClone()
    			: this.seedMap.clone();
    }

    public ACI_IMUT_ImmutableMap deepClone() {
    	Map<Object, Object> cloneMap;
		try {
			cloneMap = ((Map<Object, SObject>) this.seedMap).deepClone();
		}
		catch (System.TypeException ex) { 
			throw new ACI_EXCP_ImmutableMapException('deepClone() is only supported for SObject record values', ex); 
		}
    	return new ACI_IMUT_ImmutableMap(cloneMap);
    }

    public ACI_IMUT_ImmutableMap clear() {
    	Map<Object, Object> cloneMap = this.rawClone();
    	cloneMap.clear();
    	return new ACI_IMUT_ImmutableMap(cloneMap);
    }

    public Boolean containsKey(Object key) {
    	return this.seedMap.containsKey(key);
    }

    public Boolean equals(Map<Object, Object> thatMap) {
    	return this.seedMap.equals(thatMap);
    }

    public Object get(Object key) {
    	Map<Object, Object> cloneMap = this.rawClone();
    	return cloneMap.get(key);
    }

    public SObjectType getSObjectType() {
		try {
			return ((Map<Object, SObject>) this.seedMap).getSObjectType();
		}
		catch (System.TypeException ex) {
			throw new ACI_EXCP_ImmutableListException('getSObjectType() is only supported for SObject record values', ex);  
		}
    }

    public Integer getSeedMapHashCode() {
    	return this.seedMap.hashCode();
    }

    public Boolean isEmpty() {
    	return this.seedMap.isEmpty();
    }

    public Set<Object> keySet(Object key) {
    	Map<Object, Object> cloneMap = this.rawClone();
    	return cloneMap.keySet();
    }

    public ACI_IMUT_ImmutableMap put(Object key, Object value) {
    	Map<Object, Object> cloneMap = this.rawClone();
    	cloneMap.put(key, value);
    	return new ACI_IMUT_ImmutableMap(cloneMap);
    } 

    public ACI_IMUT_ImmutableMap putAll(Map<Object, Object> objectMap) {
    	Map<Object, Object> cloneMap = this.rawClone();
    	cloneMap.putAll(objectMap);
    	return new ACI_IMUT_ImmutableMap(cloneMap);
    } 

    public ACI_IMUT_ImmutableMap putAll(ACI_IMUT_ImmutableMap immutableMap) {
    	Map<Object, Object> cloneMap = this.rawClone();
    	cloneMap.putAll(immutableMap.toMap());
    	return new ACI_IMUT_ImmutableMap(cloneMap);
    }

    public ACI_IMUT_ImmutableMap putAll(List<SObject> sObjectList) {
		Map<String, SObject> sObjectByStringMap = new Map<String, SObject>(sObjectList);
    	Map<String, SObject> convertedSObjectMap = this.createSObjectByStringMap();
    	
		try {
			convertedSObjectMap.putAll(sObjectByStringMap);
		}
		catch (System.TypeException ex) {
			throw new ACI_EXCP_ImmutableListException('getSObjectType() is only supported for SObject record values', ex);  
		}
    	return new ACI_IMUT_ImmutableMap(convertedSObjectMap); 
    }

	@testVisible
	private Map<String, SObject> createSObjectByStringMap() {
    	Map<Object, Object> cloneMap = this.rawClone();
		Map<String, SObject> sObjectByStringMap;
		try {
			sObjectByStringMap = this.mapConverter.convertToSObjectByStringMap(cloneMap); 
		}
		catch (ACI_EXCP_MapConverterException ex) {
			throw new ACI_EXCP_ImmutableListException('putAll(List<SObject> sObjectList) is only supported for String, SObject mapping', ex);
		}
		return sObjectByStringMap; 
	} 
 
    public ACI_IMUT_ImmutableMap remove(Object value) {
    	Map<Object, Object> cloneMap = this.rawClone();
    	cloneMap.remove(value);
    	return new ACI_IMUT_ImmutableMap(cloneMap);
    } 

    public Integer size() {
    	return this.seedMap.size();
    } 

    public List<Object> values() { 
    	Map<Object, Object> cloneMap = this.rawClone();
    	return this.seedMap.values();
    } 

    public ACI_IMUT_ImmutableList immutableValues() {
    	Map<Object, Object> cloneMap = this.rawClone();
    	return new ACI_IMUT_ImmutableList(this.seedMap.values());
    } 
    
    public Map<Object, Object> toMap() {
    	return this.rawClone();
    }
}