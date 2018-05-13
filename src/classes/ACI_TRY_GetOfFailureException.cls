public class ACI_TRY_GetOfFailureException extends Exception {
    private static final String MESSAGE = 'get of a Failure object';

	public static ACI_TRY_GetOfFailureException getInstance(Exception cause) {
		return new ACI_TRY_GetOfFailureException(MESSAGE, cause);
	}    
}