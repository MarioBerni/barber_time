import 'package:flutter/material.dart';
import '../../../core/theme/app_theme_extensions.dart';

/// Widget reutilizable para mostrar el avatar de un usuario
/// 
/// Permite personalizar el tamaño, si tiene borde, y si muestra indicador de estado
/// Es completamente adaptable al sistema de temas de la aplicación
class UserAvatar extends StatelessWidget {
  /// URL de la imagen del avatar (opcional)
  final String? imageUrl;
  
  /// Nombre del usuario para generar iniciales si no hay imagen
  final String? userName;
  
  /// Radio del avatar (tamaño)
  final double radius;
  
  /// Si debe mostrar un borde alrededor del avatar
  final bool showBorder;
  
  /// Color del borde (opcional, usa accentColor por defecto)
  final Color? borderColor;
  
  /// Ancho del borde
  final double borderWidth;
  
  /// Si el usuario está activo/en línea
  final bool isActive;
  
  /// Constructor principal
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
    return Stack(
      children: [
        // Avatar con borde opcional
        Container(
          decoration: showBorder
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor ?? context.accentColor,
                    width: borderWidth,
                  ),
                )
              : null,
          child: _buildAvatar(context),
        ),
        
        // Indicador de estado (activo/en línea)
        if (isActive)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.4,
              height: radius * 0.4,
              decoration: BoxDecoration(
                color: context.successColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.backgroundColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Construye el widget interno del avatar basado en la disponibilidad de imagen
  Widget _buildAvatar(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      // Avatar con imagen de red
      return CircleAvatar(
        radius: radius,
        backgroundColor: context.pearlGray,
        backgroundImage: NetworkImage(imageUrl!),
      );
    } else if (userName != null && userName!.isNotEmpty) {
      // Avatar con iniciales del usuario
      final initials = _getInitials(userName!);
      return CircleAvatar(
        radius: radius,
        backgroundColor: context.primaryColor,
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: radius * 0.7,
          ),
        ),
      );
    } else {
      // Avatar por defecto
      return CircleAvatar(
        radius: radius,
        backgroundColor: context.pearlGray,
        child: Icon(
          Icons.person,
          color: context.metalGray,
          size: radius * 1.2,
        ),
      );
    }
  }

  /// Obtiene las iniciales de un nombre completo
  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts.first.isNotEmpty) {
      return parts.first[0].toUpperCase();
    }
    return '';
  }
}
