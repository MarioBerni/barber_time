import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/containers/app_containers.dart';
import '../../../../core/widgets/spacers/app_spacers.dart';
import '../../../profile/domain/entities/user_type.dart';

/// Componente de pestañas para navegación en la página de perfil
///
/// Permite la navegación entre diferentes secciones del perfil del usuario
/// mediante un conjunto de pestañas con iconos y texto.
class ProfileTabs extends StatelessWidget {
  /// Índice de la pestaña seleccionada actualmente
  final int selectedIndex;

  /// Tipo de usuario para mostrar pestañas específicas
  final UserType userType;

  /// Callback cuando se selecciona una pestaña
  final ValueChanged<int> onTabSelected;

  /// Constructor
  const ProfileTabs({
    super.key,
    required this.selectedIndex,
    required this.userType,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Definir las pestañas según el tipo de usuario
    final tabs = _getTabs(userType);

    return AppContainers.bordered(
      boxShadow: AppDesignConstants.shadowSubtle,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            tabs.length,
            (index) => _buildTab(context, index, tabs[index]),
          ),
        ),
      ),
    );
  }

  /// Construye una pestaña individual
  Widget _buildTab(BuildContext context, int index, _TabItem tab) {
    final isSelected = index == selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () => onTabSelected(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tab.icon,
              color: isSelected
                  ? context.accentColor
                  : context.textSecondaryColor,
              size: 24,
            ),
            AppSpacers.xs,
            Text(
              tab.label,
              style: context.bodySmall.copyWith(
                color: isSelected
                    ? context.accentColor
                    : context.textSecondaryColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Obtiene las pestañas según el tipo de usuario
  List<_TabItem> _getTabs(UserType userType) {
    // Pestañas comunes para todos los usuarios
    final commonTabs = [
      const _TabItem(icon: Icons.person_outline, label: 'Perfil'),
      const _TabItem(icon: Icons.history_outlined, label: 'Historial'),
    ];

    // Pestañas específicas según el tipo de usuario
    if (userType == UserType.client) {
      return [
        ...commonTabs,
        const _TabItem(
          icon: Icons.favorite_border_outlined,
          label: 'Favoritos',
        ),
        const _TabItem(icon: Icons.settings_outlined, label: 'Ajustes'),
      ];
    } else {
      // Usuario administrador
      return [
        ...commonTabs,
        const _TabItem(icon: Icons.store_outlined, label: 'Negocio'),
        const _TabItem(icon: Icons.settings_outlined, label: 'Ajustes'),
      ];
    }
  }
}

/// Clase auxiliar para representar una pestaña
class _TabItem {
  /// Icono de la pestaña
  final IconData icon;

  /// Etiqueta de texto
  final String label;

  /// Constructor
  const _TabItem({required this.icon, required this.label});
}
