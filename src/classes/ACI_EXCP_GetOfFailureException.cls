public class ACI_EXCP_GetOfFailureException extends Exception {
    private static final String MESSAGE = 'get of a Failure object';

	public static ACI_EXCP_GetOfFailureException getInstance(Exception cause) {
		return new ACI_EXCP_GetOfFailureException(MESSAGE, cause);
	}    
}