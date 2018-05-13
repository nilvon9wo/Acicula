public virtual class ACI_UTIL_MapConverter {

    public Map<Object, Object> convertToObjectByObjectMap (Map<String, Object> mapByString) {
    	Map<Object, Object> mapByObject = new Map<Object, Object>();
    	for (String key : mapByString.keySet()) {
    		mapByObject.put(key, mapByString.get(key));
    	}
    	return mapByObject;
    } 

    public Map<Object, Object> convertToObjectByObjectMap(Map<String, SObject> sObjectByStringMap) {
    	return this.convertToObjectByObjectMap((Map<String, Object>) sObjectByStringMap);
    }

    public Map<String, Object> convertToObjectByStringMap (Map<Object, Object> mapByObject) {
    	Map<String, Object> mapByString = new Map<String, Object>();
    	for (Object key : mapByObject.keySet()) {
			mapByString.put(this.convertToString(key), mapByObject.get(key));
    	}
    	return mapByString;
    }

    public Map<String, SObject> convertToSObjectByStringMap (Map<Object, Object> mapByObject) {
    	Map<String, SObject> sObjectByStringMap = new Map<String, SObject>();
    	for (Object key : mapByObject.keySet()) {
    		sObjectByStringMap.put(this.convertToString(key), this.convertToSObject(mapByObject.get(key)));
    	}
    	return sObjectByStringMap;
    }
    
    // Helpers ----------------------------------------------------------------------------
    
    @testVisible
    private String convertToString(Object value) {
		try {
    		return (String) value;
		}
		catch (TypeException ex) {
			throw new ACI_EXCP_MapConverterException('Value ' + value + ' is not a String', ex); 
		}
    }
    
    @testVisible
    
    private SObject convertToSObject(Object value) {
		try {
    		return (SObject) value;
		}
		catch (TypeException ex) {
			throw new ACI_EXCP_MapConverterException('Value ' + value + ' is not an SObject', ex); 
		}
    }
}