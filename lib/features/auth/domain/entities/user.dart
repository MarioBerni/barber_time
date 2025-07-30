import 'package:equatable/equatable.dart';

/// Entidad de dominio que representa a un usuario autenticado
class User extends Equatable {
  /// El ID único del usuario.
  final String id;

  /// El email del usuario.
  final String email;

  /// El nombre del usuario.
  final String name;

  /// La URL de la imagen de perfil del usuario (opcional).
  final String? profileImage;

  /// El rol del usuario (ej. 'client' o 'barber').
  final String role; // 'client' o 'barber'
  /// La fecha y hora de creación de la cuenta del usuario.
  final DateTime createdAt;

  /// Indica si el email del usuario ha sido verificado.
  final bool isEmailVerified;

  /// Constructor para la entidad User.
  const User({
    required this.id,
    required this.email,
    required this.name,
    this.profileImage,
    required this.role,
    required this.createdAt,
    required this.isEmailVerified,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    profileImage,
    role,
    createdAt,
    isEmailVerified,
  ];

  /// Método para crear una copia de User con algunos campos modificados
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImage,
    String? role,
    DateTime? createdAt,
    bool? isEmailVerified,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
