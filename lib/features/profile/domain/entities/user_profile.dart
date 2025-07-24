import 'package:equatable/equatable.dart';
import 'user_type.dart';

/// Entidad que representa el perfil de un usuario en la aplicación
class UserProfile extends Equatable {
  /// Identificador único del usuario
  final String id;
  
  /// Nombre completo del usuario
  final String name;
  
  /// Correo electrónico del usuario
  final String email;
  
  /// URL de la imagen de perfil (puede ser nula)
  final String? imageUrl;
  
  /// Número de teléfono (puede ser nulo)
  final String? phoneNumber;
  
  /// Tipo de usuario (cliente o administrador)
  final UserType userType;
  
  /// Indica si el usuario está verificado
  final bool isVerified;
  
  /// Fecha de creación de la cuenta
  final DateTime createdAt;

  /// Datos específicos del cliente (nulo si es administrador)
  final ClientData? clientData;
  
  /// Datos específicos del administrador (nulo si es cliente)
  final AdminData? adminData;

  /// Constructor con valores requeridos y opcionales
  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.createdAt,
    this.imageUrl,
    this.phoneNumber,
    this.isVerified = false,
    this.clientData,
    this.adminData,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    imageUrl,
    phoneNumber,
    userType,
    isVerified,
    createdAt,
    clientData,
    adminData,
  ];
  
  /// Crea una copia del perfil con campos actualizados
  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
    String? phoneNumber,
    UserType? userType,
    bool? isVerified,
    DateTime? createdAt,
    ClientData? clientData,
    AdminData? adminData,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userType: userType ?? this.userType,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      clientData: clientData ?? this.clientData,
      adminData: adminData ?? this.adminData,
    );
  }
}

/// Datos específicos para usuario de tipo Cliente
class ClientData extends Equatable {
  /// Direcciones guardadas del cliente
  final List<String> savedAddresses;
  
  /// IDs de barberías favoritas
  final List<String> favoriteSalons;
  
  /// Preferencias del cliente
  final Map<String, dynamic> preferences;

  /// Constructor
  const ClientData({
    this.savedAddresses = const [],
    this.favoriteSalons = const [],
    this.preferences = const {},
  });

  @override
  List<Object?> get props => [savedAddresses, favoriteSalons, preferences];
  
  /// Crea una copia con campos actualizados
  ClientData copyWith({
    List<String>? savedAddresses,
    List<String>? favoriteSalons,
    Map<String, dynamic>? preferences,
  }) {
    return ClientData(
      savedAddresses: savedAddresses ?? this.savedAddresses,
      favoriteSalons: favoriteSalons ?? this.favoriteSalons,
      preferences: preferences ?? this.preferences,
    );
  }
}

/// Datos específicos para usuario de tipo Administrador
class AdminData extends Equatable {
  /// ID de la barbería asociada
  final String salonId;
  
  /// Rol dentro de la barbería (dueño, empleado, etc.)
  final String role;
  
  /// Servicios que puede realizar este administrador
  final List<String> providedServices;
  
  /// Permisos específicos del administrador
  final List<String> permissions;

  /// Constructor
  const AdminData({
    required this.salonId,
    required this.role,
    this.providedServices = const [],
    this.permissions = const [],
  });

  @override
  List<Object?> get props => [salonId, role, providedServices, permissions];
  
  /// Crea una copia con campos actualizados
  AdminData copyWith({
    String? salonId,
    String? role,
    List<String>? providedServices,
    List<String>? permissions,
  }) {
    return AdminData(
      salonId: salonId ?? this.salonId,
      role: role ?? this.role,
      providedServices: providedServices ?? this.providedServices,
      permissions: permissions ?? this.permissions,
    );
  }
}
