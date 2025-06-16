import 'package:equatable/equatable.dart';

/// Entidad de dominio que representa a un usuario autenticado
class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? profileImage;
  final String role; // 'client' o 'barber'
  final DateTime createdAt;
  final bool isEmailVerified;

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
  List<Object?> get props => [id, email, name, profileImage, role, createdAt, isEmailVerified];

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
