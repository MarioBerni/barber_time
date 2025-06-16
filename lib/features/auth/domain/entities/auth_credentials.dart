import 'package:equatable/equatable.dart';

/// Credenciales para iniciar sesión
class LoginCredentials extends Equatable {
  final String email;
  final String password;

  const LoginCredentials({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

/// Datos para registrar un nuevo usuario
class RegisterCredentials extends Equatable {
  final String email;
  final String password;
  final String name;
  final String role; // 'client' o 'barber'

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
  final bool success;
  final String? errorMessage;
  final String? token;
  
  const AuthResult({
    required this.success,
    this.errorMessage,
    this.token,
  });
  
  // Factory constructor para un resultado exitoso
  factory AuthResult.success({String? token}) {
    return AuthResult(
      success: true,
      token: token,
    );
  }
  
  // Factory constructor para un resultado fallido
  factory AuthResult.failure(String errorMessage) {
    return AuthResult(
      success: false,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [success, errorMessage, token];
}
