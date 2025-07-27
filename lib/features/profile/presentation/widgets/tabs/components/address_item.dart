import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme_extensions.dart';

/// Widget reutilizable para mostrar una dirección en el perfil
class AddressItem extends StatelessWidget {
  /// La dirección a mostrar
  final String address;
  
  /// Constructor
  const AddressItem({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 18,
            color: context.primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              address,
              style: context.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
