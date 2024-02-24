class TextValidators {
  static String? textMandatory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo no debe estar vacío';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    final pattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.isEmpty) {
      return 'Ingresa tu correo electrónico';
    }
    if (!pattern.hasMatch(value)) {
      return 'Ingresa un correo válido';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa una contraseña';
    }
    if (value.length < 9) {
      return 'La contraseña debe ser mayor a 8 caracteres';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String? confirm) {
    if (value == null || value.isEmpty) {
      return 'Confirma la contraseña';
    }
    if (value != confirm) {
      return 'La contraseña no coincide';
    }
    return null;
  }
}
