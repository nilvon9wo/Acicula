public class ACI_UTIL_ValueValidator {
    public static Object requireNotNull(Object value, String errorMessage) {
    	if (value == null) {
    		throw new ACI_EXCP_NullPointerException(errorMessage);
    	}
    	return value;
    }
}