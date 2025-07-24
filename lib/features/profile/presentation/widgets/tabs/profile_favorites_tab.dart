import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme_extensions.dart';
import '../../../domain/entities/user_profile.dart';
import '../profile_section.dart';

/// Widget para la pestaña de barberías favoritas del perfil (solo para clientes)
class ProfileFavoritesTab extends StatelessWidget {
  /// Datos del perfil del usuario
  final UserProfile profile;
  
  /// Constructor
  const ProfileFavoritesTab({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ProfileSection(
            title: 'Barberías Favoritas',
            icon: Icons.favorite,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Favoritos pendiente de implementación'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
