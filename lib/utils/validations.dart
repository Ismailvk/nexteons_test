class Validation {
  static String? isEmpty(String? value, String field) =>
      value == null || value.isEmpty ? '$field is Required' : null;

  static String? isPassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is Required';
    if (value.length < 5) return 'Password requires at least 8 characters';
    return null;
  }
}
