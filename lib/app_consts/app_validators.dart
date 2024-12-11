class AppFormValidators {
  static String? validateText(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateDate(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    if (value != null) {
      try {
        final dateParts = value.split('/');
        final day = int.parse(dateParts[0]);
        final month = int.parse(dateParts[1]);
        final year = int.parse(dateParts[2]);
        final date = DateTime(year, month, day);
        if (date.year != year || date.month != month || date.day != day) {
          return 'Data inválida';
        }
      } catch (e) {
        return 'Data inválida';
      }
    }
    return null;
  }

  static String? validateHour(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    if (value != null) {
      try {
        final timeParts = value.split(':');
        final hour = int.parse(timeParts[0]);
        final minute = int.parse(timeParts[1]);
        if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
          return 'Hora inválida';
        }
      } catch (e) {
        return 'Hora inválida';
      }
    }
    return null;
  }

  static String? validatePercentage(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    if (value != null) {
      final percentage = int.tryParse(value.replaceAll('%', ''));
      if (percentage == null || percentage < 0 || percentage > 100) {
        return 'Porcentagem inválida';
      }
    }
    return null;
  }

  static String? validateDays(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    if (value != null) {
      final days = int.tryParse(value.replaceAll(' dias', ''));
      if (days == null || days < 0 || days > 10000000) {
        return 'Valor inválido para dias';
      }
    }
    return null;
  }

  static String? validateID(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    if (value != null) {
      final idParts = value.split('-');
      if (idParts.length != 2 || idParts[0].length != 3 || idParts[1].length != 3) {
        return 'ID inválido';
      }
    }
    return null;
  }

  static String? validateCurrency(String? value, {bool required = false}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }
    if (value != null) {
      final currency = double.tryParse(value.replaceAll(RegExp(r'[^\d]'), ''));
      if (currency == null || currency < 0 || currency > 10000000) {
        return 'Valor inválido';
      }
    }
    return null;
  }
}
