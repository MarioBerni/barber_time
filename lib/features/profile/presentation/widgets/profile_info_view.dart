import 'package:flutter/material.dart';

import '../../domain/entities/user_profile.dart';
import '../../domain/entities/user_type.dart';

/// Widget que muestra la información principal del perfil del usuario
///
/// Muestra datos personales diferentes según el tipo de usuario (Cliente o Administrador)
class ProfileInfoView extends StatelessWidget {
  /// Información del perfil a mostrar
  final UserProfile profile;

  /// Constructor
  const ProfileInfoView({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la sección
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Información personal',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          
          // Datos del perfil según tipo de usuario
          if (profile.userType == UserType.client)
            _buildClientProfileInfo(context)
          else
            _buildAdminProfileInfo(context),
        ],
      ),
    );
  }

  /// Construye la información para perfiles de Cliente
  Widget _buildClientProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(context, 'Nombre', profile.name),
        _buildInfoItem(context, 'Correo', profile.email),
        _buildInfoItem(context, 'Teléfono', profile.phoneNumber ?? 'No especificado'),
        // Los siguientes datos vendrían de ClientData cuando se implemente completamente
        _buildInfoItem(context, 'Barrio', 'No especificado'),
        
        const SizedBox(height: 32),
        
        // Sección de estadísticas
        Text(
          'Estadísticas',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        _buildInfoItem(context, 'Citas realizadas', '12'),
        _buildInfoItem(context, 'Barberías favoritas', '3'),
        _buildInfoItem(context, 'Cliente desde', 'Marzo 2025'),
      ],
    );
  }

  /// Construye la información para perfiles de Administrador
  Widget _buildAdminProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(context, 'Nombre', profile.name),
        _buildInfoItem(context, 'Correo', profile.email),
        _buildInfoItem(context, 'Teléfono', profile.phoneNumber ?? 'No especificado'),
        
        const SizedBox(height: 24),
        
        // Información del negocio
        Text(
          'Información del negocio',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        _buildInfoItem(context, 'Nombre del negocio', 'Barbería Premium'),
        _buildInfoItem(context, 'Ubicación', 'Pocitos, Montevideo'),
        _buildInfoItem(context, 'Horarios', 'Lun-Sáb: 9:00-20:00'),
        _buildInfoItem(context, 'Servicios', '12 servicios configurados'),
        
        // Botón para gestionar negocio
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Implementar navegación a gestión de negocio
          },
          child: const Text('Gestionar mi negocio'),
        ),
      ],
    );
  }

  /// Construye un ítem de información con título y contenido
  Widget _buildInfoItem(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$title:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
