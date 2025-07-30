import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth_credentials.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'auth_state.dart';

/// Cubit para la gestión de estado de autenticación
///
/// Maneja todas las operaciones relacionadas con el flujo de autenticación
/// y notifica a la UI de los cambios de estado
class AuthCubit extends Cubit<AuthState> {
  /// Caso de uso para el inicio de sesión.
  final LoginUseCase loginUseCase;

  /// Caso de uso para el registro de usuarios.
  final RegisterUseCase registerUseCase;

  /// Constructor de AuthCubit.
  AuthCubit({required this.loginUseCase, required this.registerUseCase})
    : super(AuthState.initial());

  /// Intenta iniciar sesión con las credenciales proporcionadas
  Future<void> login(String email, String password) async {
    // Emitir estado de carga
    emit(state.loading());
    emit(state.copyWith(status: AuthStatus.authenticating));

    // Llamar al caso de uso
    final credentials = LoginCredentials(email: email, password: password);
    final result = await loginUseCase.execute(credentials);

    if (result.success) {
      // Obtener usuario actual después del login exitoso
      final userRepository = loginUseCase.repository;
      final user = await userRepository.getCurrentUser();

      if (user != null) {
        emit(state.authenticated(user));
      } else {
        emit(state.error('Error al obtener información del usuario'));
      }
    } else {
      emit(
        state.error(
          result.errorMessage ?? 'Error desconocido al iniciar sesión',
        ),
      );
    }
  }

  /// Intenta registrar un nuevo usuario con los datos proporcionados
  Future<void> register(
    String name,
    String email,
    String password,
    String role,
  ) async {
    // Emitir estado de carga
    emit(state.loading());
    emit(state.copyWith(status: AuthStatus.registering));

    // Llamar al caso de uso
    final credentials = RegisterCredentials(
      name: name,
      email: email,
      password: password,
      role: role,
    );
    final result = await registerUseCase.execute(credentials);

    if (result.success) {
      // Obtener usuario actual después del registro exitoso
      final userRepository = registerUseCase.repository;
      final user = await userRepository.getCurrentUser();

      if (user != null) {
        emit(state.authenticated(user));
      } else {
        emit(state.error('Error al obtener información del usuario'));
      }
    } else {
      emit(
        state.error(result.errorMessage ?? 'Error desconocido al registrarse'),
      );
    }
  }

  /// Cierra la sesión del usuario actual
  Future<void> logout() async {
    emit(state.loading());

    final repository = loginUseCase.repository;
    final success = await repository.logout();

    if (success) {
      emit(state.unauthenticated());
    } else {
      emit(state.error('Error al cerrar sesión'));
    }
  }

  /// Comprueba si hay un usuario autenticado actualmente
  Future<void> checkAuthStatus() async {
    emit(state.loading());

    final repository = loginUseCase.repository;
    final isLoggedIn = await repository.isUserLoggedIn();

    if (isLoggedIn) {
      final user = await repository.getCurrentUser();
      if (user != null) {
        emit(state.authenticated(user));
      } else {
        emit(state.unauthenticated());
      }
    } else {
      emit(state.unauthenticated());
    }
  }

  /// Limpia cualquier error en el estado
  void clearError() {
    emit(state.copyWith());
  }
}
