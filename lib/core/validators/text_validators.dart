class TextValidators {
  static String? emailValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu correo electronico';
    }
    if (value.isEmpty) {
      return 'Ingresa tu correo electronico';
    }
    if (_validateEmail(value)) {
      return 'Ingresa un correo valido';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu contraseña';
    }
    if (value.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null) {
      return 'Ingresa tus nombres';
    }
    if (value.isEmpty) {
      return 'Ingresa tus nombres';
    }
    if (value.length < 3) {
      return 'Tu nombre debe ser mayor a 3 caracteres';
    }
    return null;
  }
   static String? userValidator(String? value) {
    if (value == null) {
      return 'Ingresa tu usuario';
    }
    if (value.isEmpty) {
      return 'Ingresa tu usuario';
    }
    return null;
  }
   static String? empatyValidator(String? value) {
    if (value == null) {
      return 'Debes llenar este campo';
    }
    if (value.isEmpty) {
       return 'Debes llenar este campo';
    }
    return null;
  }

  static String? phoneValidator(String? value, {int maxLength = 10}) {
    if (value == null) {
      return 'Ingresa numero de telefono';
    }
    if (value.isEmpty) {
      return 'Ingresa numero de telefono';
    }
    if (value.length < maxLength) {
      return 'Revisa numero de telefono';
    }
    return null;
  }

  static String? notNullValidator(Object? value, String message) {
    if (value == null) {
      return message;
    }
    return null;
  }

  static bool _validateEmail(String? value) {
    if (value == null) return false;
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    return !regex.hasMatch(value);
  }
}
