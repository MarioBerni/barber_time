import 'package:equatable/equatable.dart';

import '../../domain/entities/user_profile.dart';

/// Estados posibles para la página de perfil
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// Estado inicial o de carga
class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

/// Estado de carga en progreso
class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

/// Estado para usuario no autenticado
class ProfileUnauthenticated extends ProfileState {
  /// Índice de la pestaña activa en el proceso de registro
  final int activeRegistrationStep;

  const ProfileUnauthenticated({
    this.activeRegistrationStep = 0,
  });

  @override
  List<Object?> get props => [activeRegistrationStep];

  /// Crea una copia del estado con campos actualizados
  ProfileUnauthenticated copyWith({
    int? activeRegistrationStep,
  }) {
    return ProfileUnauthenticated(
      activeRegistrationStep: activeRegistrationStep ?? this.activeRegistrationStep,
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
    updateError
  ];

  /// Crea una copia del estado con campos actualizados
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

/// Estado de error al cargar el perfil
class ProfileError extends ProfileState {
  /// Mensaje de error
  final String message;

  const ProfileError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
