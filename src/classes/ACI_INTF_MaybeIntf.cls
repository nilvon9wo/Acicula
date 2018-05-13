public interface ACI_INTF_MaybeIntf extends ACI_SUPL_SupplierIntf {
  Object get();
  Object getOrElse(Object other);
  Object getOrElse(ACI_SUPL_SupplierIntf supplier);  
  Object getOrNull();
  Object getOrError(ACI_SUPL_StringSupplier errorMessageFunction); 
  Object getOrThrow(ACI_SUPL_ExceptionSupplier errorFunction); 
  Boolean isDefined(); 
  Boolean isEmpty(); 
  Boolean exists(ACI_FUNC_ObjectToBooleanIntf predicate);
  Iterator<Object> iterator();
  Boolean forAll(ACI_FUNC_ObjectToBooleanIntf predicate);
}