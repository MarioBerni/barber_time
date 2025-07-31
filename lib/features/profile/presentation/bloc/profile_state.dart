import 'package:equatable/equatable.dart';

import '../../domain/entities/user_profile.dart';

/// Estados posibles para la página de perfil
abstract class ProfileState extends Equatable {
  /// Constructor de la clase base para todos los estados
  /// de la página de perfil.
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// Estado inicial o de carga
class ProfileInitial extends ProfileState {
  /// Constructor del estado inicial del perfil.
  const ProfileInitial();
}

/// Estado de carga en progreso
class ProfileLoading extends ProfileState {
  /// Constructor del estado de carga del perfil.
  const ProfileLoading();
}

/// Estado para usuario no autenticado
class ProfileUnauthenticated extends ProfileState {
  /// Índice de la pestaña activa en el proceso de registro.
  final int activeRegistrationStep;

  /// Constructor de ProfileUnauthenticated.
  /// Constructor de ProfileUnauthenticated.
  const ProfileUnauthenticated({this.activeRegistrationStep = 0});

  @override
  List<Object?> get props => [activeRegistrationStep];

  /// Crea una copia del estado con campos actualizados.
  ProfileUnauthenticated copyWith({int? activeRegistrationStep}) {
    return ProfileUnauthenticated(
      activeRegistrationStep:
          activeRegistrationStep ?? this.activeRegistrationStep,
    );
  }
}

/// Estado cuando el usuario ha sido autenticado y cargado
class ProfileLoaded extends ProfileState {
  /// Datos del perfil del usuario
  final UserProfile profile;

  /// Índice de la pestaña seleccionada actualmente
  final int selectedTabIndex;

  /// Indica si algún dato se está actualizando
  final bool isUpdating;

  /// Mensaje de error durante actualización (si aplica)
  final String? updateError;

  /// Constructor de ProfileLoaded.
  const ProfileLoaded({
    required this.profile,
    this.selectedTabIndex = 0,
    this.isUpdating = false,
    this.updateError,
  });

  @override
  List<Object?> get props => [
    profile,
    selectedTabIndex,
    isUpdating,
    updateError,
  ];

  /// Crea una copia del estado con campos actualizados.
  ProfileLoaded copyWith({
    UserProfile? profile,
    int? selectedTabIndex,
    bool? isUpdating,
    String? updateError,
  }) {
    return ProfileLoaded(
      profile: profile ?? this.profile,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      isUpdating: isUpdating ?? this.isUpdating,
      updateError: updateError,
    );
  }
}

/// Estado durante el proceso de registro de cliente
class ProfileClientRegistration extends ProfileState {
  /// Datos del formulario en proceso
  final Map<String, String> formData;

  /// Errores de validación por campo
  final Map<String, String> fieldErrors;

  /// Indica si está enviando el formulario
  final bool isSubmitting;

  /// Error general del registro
  final String? registrationError;

  /// Constructor
  const ProfileClientRegistration({
    this.formData = const {},
    this.fieldErrors = const {},
    this.isSubmitting = false,
    this.registrationError,
  });

  @override
  List<Object?> get props => [
    formData,
    fieldErrors,
    isSubmitting,
    registrationError,
  ];

  /// Crea una copia con campos actualizados
  ProfileClientRegistration copyWith({
    Map<String, String>? formData,
    Map<String, String>? fieldErrors,
    bool? isSubmitting,
    String? registrationError,
  }) {
    return ProfileClientRegistration(
      formData: formData ?? this.formData,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      registrationError: registrationError,
    );
  }
}

/// Estado durante el proceso de registro de negocio
class ProfileBusinessRegistration extends ProfileState {
  /// Datos del formulario en proceso
  final Map<String, String> formData;

  /// Errores de validación por campo
  final Map<String, String> fieldErrors;

  /// Indica si está enviando el formulario
  final bool isSubmitting;

  /// Error general del registro
  final String? registrationError;

  /// Constructor
  const ProfileBusinessRegistration({
    this.formData = const {},
    this.fieldErrors = const {},
    this.isSubmitting = false,
    this.registrationError,
  });

  @override
  List<Object?> get props => [
    formData,
    fieldErrors,
    isSubmitting,
    registrationError,
  ];

  /// Crea una copia con campos actualizados
  ProfileBusinessRegistration copyWith({
    Map<String, String>? formData,
    Map<String, String>? fieldErrors,
    bool? isSubmitting,
    String? registrationError,
  }) {
    return ProfileBusinessRegistration(
      formData: formData ?? this.formData,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      registrationError: registrationError,
    );
  }
}

/// Estado de error al cargar el perfil
class ProfileError extends ProfileState {
  /// Mensaje de error
  final String message;

  /// Constructor del estado de error con el mensaje correspondiente.
  const ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
