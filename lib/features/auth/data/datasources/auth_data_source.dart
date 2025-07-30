import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/user.dart';

/// Contrato para las fuentes de datos de autenticación
///
/// Define las operaciones que deben implementar todas las fuentes de datos,
/// ya sean remotas (API), locales (SharedPreferences) o simuladas (Mock)
abstract class AuthDataSource {
  /// Inicia sesión con email y contraseña
  Future<AuthResult> login(LoginCredentials credentials);

  /// Registra un nuevo usuario
  Future<AuthResult> register(RegisterCredentials credentials);

  /// Cierra la sesión del usuario actual
  Future<bool> logout();

  /// Solicita restablecer la contraseña
  Future<bool> requestPasswordReset(String email);

  /// Obtiene el usuario actualmente autenticado
  Future<User?> getCurrentUser();

  /// Verifica si hay un usuario autenticado
  Future<bool> isUserLoggedIn();

  /// Actualiza la información del perfil del usuario
  Future<User?> updateUserProfile({String? name, String? profileImage});
}

/// Implementación mock de la fuente de datos para pruebas y desarrollo
///
/// Simula el comportamiento de una API real pero con datos predefinidos
class MockAuthDataSource implements AuthDataSource {
  // Simula una base de datos simple de usuarios
  final Map<String, User> _users = {};

  // Usuario actualmente autenticado
  User? _currentUser;
  String? _authToken;

  @override
  Future<AuthResult> login(LoginCredentials credentials) async {
    // Simulamos un retraso de red
    await Future<void>.delayed(const Duration(seconds: 1));

    // Buscar el usuario por email (simplificado)
    final existingUsers = _users.values
        .where((user) => user.email == credentials.email)
        .toList();

    if (existingUsers.isEmpty) {
      return AuthResult.failure('Usuario no encontrado');
    }

    // En un caso real, verificaríamos la contraseña hasheada
    // Aquí simulamos una verificación simple
    if (credentials.password != 'password123') {
      // contraseña de prueba fija
      return AuthResult.failure('Contraseña incorrecta');
    }

    _currentUser = existingUsers.first;
    _authToken = 'mock-auth-token-${DateTime.now().millisecondsSinceEpoch}';

    return AuthResult.success(token: _authToken);
  }

  @override
  Future<AuthResult> register(RegisterCredentials credentials) async {
    // Simulamos un retraso de red
    await Future<void>.delayed(const Duration(seconds: 1));

    // Verificar si el email ya existe
    final existingUsers = _users.values
        .where((user) => user.email == credentials.email)
        .toList();

    if (existingUsers.isNotEmpty) {
      return AuthResult.failure('Este correo ya está registrado');
    }

    // Crear nuevo usuario
    final newUser = User(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      email: credentials.email,
      name: credentials.name,
      role: credentials.role,
      createdAt: DateTime.now(),
      isEmailVerified: false,
    );

    // Guardar usuario
    _users[newUser.id] = newUser;

    // Autenticar al usuario recién registrado
    _currentUser = newUser;
    _authToken = 'mock-auth-token-${DateTime.now().millisecondsSinceEpoch}';

    return AuthResult.success(token: _authToken);
  }

  @override
  Future<bool> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    _authToken = null;
    return true;
  }

  @override
  Future<bool> requestPasswordReset(String email) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // Verificar si el email existe
    final existingUsers = _users.values
        .where((user) => user.email == email)
        .toList();

    return existingUsers.isNotEmpty;
  }

  @override
  Future<User?> getCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _currentUser;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _currentUser != null;
  }

  @override
  Future<User?> updateUserProfile({String? name, String? profileImage}) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (_currentUser == null) {
      return null;
    }

    final updatedUser = _currentUser!.copyWith(
      name: name,
      profileImage: profileImage,
    );

    // Actualizar en la "base de datos"
    _users[updatedUser.id] = updatedUser;
    _currentUser = updatedUser;

    return updatedUser;
  }
}
