import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme_extensions.dart';
import '../../../domain/entities/user_profile.dart';
import '../../../domain/entities/user_type.dart';
import '../profile_section.dart';
import 'components/address_item.dart';
import 'components/profile_info_row.dart';

/// Widget para la pestaña de información del perfil
class ProfileInfoTab extends StatelessWidget {
  /// Datos del perfil del usuario
  final UserProfile profile;

  /// Constructor
  const ProfileInfoTab({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          // Sección de información personal
          ProfileSection(
            title: 'Información Personal',
            icon: Icons.person,
            action: IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20),
              onPressed: () {
                // Implementar edición de información personal
              },
            ),
            child: _buildPersonalInfoContent(context),
          ),

          // Otras secciones específicas según el tipo de usuario
          if (profile.userType == UserType.client)
            ..._buildClientSpecificSections(context)
          else
            ..._buildAdminSpecificSections(context),
        ],
      ),
    );
  }

  /// Construye el contenido de información personal
  Widget _buildPersonalInfoContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInfoRow(
          label: 'Nombre',
          value: profile.name,
          icon: Icons.person_outline,
        ),
        ProfileInfoRow(
          label: 'Correo',
          value: profile.email,
          icon: Icons.email_outlined,
        ),
        ProfileInfoRow(
          label: 'Teléfono',
          value: profile.phoneNumber ?? 'No especificado',
          icon: Icons.phone_outlined,
        ),
        ProfileInfoRow(
          label: 'Fecha de registro',
          value: profile.createdAt.toString().split(' ')[0],
          icon: Icons.calendar_today_outlined,
        ),
      ],
    );
  }

  /// Construye secciones específicas para clientes
  List<Widget> _buildClientSpecificSections(BuildContext context) {
    final clientData = profile.clientData;
    if (clientData == null) {
      return [];
    }

    return [
      const SizedBox(height: 16),

      // Sección de preferencias
      ProfileSection(
        title: 'Preferencias',
        icon: Icons.tune,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Convertir Map de preferencias a lista de chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: clientData.preferences.entries
                  .map(
                    (entry) => Chip(
                      label: Text('${entry.key}: ${entry.value}'),
                      backgroundColor: context.primaryLightColor,
                      padding: const EdgeInsets.all(4),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),

      // Sección de direcciones
      if (clientData.savedAddresses.isNotEmpty)
        ProfileSection(
          title: 'Direcciones',
          icon: Icons.location_on,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: clientData.savedAddresses
                .map((address) => AddressItem(address: address))
                .toList(),
          ),
        ),
    ];
  }

  /// Construye secciones específicas para administradores
  List<Widget> _buildAdminSpecificSections(BuildContext context) {
    // TODO: Implementar cuando se agregue adminData al modelo UserProfile
    return [];
  }
}
