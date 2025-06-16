import '../entities/auth_credentials.dart';
import '../entities/user.dart';

/// Contrato para el repositorio de autenticación
///
/// Define las operaciones que pueden realizarse relacionadas con la autenticación,
/// independientemente de la implementación concreta (API real, mock, etc.)
abstract class AuthRepository {
  /// Inicia sesión con email y contraseña
  ///
  /// Retorna un [AuthResult] con el resultado de la operación
  Future<AuthResult> login(LoginCredentials credentials);

  /// Registra un nuevo usuario
  ///
  /// Retorna un [AuthResult] con el resultado de la operación
  Future<AuthResult> register(RegisterCredentials credentials);

  /// Cierra la sesión actual del usuario
  ///
  /// Retorna true si se cerró correctamente la sesión
  Future<bool> logout();

  /// Solicita restablecer la contraseña del usuario
  ///
  /// Retorna true si se envió correctamente el correo de restablecimiento
  Future<bool> requestPasswordReset(String email);

  /// Obtiene la información del usuario actualmente autenticado
  ///
  /// Retorna un [User] si hay un usuario autenticado, o null en caso contrario
  Future<User?> getCurrentUser();

  /// Verifica si hay un usuario actualmente autenticado
  ///
  /// Retorna true si hay un usuario autenticado
  Future<bool> isUserLoggedIn();

  /// Actualiza la información de perfil del usuario actual
  ///
  /// Retorna el [User] actualizado si la operación fue exitosa, o null en caso contrario
  Future<User?> updateUserProfile({
    String? name,
    String? profileImage,
  });
}
