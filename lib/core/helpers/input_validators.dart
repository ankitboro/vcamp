class InputValidators {
  static String? requiredValidator(String? val) {
    if (val != null && val.trim().isNotEmpty) {
      return null;
    } else {
      return "*Required.";
    }
  }
}
