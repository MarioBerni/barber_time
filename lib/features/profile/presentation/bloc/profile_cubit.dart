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
      await Future<void>.delayed(const Duration(milliseconds: 800));

      // Para testing: actualmente configurado para simular
      // usuario no autenticado
      // Para simular usuario autenticado, descomenta el código comentado abajo

      // Usuario no autenticado - mostrar selección de tipo de usuario
      emit(const ProfileUnauthenticated());

      // Código para cuando el usuario está autenticado -
      // descomentar cuando sea necesario
      /*
      if (hasValidSession) {
        // En una implementación real, esto vendría de un use case/repositorio
        final mockProfile = _getMockProfile();
        emit(ProfileLoaded(profile: mockProfile));
      }
      */
    } catch (e) {
      emit(ProfileError(message: 'Error al cargar el perfil: ${e.toString()}'));
    }
  }

  /// Comienza flujo de registro como cliente
  void startClientRegistration() {
    emit(const ProfileClientRegistration());
  }

  /// Comienza flujo de registro como negocio
  void startBusinessRegistration() {
    emit(const ProfileBusinessRegistration());
  }

  /// Actualiza datos del formulario de registro de cliente
  void updateClientFormField(String field, String value) {
    final currentState = state;
    if (currentState is ProfileClientRegistration) {
      final updatedFormData = Map<String, String>.from(currentState.formData);
      updatedFormData[field] = value;

      // Limpiar errores del campo si hay
      final updatedErrors = Map<String, String>.from(currentState.fieldErrors)
        ..remove(field);

      emit(
        currentState.copyWith(
          formData: updatedFormData,
          fieldErrors: updatedErrors,
        ),
      );
    }
  }

  /// Actualiza datos del formulario de registro de negocio
  void updateBusinessFormField(String field, String value) {
    final currentState = state;
    if (currentState is ProfileBusinessRegistration) {
      final updatedFormData = Map<String, String>.from(currentState.formData);
      updatedFormData[field] = value;

      // Limpiar errores del campo si hay
      final updatedErrors = Map<String, String>.from(currentState.fieldErrors)
        ..remove(field);

      emit(
        currentState.copyWith(
          formData: updatedFormData,
          fieldErrors: updatedErrors,
        ),
      );
    }
  }

  /// Valida los campos del formulario de cliente
  Map<String, String> _validateClientForm(Map<String, String> formData) {
    final errors = <String, String>{};

    // Validar nombre
    final name = formData['name']?.trim() ?? '';
    if (name.isEmpty) {
      errors['name'] = 'El nombre es requerido';
    } else if (name.length < 2) {
      errors['name'] = 'El nombre debe tener al menos 2 caracteres';
    }

    // Validar email
    final email = formData['email']?.trim() ?? '';
    if (email.isEmpty) {
      errors['email'] = 'El email es requerido';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      errors['email'] = 'Ingresa un email válido';
    }

    // Validar teléfono (opcional pero si se provee debe ser válido)
    final phone = formData['phone']?.trim() ?? '';
    if (phone.isNotEmpty) {
      // Validación mejorada para números internacionales
      // Acepta formato internacional completo (ej: +598 99 123 456)
      if (!RegExp(
        r'^\+\d{1,4}\s?\d{6,15}$',
      ).hasMatch(phone.replaceAll(RegExp(r'\s+'), ' '))) {
        errors['phone'] = 'Número de teléfono inválido';
      }
    }

    return errors;
  }

  /// Envía el formulario de registro de cliente
  Future<void> submitClientRegistration() async {
    final currentState = state;
    if (currentState is ProfileClientRegistration) {
      // Validar formulario
      final errors = _validateClientForm(currentState.formData);

      if (errors.isNotEmpty) {
        emit(currentState.copyWith(fieldErrors: errors));
        return;
      }

      emit(currentState.copyWith(isSubmitting: true));

      try {
        // Simular registro en servidor
        await Future<void>.delayed(const Duration(milliseconds: 1500));

        // Crear perfil de cliente mock con los datos del formulario
        final newProfile = UserProfile(
          id: 'client_${DateTime.now().millisecondsSinceEpoch}',
          name: currentState.formData['name']!,
          email: currentState.formData['email']!,
          phoneNumber: currentState.formData['phone']?.isNotEmpty == true
              ? currentState.formData['phone']
              : null,
          userType: UserType.client,
          createdAt: DateTime.now(),
          clientData: const ClientData(),
        );

        emit(ProfileLoaded(profile: newProfile));
      } catch (e) {
        emit(
          currentState.copyWith(
            isSubmitting: false,
            registrationError: 'Error al registrar: ${e.toString()}',
          ),
        );
      }
    }
  }

  /// Valida los campos del formulario de negocio
  Map<String, String> _validateBusinessForm(Map<String, String> formData) {
    final errors = <String, String>{};

    // Validar nombre del representante
    final name = formData['name']?.trim() ?? '';
    if (name.isEmpty) {
      errors['name'] = 'El nombre es requerido';
    } else if (name.length < 2) {
      errors['name'] = 'El nombre debe tener al menos 2 caracteres';
    }

    // Validar email
    final email = formData['email']?.trim() ?? '';
    if (email.isEmpty) {
      errors['email'] = 'El email es requerido';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      errors['email'] = 'Ingresa un email válido';
    }

    // Validar teléfono
    final phone = formData['phone']?.trim() ?? '';
    if (phone.isNotEmpty) {
      if (!RegExp(
        r'^\+\d{1,4}\s?\d{6,15}$',
      ).hasMatch(phone.replaceAll(RegExp(r'\s+'), ' '))) {
        errors['phone'] = 'Número de teléfono inválido';
      }
    }

    // Validar nombre del negocio
    final businessName = formData['businessName']?.trim() ?? '';
    if (businessName.isEmpty) {
      errors['businessName'] = 'El nombre del negocio es requerido';
    }

    // Validar dirección
    final address = formData['address']?.trim() ?? '';
    if (address.isEmpty) {
      errors['address'] = 'La dirección es requerida';
    }

    // Validar barrio
    final neighborhood = formData['neighborhood']?.trim() ?? '';
    if (neighborhood.isEmpty) {
      errors['neighborhood'] = 'El barrio es requerido';
    }

    // Validar representante legal
    final legalRepresentative = formData['legalRepresentative']?.trim() ?? '';
    if (legalRepresentative.isEmpty) {
      errors['legalRepresentative'] = 'El representante legal es requerido';
    }

    return errors;
  }

  /// Envía el formulario de registro de negocio
  Future<void> submitBusinessRegistration() async {
    final currentState = state;
    if (currentState is ProfileBusinessRegistration) {
      // Validar formulario
      final errors = _validateBusinessForm(currentState.formData);

      if (errors.isNotEmpty) {
        emit(currentState.copyWith(fieldErrors: errors));
        return;
      }

      emit(currentState.copyWith(isSubmitting: true));

      try {
        // Simular registro en servidor
        await Future<void>.delayed(const Duration(milliseconds: 1500));

        // Crear perfil de negocio mock con los datos del formulario
        final newProfile = UserProfile(
          id: 'business_${DateTime.now().millisecondsSinceEpoch}',
          name: currentState.formData['name']!,
          email: currentState.formData['email']!,
          phoneNumber: currentState.formData['phone']?.isNotEmpty == true
              ? currentState.formData['phone']
              : null,
          userType: UserType.business,
          createdAt: DateTime.now(),
          businessData: BusinessData(
            businessName: currentState.formData['businessName']!,
            address: currentState.formData['address']!,
            neighborhood: currentState.formData['neighborhood']!,
            phoneNumber: currentState.formData['phone'] ?? '',
            email: currentState.formData['email']!,
            legalRepresentative: currentState.formData['legalRepresentative']!,
            legalRepresentativePhone: currentState.formData['legalPhone'] ?? '',
          ),
        );

        emit(ProfileLoaded(profile: newProfile));
      } catch (e) {
        emit(
          currentState.copyWith(
            isSubmitting: false,
            registrationError: 'Error al registrar: ${e.toString()}',
          ),
        );
      }
    }
  }

  /// Regresa a la selección de tipo de usuario
  void backToUserTypeSelection() {
    emit(const ProfileUnauthenticated());
  }

  /// Método para testing: simula logout y muestra selección de usuario
  void logout() {
    emit(const ProfileUnauthenticated());
  }

  /// Método para testing: simula login con perfil mock
  void loginWithMockProfile() {
    final mockProfile = _getMockProfile();
    emit(ProfileLoaded(profile: mockProfile));
  }

  /// Avanza al siguiente paso en el flujo de registro
  void nextRegistrationStep() {
    final currentState = state;
    if (currentState is ProfileUnauthenticated) {
      emit(
        currentState.copyWith(
          activeRegistrationStep: currentState.activeRegistrationStep + 1,
        ),
      );
    }
  }

  /// Regresa al paso anterior en el flujo de registro
  void previousRegistrationStep() {
    final currentState = state;
    if (currentState is ProfileUnauthenticated &&
        currentState.activeRegistrationStep > 0) {
      emit(
        currentState.copyWith(
          activeRegistrationStep: currentState.activeRegistrationStep - 1,
        ),
      );
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
        await Future<void>.delayed(const Duration(milliseconds: 800));

        // Actualizar el perfil localmente
        final updatedProfile = currentState.profile.copyWith(
          imageUrl: imageUrl,
        );

        emit(currentState.copyWith(profile: updatedProfile, isUpdating: false));
      } catch (e) {
        emit(
          currentState.copyWith(
            isUpdating: false,
            updateError: 'Error al actualizar la imagen: ${e.toString()}',
          ),
        );
      }
    }
  }

  /// Actualiza la información básica del perfil
  Future<void> updateBasicInfo({String? name, String? phoneNumber}) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(currentState.copyWith(isUpdating: true));

      try {
        // Simular actualización en el servidor
        await Future<void>.delayed(const Duration(milliseconds: 800));

        // Actualizar el perfil localmente
        final updatedProfile = currentState.profile.copyWith(
          name: name,
          phoneNumber: phoneNumber,
        );

        emit(currentState.copyWith(profile: updatedProfile, isUpdating: false));
      } catch (e) {
        emit(
          currentState.copyWith(
            isUpdating: false,
            updateError: 'Error al actualizar la información: ${e.toString()}',
          ),
        );
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
          updatedFavorites = List.from(clientData.favoriteSalons)..add(salonId);
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
        emit(currentState.copyWith(profile: updatedProfile, isUpdating: false));
      } catch (e) {
        emit(
          currentState.copyWith(
            isUpdating: false,
            updateError: 'Error al actualizar favoritos: ${e.toString()}',
          ),
        );
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
        favoriteSalons: ['salon123', 'salon456'],
        preferences: {
          'notificaciones': true,
          'servicioPreferido': 'corte_clasico',
        },
      ),
    );
  }

  // El método _getMockAdminProfile ha sido completamente eliminado
}
