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

  /// Tipo de usuario (cliente o negocio)
  final UserType userType;

  /// Indica si el usuario está verificado
  final bool isVerified;

  /// Fecha de creación de la cuenta
  final DateTime createdAt;

  /// Datos específicos del cliente (nulo si es negocio)
  final ClientData? clientData;

  /// Datos específicos del negocio (nulo si es cliente)
  final BusinessData? businessData;

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
    this.businessData,
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
    businessData,
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
    BusinessData? businessData,
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
      businessData: businessData ?? this.businessData,
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

/// Datos específicos para negocio/barbería
class BusinessData extends Equatable {
  /// Información básica del negocio
  final String businessName;
  final String address;
  final String neighborhood;
  final String phoneNumber;
  final String email;

  /// Horarios de atención
  final Map<String, String> businessHours; // {"lunes": "09:00-18:00"}

  /// Servicios ofrecidos
  final List<String> services;

  /// Estado del negocio
  final bool isActive;
  final bool isVerified;

  /// Representante legal
  final String legalRepresentative;
  final String legalRepresentativePhone;

  /// Empleados del negocio
  final List<EmployeeData> employees;

  /// Constructor
  const BusinessData({
    required this.businessName,
    required this.address,
    required this.neighborhood,
    required this.phoneNumber,
    required this.email,
    required this.legalRepresentative,
    required this.legalRepresentativePhone,
    this.businessHours = const {},
    this.services = const [],
    this.isActive = true,
    this.isVerified = false,
    this.employees = const [],
  });

  @override
  List<Object?> get props => [
    businessName,
    address,
    neighborhood,
    phoneNumber,
    email,
    businessHours,
    services,
    isActive,
    isVerified,
    legalRepresentative,
    legalRepresentativePhone,
    employees,
  ];

  /// Crea una copia con campos actualizados
  BusinessData copyWith({
    String? businessName,
    String? address,
    String? neighborhood,
    String? phoneNumber,
    String? email,
    Map<String, String>? businessHours,
    List<String>? services,
    bool? isActive,
    bool? isVerified,
    String? legalRepresentative,
    String? legalRepresentativePhone,
    List<EmployeeData>? employees,
  }) {
    return BusinessData(
      businessName: businessName ?? this.businessName,
      address: address ?? this.address,
      neighborhood: neighborhood ?? this.neighborhood,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      businessHours: businessHours ?? this.businessHours,
      services: services ?? this.services,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      legalRepresentative: legalRepresentative ?? this.legalRepresentative,
      legalRepresentativePhone:
          legalRepresentativePhone ?? this.legalRepresentativePhone,
      employees: employees ?? this.employees,
    );
  }
}

/// Datos de empleado dentro de un negocio
class EmployeeData extends Equatable {
  /// Identificador único del empleado
  final String id;

  /// Nombre completo del empleado
  final String name;

  /// Rol dentro del negocio (Jefe, Encargado, Peluquero)
  final String role;

  /// Teléfono del empleado
  final String phone;

  /// Email del empleado
  final String email;

  /// Servicios que puede realizar
  final List<String> services;

  /// Estado del empleado
  final bool isActive;

  /// Fecha de contratación
  final DateTime hireDate;

  /// Constructor
  const EmployeeData({
    required this.id,
    required this.name,
    required this.role,
    required this.phone,
    required this.email,
    this.services = const [],
    this.isActive = true,
    required this.hireDate,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    role,
    phone,
    email,
    services,
    isActive,
    hireDate,
  ];

  /// Crea una copia con campos actualizados
  EmployeeData copyWith({
    String? id,
    String? name,
    String? role,
    String? phone,
    String? email,
    List<String>? services,
    bool? isActive,
    DateTime? hireDate,
  }) {
    return EmployeeData(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      services: services ?? this.services,
      isActive: isActive ?? this.isActive,
      hireDate: hireDate ?? this.hireDate,
    );
  }
}
