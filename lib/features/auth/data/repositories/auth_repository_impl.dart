import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';

/// Implementación del repositorio de autenticación
///
/// Conecta la capa de dominio con las fuentes de datos,
/// implementando el contrato definido por AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  const AuthRepositoryImpl({required this.dataSource});

  @override
  Future<AuthResult> login(LoginCredentials credentials) async {
    try {
      final result = await dataSource.login(credentials);
      return result;
    } catch (e) {
      return AuthResult.failure('Error de autenticación: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult> register(RegisterCredentials credentials) async {
    try {
      final result = await dataSource.register(credentials);
      return result;
    } catch (e) {
      return AuthResult.failure('Error al registrar usuario: ${e.toString()}');
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await dataSource.logout();
    } catch (e) {
      // Aquí podríamos registrar el error en un servicio de logs
      return false;
    }
  }

  @override
  Future<bool> requestPasswordReset(String email) async {
    try {
      return await dataSource.requestPasswordReset(email);
    } catch (e) {
      // Aquí podríamos registrar el error en un servicio de logs
      return false;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      return await dataSource.getCurrentUser();
    } catch (e) {
      // Aquí podríamos registrar el error en un servicio de logs
      return null;
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    try {
      return await dataSource.isUserLoggedIn();
    } catch (e) {
      // Aquí podríamos registrar el error en un servicio de logs
      return false;
    }
  }

  @override
  Future<User?> updateUserProfile({
    String? name,
    String? profileImage,
  }) async {
    try {
      return await dataSource.updateUserProfile(
        name: name,
        profileImage: profileImage,
      );
    } catch (e) {
      // Aquí podríamos registrar el error en un servicio de logs
      return null;
    }
  }
}
