import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';

/// Diálogo de confirmación premium con resumen de datos
class ConfirmationDialog extends StatelessWidget {
  /// Datos del formulario para mostrar
  final Map<String, String?> formData;

  /// Callback cuando se confirma
  final VoidCallback? onConfirm;

  /// Callback cuando se cancela
  final VoidCallback? onCancel;

  /// Constructor
  const ConfirmationDialog({
    super.key,
    required this.formData,
    this.onConfirm,
    this.onCancel,
  });

  /// Muestra el diálogo
  static Future<bool?> show(
    BuildContext context, {
    required Map<String, String?> formData,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) => ConfirmationDialog(
        formData: formData,
        onConfirm: () => Navigator.of(dialogContext).pop(true),
        onCancel: () => Navigator.of(dialogContext).pop(false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppTheme.kSurfaceColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppTheme.kPrimaryColor.withAlpha((0.4 * 255).round()),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.5 * 255).round()),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
            BoxShadow(
              color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildTitle(context),
            const SizedBox(height: 12),
            _buildMessage(context),
            const SizedBox(height: 24),
            _buildDataSummary(context),
            const SizedBox(height: 28),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  /// Construye el header con icono
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
            AppTheme.kPrimaryLightColor.withAlpha((0.1 * 255).round()),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(Icons.stars_rounded, color: AppTheme.kMediumGold, size: 32),
    );
  }

  /// Construye el título
  Widget _buildTitle(BuildContext context) {
    return Text(
      '¡Bienvenido a Barber Time!',
      style: context.h2.copyWith(
        color: AppTheme.kOffWhite,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Construye el mensaje
  Widget _buildMessage(BuildContext context) {
    return Text(
      'Estás a punto de crear tu cuenta premium.\n'
      '¿Confirmas que todos los datos son correctos?',
      style: context.bodyMedium.copyWith(
        color: AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Construye el resumen de datos
  Widget _buildDataSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.kCharcoalDark.withAlpha((0.6 * 255).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
        ),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.person_outline_rounded,
            label: 'Nombre',
            value: formData['name'] ?? '',
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: formData['email'] ?? '',
          ),
          if (formData['phone']?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.phone_outlined,
              label: 'WhatsApp',
              value: formData['phone'] ?? '',
            ),
          ],
        ],
      ),
    );
  }

  /// Construye los botones de acción
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        // Botón cancelar
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.kCharcoalLight),
            ),
            child: TextButton(
              onPressed: onCancel,
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.kOffWhite.withAlpha(
                  (0.8 * 255).round(),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Revisar',
                style: context.button.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Botón confirmar
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [AppTheme.kMediumGold, AppTheme.kDarkGold],
              ),
            ),
            child: TextButton(
              onPressed: onConfirm,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_rounded, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'Confirmar',
                    style: context.button.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Widget helper para las filas de información
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.kPrimaryColor, size: 16),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: context.bodySmall.copyWith(
            color: AppTheme.kOffWhite.withAlpha((0.7 * 255).round()),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: context.bodySmall.copyWith(
              color: AppTheme.kOffWhite,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
