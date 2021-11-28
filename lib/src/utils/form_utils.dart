/// Collection of utility functions for flutter forms.
mixin FormUtils {
  /// Validates a [String] value in a [FormField].
  ///
  /// Validates:
  /// * Non-null
  /// * Length > 0
  /// * Length <= [maxLength]
  ///
  /// [input] - The [String] input to validate.
  /// [inputName] - The name of the input, used in the error message.
  /// [maxLength] - The maximum length of the [String].
  ///
  /// Returns a [String] error message if invalid input.
  /// Returns null if valid input.
  String? stringValidator(
    String? input, [
    String? inputName = 'input',
    int? maxLength,
  ]) {
    if (input == null || input.isEmpty) {
      return "$inputName cannot be blank";
    } else if (maxLength != null && input.length > maxLength) {
      return "$inputName cannot $maxLength characters";
    } else {
      return null;
    }
  }
}
