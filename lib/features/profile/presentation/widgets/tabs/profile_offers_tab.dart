import 'package:flutter/material.dart';

import '../../../domain/entities/user_profile.dart';
import '../profile_section.dart';

/// Widget para la pestaña de ofertas especiales del perfil
/// (solo para clientes)
class ProfileOffersTab extends StatelessWidget {
  /// Datos del perfil del usuario
  final UserProfile profile;

  /// Constructor
  const ProfileOffersTab({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ProfileSection(
            title: 'Ofertas Especiales',
            icon: Icons.local_offer,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.local_offer_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ofertas Especiales',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Aquí encontrarás las mejores ofertas y promociones de barberías',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
