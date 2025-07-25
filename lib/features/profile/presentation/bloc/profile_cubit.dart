import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_profile.dart';
import '../../domain/entities/user_type.dart';
import 'profile_state.dart';

/// Cubit para gestionar el estado de la página de perfil
class ProfileCubit extends Cubit<ProfileState> {
  // Para ahora, usaremos datos mock directamente en el Cubit
  // En una implementación real, esto se inyectaría como dependencia
  // desde un repositorio que implementa la capa de dominio
  
  /// Constructor que inicia con estado Inicial
  ProfileCubit() : super(const ProfileInitial());

  /// Carga el perfil del usuario
  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    
    try {
      // Simulamos una carga de datos
      await Future.delayed(const Duration(milliseconds: 800));
      
      // En una implementación real, esto vendría de un use case/repositorio
      final mockProfile = _getMockProfile();
      emit(ProfileLoaded(profile: mockProfile));
    } catch (e) {
      emit(ProfileError(message: 'Error al cargar el perfil: ${e.toString()}'));
    }
  }

  /// Comienza flujo de registro como cliente
  void startClientRegistration() {
    emit(const ProfileUnauthenticated(activeRegistrationStep: 0));
  }

  /// Comienza flujo de registro como administrador
  void startAdminRegistration() {
    emit(const ProfileUnauthenticated(activeRegistrationStep: 0));
  }

  /// Avanza al siguiente paso en el flujo de registro
  void nextRegistrationStep() {
    final currentState = state;
    if (currentState is ProfileUnauthenticated) {
      emit(currentState.copyWith(
        activeRegistrationStep: currentState.activeRegistrationStep + 1,
      ));
    }
  }

  /// Regresa al paso anterior en el flujo de registro
  void previousRegistrationStep() {
    final currentState = state;
    if (currentState is ProfileUnauthenticated && 
        currentState.activeRegistrationStep > 0) {
      emit(currentState.copyWith(
        activeRegistrationStep: currentState.activeRegistrationStep - 1,
      ));
    }
  }

  /// Cambia la pestaña seleccionada
  void selectTab(int tabIndex) {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(selectedTabIndex: tabIndex));
    }
  }

  /// Actualiza la foto de perfil
  Future<void> updateProfileImage(String imageUrl) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(isUpdating: true));

      try {
        // Simular actualización en el servidor
        await Future.delayed(const Duration(milliseconds: 800));
        
        // Actualizar el perfil localmente
        final updatedProfile = currentState.profile.copyWith(
          imageUrl: imageUrl,
        );
        
        emit(currentState.copyWith(
          profile: updatedProfile,
          isUpdating: false,
        ));
      } catch (e) {
        emit(currentState.copyWith(
          isUpdating: false,
          updateError: 'Error al actualizar la imagen: ${e.toString()}',
        ));
      }
    }
  }

  /// Actualiza la información básica del perfil
  Future<void> updateBasicInfo({
    String? name,
    String? phoneNumber,
  }) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(isUpdating: true));

      try {
        // Simular actualización en el servidor
        await Future.delayed(const Duration(milliseconds: 800));
        
        // Actualizar el perfil localmente
        final updatedProfile = currentState.profile.copyWith(
          name: name,
          phoneNumber: phoneNumber,
        );
        
        emit(currentState.copyWith(
          profile: updatedProfile,
          isUpdating: false,
        ));
      } catch (e) {
        emit(currentState.copyWith(
          isUpdating: false,
          updateError: 'Error al actualizar la información: ${e.toString()}',
        ));
      }
    }
  }

  /// Agrega o elimina una barbería de favoritos (solo para clientes)
  Future<void> toggleFavoriteSalon(String salonId) async {
    final currentState = state;
    if (currentState is ProfileLoaded && 
        currentState.profile.userType == UserType.client &&
        currentState.profile.clientData != null) {
      
      emit(currentState.copyWith(isUpdating: true));
      
      try {
        // Obtener datos actuales de cliente
        final clientData = currentState.profile.clientData!;
        
        // Crear nueva lista de favoritos
        List<String> updatedFavorites;
        
        // Si ya está en favoritos, eliminar. Si no, agregar.
        if (clientData.favoriteSalons.contains(salonId)) {
          updatedFavorites = List.from(clientData.favoriteSalons)
            ..remove(salonId);
        } else {
          updatedFavorites = List.from(clientData.favoriteSalons)
            ..add(salonId);
        }
        
        // Actualizar datos de cliente
        final updatedClientData = clientData.copyWith(
          favoriteSalons: updatedFavorites,
        );
        
        // Actualizar perfil completo
        final updatedProfile = currentState.profile.copyWith(
          clientData: updatedClientData,
        );
        
        // Emitir estado actualizado
        emit(currentState.copyWith(
          profile: updatedProfile,
          isUpdating: false,
        ));
      } catch (e) {
        emit(currentState.copyWith(
          isUpdating: false,
          updateError: 'Error al actualizar favoritos: ${e.toString()}',
        ));
      }
    }
  }

  /// Método para crear un perfil mock para desarrollo
  UserProfile _getMockProfile() {
    // Crear un perfil de cliente para pruebas
    return UserProfile(
      id: 'user123',
      name: 'Juan Pérez',
      email: 'juan.perez@ejemplo.com',
      imageUrl: 'https://i.pravatar.cc/150?img=12',
      phoneNumber: '+598 99 123 456',
      userType: UserType.client,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      clientData: const ClientData(
        savedAddresses: [
          'Av. 18 de Julio 1234, Montevideo',
          'Dr. Tristán Narvaja 1456, Montevideo',
        ],
        favoriteSalons: [
          'salon123',
          'salon456',
        ],
        preferences: {
          'notificaciones': true,
          'servicioPreferido': 'corte_clasico',
        },
      ),
    );
  }

  // El método _getMockAdminProfile ha sido completamente eliminado
}
