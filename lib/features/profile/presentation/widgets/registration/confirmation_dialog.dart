import 'package:flutter/material.dart';

import '../../../../../core/theme/app_design_constants.dart';
import '../../../../../core/theme/app_theme_extensions.dart';
import '../../../../../core/widgets/spacers/spacers.dart';

/// Diálogo de confirmación para mostrar los datos del formulario
/// antes de enviar
class ConfirmationDialog extends StatelessWidget {
  /// Datos del formulario a confirmar
  final Map<String, String> formData;

  /// Callback cuando se confirma
  final VoidCallback onConfirm;

  /// Constructor
  const ConfirmationDialog({
    super.key,
    required this.formData,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.charcoalMedium,
      shape: RoundedRectangleBorder(
        borderRadius: AppDesignConstants.dialogBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: context.primaryColor,
                  size: 24,
                ),
                AppSpacers.hSm,
                Expanded(
                  child: Text(
                    'Confirmar Datos',
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            AppSpacers.md,

            // Descripción
            Text(
              'Por favor, verifica que la siguiente información sea correcta:',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.secondaryTextColor,
              ),
            ),

            AppSpacers.lg,

            // Lista de datos
            ...formData.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${entry.key}:',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSpacers.hSm,
                    Expanded(
                      child: Text(
                        entry.value,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            AppSpacers.lg,

            // Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.secondaryTextColor,
                      side: BorderSide(color: context.grayDark),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppDesignConstants.standardBorderRadius,
                      ),
                    ),
                    child: const Text('Cancelar'),
                  ),
                ),
                AppSpacers.hMd,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppDesignConstants.standardBorderRadius,
                      ),
                    ),
                    child: const Text('Confirmar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
