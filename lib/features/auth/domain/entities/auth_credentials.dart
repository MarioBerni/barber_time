import 'package:equatable/equatable.dart';

/// Credenciales para iniciar sesión
class LoginCredentials extends Equatable {
  /// El email del usuario.
  final String email;

  /// La contraseña del usuario.
  final String password;

  /// Constructor para LoginCredentials.
  const LoginCredentials({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

/// Datos para registrar un nuevo usuario
class RegisterCredentials extends Equatable {
  /// El email del nuevo usuario.
  final String email;

  /// La contraseña del nuevo usuario.
  final String password;

  /// El nombre del nuevo usuario.
  final String name;

  /// El rol del nuevo usuario (ej. 'client' o 'barber').
  final String role; // 'client' o 'barber'

  /// Constructor para RegisterCredentials.
  const RegisterCredentials({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
  });

  @override
  List<Object?> get props => [email, password, name, role];
}

/// Resultado de operaciones de autenticación
class AuthResult extends Equatable {
  /// Indica si la operación de autenticación fue exitosa.
  final bool success;

  /// Mensaje de error si la operación falló.
  final String? errorMessage;

  /// Token de autenticación si la operación fue exitosa.
  final String? token;

  /// Constructor para AuthResult.
  const AuthResult({required this.success, this.errorMessage, this.token});

  /// Constructor factory para un resultado exitoso.
  factory AuthResult.success({String? token}) {
    return AuthResult(success: true, token: token);
  }

  /// Constructor factory para un resultado fallido.
  factory AuthResult.failure(String errorMessage) {
    return AuthResult(success: false, errorMessage: errorMessage);
  }

  @override
  List<Object?> get props => [success, errorMessage, token];
}
