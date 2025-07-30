import 'package:flutter/material.dart';
import '../../../core/theme/app_theme_extensions.dart';

/// Widget reutilizable para mostrar el avatar de un usuario.
///
/// Permite personalizar el tamaño, si tiene borde, y si muestra un indicador
/// de estado. Es completamente adaptable al sistema de temas de la aplicación.
class UserAvatar extends StatelessWidget {
  /// URL de la imagen del avatar (opcional).
  final String? imageUrl;

  /// Nombre del usuario para generar iniciales si no hay imagen.
  final String? userName;

  /// Radio del avatar (tamaño).
  final double radius;

  /// Si debe mostrar un borde alrededor del avatar.
  final bool showBorder;

  /// Color del borde (opcional, usa accentColor por defecto).
  final Color? borderColor;

  /// Ancho del borde.
  final double borderWidth;

  /// Si el usuario está activo/en línea.
  final bool isActive;

  /// Constructor principal.
  const UserAvatar({
    super.key,
    this.imageUrl,
    this.userName,
    this.radius = 20.0,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 2.0,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget avatar = _buildAvatar(context);

    if (showBorder) {
      avatar = DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? context.accentColor,
            width: borderWidth,
          ),
        ),
        child: avatar,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        avatar,
        if (isActive)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.45,
              height: radius * 0.45,
              decoration: BoxDecoration(
                color: context.successColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.backgroundColor,
                  width: borderWidth * 0.7,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Construye el widget interno del avatar.
  Widget _buildAvatar(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: context.pearlGray,
        backgroundImage: NetworkImage(imageUrl!),
      );
    } else if (userName != null && userName!.isNotEmpty) {
      final initials = _getInitials(userName!);
      return CircleAvatar(
        radius: radius,
        backgroundColor: context.primaryColor,
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: radius * 0.8,
          ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundColor: context.pearlGray,
        child: Icon(Icons.person, color: context.metalGray, size: radius * 1.2),
      );
    }
  }

  /// Obtiene las iniciales de un nombre completo.
  String _getInitials(String name) {
    final parts = name.trim().split(' ').where((part) => part.isNotEmpty);
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.elementAt(1)[0]}'.toUpperCase();
    } else if (parts.isNotEmpty) {
      return parts.first[0].toUpperCase();
    }
    return '';
  }
}
