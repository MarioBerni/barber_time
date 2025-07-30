import '../entities/auth_credentials.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso para el registro de nuevos usuarios
///
/// Encapsula la lógica de negocio relacionada con la creación de nuevas cuentas
class RegisterUseCase {
  /// Repositorio de autenticación.
  final AuthRepository repository;

  /// Constructor de RegisterUseCase.
  const RegisterUseCase(this.repository);

  /// Ejecuta el caso de uso para registrar un nuevo usuario
  ///
  /// Retorna un [AuthResult] con el resultado de la operación
  Future<AuthResult> execute(RegisterCredentials credentials) async {
    // Validaciones de datos de entrada
    if (credentials.email.isEmpty || !_isValidEmail(credentials.email)) {
      return AuthResult.failure('Correo electrónico inválido');
    }

    if (credentials.password.isEmpty || credentials.password.length < 6) {
      return AuthResult.failure(
        'La contraseña debe tener al menos 6 caracteres',
      );
    }

    if (credentials.name.isEmpty || credentials.name.length < 3) {
      return AuthResult.failure('El nombre debe tener al menos 3 caracteres');
    }

    if (credentials.role != 'client' && credentials.role != 'barber') {
      return AuthResult.failure('Rol inválido. Debe ser "client" o "barber"');
    }

    // Delega la operación al repositorio
    return repository.register(credentials);
  }

  /// Verifica si un email tiene formato válido
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }
}
