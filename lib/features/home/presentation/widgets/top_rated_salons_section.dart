import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/salon.dart';
import '../bloc/home_cubit.dart';
import 'home_salon_card.dart';

/// Widget para mostrar la sección de salones mejor valorados.
///
/// Muestra una lista vertical de salones utilizando [HomeSalonCard].
/// Diseñado para ser reutilizable en diferentes partes de la aplicación.
class TopRatedSalonsSection extends StatelessWidget {
  /// Lista de salones a mostrar.
  final List<Salon> salons;

  /// Padding horizontal para cada elemento. Por defecto es 16.0.
  final double horizontalPadding;

  /// Padding vertical para cada elemento. Por defecto es 8.0.
  final double verticalPadding;

  /// Callback opcional que se ejecuta cuando se selecciona un salón.
  final Function(Salon)? onSalonSelected;
  
  /// Callback opcional que se ejecuta cuando se presiona el botón de favorito.
  final Function(String)? onFavoritePressed;

  const TopRatedSalonsSection({
    super.key,
    required this.salons,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 8.0,
    this.onSalonSelected,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: salons.map((salon) => 
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, 
            vertical: verticalPadding,
          ),
          child: GestureDetector(
            onTap: onSalonSelected != null ? () => onSalonSelected!(salon) : null,
            child: HomeSalonCard(
              salon: salon,
              onFavoritePressed: onFavoritePressed != null 
                  ? () => onFavoritePressed!(salon.id) 
                  : () => context.read<HomeCubit>().toggleFavorite(salon.id),
            ),
          ),
        )
      ).toList(),
    );
  }
}
