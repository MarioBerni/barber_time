import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

/// Estados posibles en el flujo de autenticación
enum AuthStatus {
  /// Estado inicial antes de cualquier operación de autenticación.
  initial,

  /// El usuario está en proceso de autenticación (iniciando sesión).
  authenticating,

  /// El usuario ha sido autenticado exitosamente.
  authenticated,

  /// El usuario no está autenticado.
  unauthenticated,

  /// El usuario está en proceso de registro.
  registering,

  /// Ha ocurrido un error durante la autenticación o el registro.
  error,
}

/// Estado del Cubit de autenticación
class AuthState extends Equatable {
  /// El estado actual de la autenticación.
  final AuthStatus status;

  /// El usuario autenticado, si existe.
  final User? user;

  /// Mensaje de error, si la operación falló.
  final String? errorMessage;

  /// Indica si una operación de autenticación está en curso.
  final bool isLoading;

  /// Constructor de AuthState.
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
    this.isLoading = false,
  });

  /// Crea el estado inicial para el bloque de autenticación.
  factory AuthState.initial() {
    return const AuthState();
  }

  // Métodos para crear nuevos estados
  /// Crea una copia de este estado con los valores proporcionados.
  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
    bool? isLoading,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  // Estado de carga
  /// Retorna un estado de carga.
  AuthState loading() {
    return copyWith(isLoading: true);
  }

  // Estado de error
  /// Retorna un estado de error con un mensaje específico.
  AuthState error(String message) {
    return copyWith(
      status: AuthStatus.error,
      errorMessage: message,
      isLoading: false,
    );
  }

  // Estado autenticado
  /// Retorna un estado autenticado con la información del usuario.
  AuthState authenticated(User user) {
    return copyWith(
      status: AuthStatus.authenticated,
      user: user,
      isLoading: false,
    );
  }

  // Estado no autenticado
  /// Retorna un estado no autenticado.
  AuthState unauthenticated() {
    return copyWith(status: AuthStatus.unauthenticated, isLoading: false);
  }

  @override
  List<Object?> get props => [status, user, errorMessage, isLoading];

  @override
  String toString() {
    return 'AuthState{status: $status, user: ${user?.email}, '
        'errorMessage: $errorMessage, isLoading: $isLoading}';
  }
}
