import 'package:flutter/cupertino.dart';

bool verificaCampoFormVazio({required List<TextEditingController> controllers}) {
  for (TextEditingController value in controllers) {
    return value.text.isNotEmpty;
  }
  return false;
}

String? validateNotEmpty(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldName é obrigatório';
  }
  return null;
}

String? validateEmpty(String? value) {

  if (value != null && value.isEmpty) {
    return 'Campo Obrigatório';
  }

  return null;
}

String? validateCNPJ(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'CNPJ é obrigatório';
  }
  if (value.length != 18) {
    return 'CNPJ inválido';
  }
  return null;
}

String? validateCEP(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'CEP é obrigatório';
  }
  if (value.length != 9) {
    return 'CEP inválido';
  }
  return null;
}

String? validateNumero(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Número é obrigatório';
  }
  if (int.tryParse(value) == null) {
    return 'Número inválido';
  }
  return null;
}

String? validateLatitude(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Latitude é obrigatória';
  }
  final lat = double.tryParse(value);
  if (lat == null || lat < -90 || lat > 90) {
    return 'Latitude inválida';
  }
  return null;
}

String? validateLongitude(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Longitude é obrigatória';
  }
  final lon = double.tryParse(value);
  if (lon == null || lon < -180 || lon > 180) {
    return 'Longitude inválida';
  }
  return null;
}
