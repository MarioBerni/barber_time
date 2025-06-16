# 🧩 Barber Time: Guía de Modularización

## Propósito
Este documento establece reglas claras y procesos específicos para modularizar correctamente el código, evitar duplicación y mantener una estructura organizada en todo el proyecto Barber Time.

## 1. Principios de Modularización

### 1.1 Responsabilidad Única
- Cada archivo debe tener una única razón para cambiar
- Cada clase o componente debe cumplir una función específica
- Evitar crear "archivos multipropósito" o "clases Dios"

### 1.2 Detección Temprana
- Planificar la modularización **antes** de comenzar a codificar
- Identificar submódulos potenciales en la fase de diseño
- No esperar a que un archivo crezca para dividirlo

### 1.3 Reutilización vs. Duplicación
- Crear componentes con intención de reutilización
- Establecer un proceso para identificar código similar existente
- Aplicar el principio DRY (Don't Repeat Yourself)

## 2. Reglas de Oro para Evitar Problemas Comunes

### 2.1 Límite Estricto de Tamaño
- **Regla crítica:** Ningún archivo debe exceder las 200 líneas
- Configurar linting para alertar cuando se acerque a este límite (150+ líneas)
- Los revisores de código deben rechazar PRs con archivos que superen este límite

### 2.2 Señales de Alerta para Refactorizar
- Un widget tiene más de 3 niveles de anidación
- Un método tiene más de 20 líneas
- Una clase contiene más de 5 métodos
- Un archivo importa más de 10 dependencias
- Un componente maneja múltiples responsabilidades

### 2.3 Prevención de Duplicación
- **Obligatorio:** Buscar componentes similares antes de crear uno nuevo
- Mantener un catálogo de widgets comunes en la documentación
- Realizar revisiones periódicas para identificar código similar

## 3. Guía Práctica de Modularización

### 3.1 Cómo Dividir un Widget Grande
```
📂 features/
  📂 auth/
    📂 presentation/
      📂 pages/
        📄 login_page.dart             // Composición principal (100-150 líneas)
      📂 widgets/
        📄 login_form.dart             // Formulario extraído (80-120 líneas)
        📄 login_header.dart           // Encabezado extraído (30-50 líneas)
        📄 social_login_buttons.dart   // Botones de redes sociales (50-80 líneas)
        📄 remember_me_section.dart    // Sección "recuérdame" (20-40 líneas)
```

### 3.2 Estrategias de Modularización por Tipo

#### Widgets de UI
- Extraer secciones visuales coherentes en widgets separados
- Crear componentes base reutilizables (botones, campos, tarjetas)
- Separar la lógica de presentación de la estructura visual

#### Lógica de Negocio
- Extraer métodos complejos en clases de ayuda
- Implementar servicios específicos para responsabilidades concretas
- Utilizar patrones como Strategy o Factory para operaciones variables

#### Gestión de Estado
- Dividir estados complejos en sub-estados más pequeños
- Crear Cubits/BLoCs específicos para dominios de estado independientes
- Utilizar eventos granulares y estados bien definidos

## 4. Ubicación del Código: Dónde Colocar Qué

### 4.1 Reglas de Ubicación
- **Todo componente debe tener un lugar predefinido**
- La ubicación se determina por función, no por conveniencia
- Seguir estrictamente la estructura de carpetas establecida

### 4.2 Mapa de Decisiones
| Si estás creando... | Colocarlo en... |
|---------------------|----------------|
| Widget reutilizable en toda la app | `/lib/core/widgets/` |
| Widget específico de feature | `/lib/features/{feature}/presentation/widgets/` |
| Clase de utilidad general | `/lib/core/utils/` |
| Utilidad específica de feature | `/lib/features/{feature}/domain/utils/` |
| Nuevo modelo de datos | `/lib/features/{feature}/domain/entities/` |
| Implementación de repositorio | `/lib/features/{feature}/data/repositories/` |

### 4.3 Proceso de Evaluación
Antes de crear un nuevo archivo, pregúntate:
1. ¿Existe ya algo que haga esto o algo similar?
2. ¿Dónde debería ubicarse según la estructura del proyecto?
3. ¿Cómo puedo hacerlo lo suficientemente modular para que no crezca demasiado?

## 5. Proceso de Revisión de Modularización

### 5.1 Auto-revisión
Antes de marcar una tarea como completa, verifica:
- ¿Cada archivo cumple con el límite de tamaño?
- ¿He extraído componentes reutilizables?
- ¿He ubicado cada archivo en el lugar correcto?
- ¿Hay fragmentos de código que podría modularizar aún más?

### 5.2 Revisión entre Pares
Durante las revisiones de código, los revisores deben específicamente comprobar:
- Adherencia a las reglas de modularización
- Identificación de posibles componentes duplicados
- Correcta ubicación de archivos
- Oportunidades adicionales de modularización

## 6. Ejemplos de Buena Modularización

### Ejemplo 1: Formulario de Registro
```dart
// register_page.dart - Composición principal
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlamScaffold(
      body: Column(
        children: [
          RegisterHeader(),  // Widget extraído
          RegisterStepIndicator(currentStep: 2),  // Widget extraído
          Expanded(child: RegisterForm()),  // Widget extraído
          RegisterFooter(),  // Widget extraído
        ],
      ),
    );
  }
}

// register_form.dart - Componente extraído
class RegisterForm extends StatelessWidget {
  // Implementación del formulario (80-120 líneas)
}
```

### Ejemplo 2: Tarjeta de Servicio
```dart
// service_card.dart - Componente base
class ServiceCard extends StatelessWidget {
  final ServiceEntity service;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ServiceImageHeader(imageUrl: service.imageUrl),  // Widget extraído
          ServiceCardContent(service: service),  // Widget extraído
          ServiceCardActions(service: service),  // Widget extraído
        ],
      ),
    );
  }
}

// service_card_content.dart - Subcomponente extraído
class ServiceCardContent extends StatelessWidget {
  // Implementación del contenido (40-60 líneas)
}
```

---

*La adherencia estricta a estas guías de modularización es fundamental para el éxito del proyecto y debe ser seguida por todos los miembros del equipo.*
