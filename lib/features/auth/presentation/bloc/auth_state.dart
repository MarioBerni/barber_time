import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

/// Estados posibles en el flujo de autenticación
enum AuthStatus {
  initial,
  authenticating,
  authenticated,
  unauthenticated,
  registering,
  error,
}

/// Estado del Cubit de autenticación
class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;
  final bool isLoading;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
    this.isLoading = false,
  });

  // Estado inicial
  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.initial,
      isLoading: false,
    );
  }

  // Métodos para crear nuevos estados
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
  AuthState loading() {
    return copyWith(
      isLoading: true,
      errorMessage: null,
    );
  }

  // Estado de error
  AuthState error(String message) {
    return copyWith(
      status: AuthStatus.error,
      errorMessage: message,
      isLoading: false,
    );
  }

  // Estado autenticado
  AuthState authenticated(User user) {
    return copyWith(
      status: AuthStatus.authenticated,
      user: user,
      isLoading: false,
      errorMessage: null,
    );
  }

  // Estado no autenticado
  AuthState unauthenticated() {
    return copyWith(
      status: AuthStatus.unauthenticated,
      user: null,
      isLoading: false,
      errorMessage: null,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage, isLoading];

  @override
  String toString() {
    return 'AuthState{status: $status, user: ${user?.email}, errorMessage: $errorMessage, isLoading: $isLoading}';
  }
}
