# Registro de Correcciones de Linting

## Fecha: 2025-07-27

### Correcciones Implementadas

#### Deprecateds corregidos:
- Reemplazo de `background` y `onBackground` por `surface` y `onSurface` en `app_theme.dart`
- Reemplazo de `withOpacity` por `withAlpha` para evitar pérdida de precisión en:
  - `app_theme.dart`
  - `search_bar.dart`
  - `bottom_navigation_bar.dart`
  - `profile_section.dart`
  - `profile_tabs.dart`

#### Elementos no utilizados eliminados:
- Método `_getBackgroundColor` eliminado en `home_header.dart`

#### Sugerencias Info aplicadas:
- Eliminación de comentarios de documentación colgantes en `montevideo_barrios.dart`
- Aplicación de super parámetros en constructores de widgets:
  - `profile_page.dart`
  - `profile_info_view.dart`
  - `profile_section.dart`
  - `profile_tabs.dart`
  - `profile_business_tab.dart`
  - `profile_favorites_tab.dart`
  - `profile_history_tab.dart`
  - `profile_settings_tab.dart`
  - `address_item.dart`
  - `profile_info_row.dart`
  - `profile_info_tab.dart`
  - `unauthenticated_view.dart`
  - `user_type_option.dart`

### Beneficios
- Código más limpio y mantenible
- Eliminación de advertencias y errores de linting
- Adherencia a las mejores prácticas de desarrollo Flutter
- Preparación del código para actualizaciones futuras de Flutter
