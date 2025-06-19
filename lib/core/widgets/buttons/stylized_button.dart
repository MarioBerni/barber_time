// Este es un archivo barril (barrel file) que proporciona una API pública consistente
// mientras internamente se organiza el código en múltiples archivos más pequeños.

// Exportamos los tipos
export 'stylized_button_types.dart';

// Exportamos las utilidades de estilo (opcional, según necesidades de acceso externo)
export 'stylized_button_style.dart';

// Exportamos las animaciones (opcional, según necesidades de acceso externo)
export 'stylized_button_animations.dart';

// Exportamos el componente principal StylizedButton
// Esta es la exportación más importante para mantener compatibilidad con el código existente
export 'stylized_button_base.dart';