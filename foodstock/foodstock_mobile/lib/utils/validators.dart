class Validators {
  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pole nie może być puste';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pole e-mail nie może być puste';
    }
    const pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Podaj prawidłowy adres e-mail';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Hasło nie może być puste';
    }
    if (value.length < 6) {
      return 'Hasło musi mieć co najmniej 6 znaków';
    }
    return null;
  }

  static String? validateBarcode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kod kreskowy nie może być pusty';
    }
    const pattern = r'^\d{13}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Kod kreskowy musi zawierać dokładnie 13 cyfr';
    }
    return null;
  }

  static String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ilość nie może być pusta';
    }
    if (int.tryParse(value) == null) {
      return 'Wprowadź prawidłową wartość liczbową';
    }
    return null;
  }

  static String? validateDate(String? value, {DateTime? minDate}) {
    if (value == null || value.isEmpty) {
      return 'Date cannot be empty';
    }

    DateTime? date;
    try {
      date = DateTime.parse(value);
    } catch (e) {
      return 'Invalid date format';
    }

    if (minDate != null && date.isBefore(minDate)) {
      return 'Date should not be earlier than ${minDate.toLocal()}';
    }

    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category cannot be empty';
    }
    return null;
  }

  static String? validateProducent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Producent cannot be empty';
    }
    return null;
  }

  static String? validateSupplier(String? value) {
    if (value == null || value.isEmpty) {
      return 'Supplier cannot be empty';
    }
    return null;
  }
}
