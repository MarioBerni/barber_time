import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme_extensions.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'user_type_option.dart';

/// Widget que muestra la vista para usuarios no autenticados
/// Permite seleccionar entre cliente y administrador
/// para el proceso de registro
class UnauthenticatedView extends StatelessWidget {
  /// Estado actual de perfil no autenticado
  final ProfileUnauthenticated state;

  /// Constructor
  const UnauthenticatedView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(child: _buildUserTypeSelection(context)),
    );
  }

  /// Construye la selección de tipo de usuario para registro
  Widget _buildUserTypeSelection(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Selecciona tu tipo de usuario',
            style: context.titleLarge.copyWith(color: context.primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Para brindarte la mejor experiencia, necesitamos saber '
            'qué tipo de usuario eres.',
            style: context.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Opción de cliente
          UserTypeOption(
            title: 'Cliente',
            description: 'Para personas que buscan servicios de barbería',
            icon: Icons.person,
            onTap: () => cubit.startClientRegistration(),
          ),

          const SizedBox(height: 16),

          // Opción de administrador
          UserTypeOption(
            title: 'Administrador',
            description: 'Para propietarios y empleados de barberías',
            icon: Icons.business,
            onTap: () => cubit.startAdminRegistration(),
          ),
        ],
      ),
    );
  }
}
