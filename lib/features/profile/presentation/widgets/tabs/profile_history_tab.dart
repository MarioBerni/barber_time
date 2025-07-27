import 'package:flutter/material.dart';

import '../../../domain/entities/user_profile.dart';
import '../profile_section.dart';

/// Widget para la pestaña de historial de citas del perfil
class ProfileHistoryTab extends StatelessWidget {
  /// Datos del perfil del usuario
  final UserProfile profile;
  
  /// Constructor
  const ProfileHistoryTab({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ProfileSection(
            title: 'Historial de Citas',
            icon: Icons.calendar_today,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Historial de citas pendiente de implementación'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
