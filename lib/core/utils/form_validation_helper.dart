/// Utilidades de validación para formularios
/// Centraliza las reglas de validación comunes
class FormValidationHelper {
  /// Valida que un campo no esté vacío
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es requerido';
    }
    return null;
  }

  /// Valida formato de email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email es requerido';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }

    return null;
  }

  /// Valida longitud mínima
  static String? validateMinLength(
    String? value,
    int minLength,
    String fieldName,
  ) {
    if (value == null || value.trim().length < minLength) {
      return '$fieldName debe tener al menos $minLength caracteres';
    }
    return null;
  }

  /// Valida longitud máxima
  static String? validateMaxLength(
    String? value,
    int maxLength,
    String fieldName,
  ) {
    if (value != null && value.trim().length > maxLength) {
      return '$fieldName no puede exceder $maxLength caracteres';
    }
    return null;
  }

  /// Valida que el valor esté en una lista de opciones válidas
  static String? validateInList(
    String? value,
    List<String> validOptions,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es requerido';
    }

    if (!validOptions.contains(value.trim())) {
      return '$fieldName debe ser uno de: ${validOptions.join(', ')}';
    }

    return null;
  }

  /// Valida formato de teléfono (básico)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Teléfono es requerido';
    }

    // Remover espacios y caracteres especiales
    final cleanPhone = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Validar que solo contenga números y +
    if (!RegExp(r'^\+?[\d]+$').hasMatch(cleanPhone)) {
      return 'Teléfono inválido';
    }

    // Validar longitud mínima (incluyendo código de país)
    if (cleanPhone.length < 10) {
      return 'Teléfono debe tener al menos 10 dígitos';
    }

    return null;
  }
}
