import '../entities/auth_credentials.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso para el inicio de sesión de usuarios
///
/// Encapsula la lógica de negocio relacionada con la autenticación de usuarios
class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  /// Ejecuta el caso de uso para iniciar sesión
  ///
  /// Retorna un [AuthResult] con el resultado de la operación
  Future<AuthResult> execute(LoginCredentials credentials) async {
    // Validaciones de datos de entrada
    if (credentials.email.isEmpty || !_isValidEmail(credentials.email)) {
      return AuthResult.failure('Correo electrónico inválido');
    }

    if (credentials.password.isEmpty || credentials.password.length < 6) {
      return AuthResult.failure('La contraseña debe tener al menos 6 caracteres');
    }

    // Delega la operación al repositorio
    return await repository.login(credentials);
  }

  /// Verifica si un email tiene formato válido
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }
}
