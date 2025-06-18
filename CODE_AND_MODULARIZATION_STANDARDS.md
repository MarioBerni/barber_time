# 📏 Barber Time: Estándares de Código y Modularización

## Propósito
Este documento define las reglas específicas, convenciones de codificación, estándares técnicos y directrices de modularización para mantener la consistencia, calidad y organización del código en el proyecto Barber Time.

## PARTE I: ORGANIZACIÓN Y ESTRUCTURA

### 1. Estructura de Directorios

```
lib/
├── core/                 # Funcionalidad compartida en toda la app
│   ├── animations/       # Animaciones reusables
│   ├── di/               # Inyección de dependencias
│   ├── routes/           # Sistema de navegación
│   ├── theme/            # Definición de tema
│   ├── utils/            # Utilidades generales
│   └── widgets/          # Widgets reutilizables comunes
│
├── features/             # Módulos por funcionalidad
│   └── feature_name/     # Ej: auth, explore, appointments
│       ├── data/         # Capa de datos
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/       # Capa de dominio
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/ # Capa de presentación
│           ├── bloc/
│           ├── pages/
│           └── widgets/
│
└── main.dart            # Punto de entrada
```

### 2. Mapa de Decisiones: Dónde Colocar Cada Componente

| Si estás creando... | Colocarlo en... |
|---------------------|----------------|
| Widget reutilizable en toda la app | `/lib/core/widgets/` |
| Widget específico de feature | `/lib/features/{feature}/presentation/widgets/` |
| Clase de utilidad general | `/lib/core/utils/` |
| Utilidad específica de feature | `/lib/features/{feature}/domain/utils/` |
| Nuevo modelo de datos | `/lib/features/{feature}/domain/entities/` |
| Implementación de repositorio | `/lib/features/{feature}/data/repositories/` |
| Lógica de gestión de estado | `/lib/features/{feature}/presentation/bloc/` |
| BLoC/Cubit | `/lib/features/{feature}/presentation/bloc/` |

### 3. Protocolo de Reutilización de Componentes

#### 3.1 Verificación Previa a la Creación
Antes de crear un nuevo componente o estilo visual, sigue este protocolo:

1. **Verificación en Core:** Comprobar si ya existe un componente similar en `/lib/core/widgets/`
2. **Verificación en Features:** Revisar componentes similares en `/lib/features/` que podrían extraerse y generalizarse
3. **Consultar Documentación:** Revisar archivos en `/tasks/` para entender decisiones de diseño previas

#### 3.2 Principios de Coherencia Visual

- **Referencias a AppTheme:** Siempre usar referencias a colores y estilos definidos en `AppTheme`
- **Nunca hard-codear colores** o estilos que podrían cambiar
- **Documentar excepciones** cuando sea absolutamente necesario desviarse del tema global
- **Priorizar la extensión** de componentes existentes sobre la creación de nuevos

## PARTE II: PRINCIPIOS DE MODULARIZACIÓN

### 3. Principios Fundamentales

#### 3.1 Responsabilidad Única
- Cada archivo debe tener una única razón para cambiar
- Cada clase o componente debe cumplir una función específica
- **Prohibido:** Crear "archivos multipropósito" o "clases Dios"

#### 3.2 Límite Estricto de Tamaño
- **Regla Crítica:** Ningún archivo debe exceder las **200 líneas** de código
- Si un archivo se acerca a este límite, debe refactorizarse inmediatamente
- **IMPORTANTE:** Este límite es obligatorio y no negociable

#### 3.3 Detección Temprana
- Planificar la modularización **antes** de comenzar a codificar
- Identificar submódulos potenciales en la fase de diseño
- No esperar a que un archivo crezca para dividirlo

#### 3.4 Señales de Alerta para Refactorizar
- Un widget tiene más de 3 niveles de anidación
- Un método tiene más de 20 líneas
- Una clase contiene más de 5 métodos
- Un archivo importa más de 10 dependencias
- Un componente maneja múltiples responsabilidades

### 4. Estrategias de Modularización por Tipo

#### 4.1 Widgets de UI
```dart
// Ejemplo de modularización de widgets:
// main_page.dart - Composición principal
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),  // Componente extraído
      body: Column(
        children: [
          HeaderSection(),   // Componente extraído
          Expanded(child: ContentSection()),  // Componente extraído
          FooterSection(),   // Componente extraído
        ],
      ),
    );
  }
}
```

#### 4.2 Lógica de Negocio
- Extraer métodos complejos en clases de ayuda
- Implementar servicios específicos para responsabilidades concretas
- Separar validaciones, transformaciones y reglas de negocio

#### 4.3 Gestión de Estado
- Dividir estados complejos en sub-estados más pequeños
- Crear Cubits/BLoCs específicos para dominios de estado independientes
- Mantener la lógica de gestión de estado separada de la UI

## PARTE III: CONVENCIONES Y ESTÁNDARES

### 5. Convenciones de Nomenclatura

- **Archivos:** snake_case (`user_repository.dart`, `login_page.dart`)
- **Clases/Enums:** UpperCamelCase (`UserRepository`, `LoginState`)
- **Variables/Funciones:** lowerCamelCase (`userName`, `fetchUserData()`)
- **Constantes:** kConstantName (`kPrimaryColor`, `kDefaultPadding`)

### 6. Gestión de Estado (BLoC/Cubit)

- Usar el patrón BLoC/Cubit para toda la gestión de estado
- Cada feature debe tener su propio BLoC/Cubit
- Estados deben ser inmutables (usar `freezed`)
- Estructura típica:
  - `*_cubit.dart`: Lógica de gestión de estado
  - `*_state.dart`: Definiciones de estados posibles

```dart
// Ejemplo de estado con freezed
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(User user) = AuthAuthenticated;
  const factory AuthState.error(String message) = AuthError;
}
```

### 7. UI y Widgets

- Preferir `const` constructores cuando sea posible
- Extraer widgets reutilizables a archivos separados
- Utilizar el tema global (`Theme.of(context)`) en lugar de valores hardcodeados
- Organizar widgets en carpetas por feature
- Agrupar widgets pequeños relacionados en un mismo archivo si tiene sentido

### 8. Documentación de Código

- **Clases/Widgets Públicos:** Documentar con `///` (triple slash)
- **Métodos Complejos:** Explicar el propósito y parámetros
- **Lógica No Obvia:** Comentar con `//` explicando el razonamiento
- **TODOs:** Formato `// TODO(nombre): descripción`

```dart
/// Widget que muestra un indicador de fuerza de contraseña.
///
/// Recibe una [password] y muestra una barra de progreso con colores
/// que indican la fortaleza de la contraseña.
class PasswordStrengthIndicator extends StatelessWidget {
  // Implementación...
}
```

### 9. Manejo de Errores

- Usar try-catch para operaciones propensas a errores
- Reflejar errores en los estados de BLoC/Cubit
- Mostrar mensajes de error amigables al usuario
- Evitar errores silenciosos

### 10. Recursos y Assets

- Colocar imágenes en `/assets/images/`
- Colocar fuentes en `/assets/fonts/`
- Referenciar assets usando constantes

## PARTE IV: PREVENCIÓN DE DUPLICACIÓN

### 11. Reglas para Evitar Duplicación

- **Regla Obligatoria:** Buscar componentes similares antes de crear uno nuevo
- Mantener comunicación constante con el equipo sobre componentes creados
- Revisar periódicamente el código para identificar duplicaciones
- Aplicar rigurosamente el principio DRY (Don't Repeat Yourself)

### 12. Proceso de Verificación Pre-Desarrollo

Antes de crear un nuevo componente, pregúntate:
1. ¿Existe ya algo que cumpla esta función o una similar?
2. ¿Este componente podría ser útil en otros lugares de la aplicación?
3. ¿Dónde debería ubicarse según la estructura del proyecto?
4. ¿Cómo puedo hacerlo suficientemente modular para evitar crecimiento excesivo?

## PARTE V: REVISIÓN Y CUMPLIMIENTO

### 13. Lista de Verificación Pre-Commit

Antes de considerar una tarea completada, verificar:

- [ ] El código sigue la arquitectura limpia
- [ ] **Ningún archivo excede 200 líneas**
- [ ] El código está documentado apropiadamente
- [ ] La UI es consistente con el tema de la aplicación
- [ ] Los widgets complejos están adecuadamente modularizados
- [ ] No hay código duplicado
- [ ] Los archivos están ubicados en las carpetas correctas
- [ ] La funcionalidad trabaja correctamente con datos mock
- [ ] Se han considerado los diferentes estados (carga, error, vacío)

### 14. Proceso de Revisión entre Pares

Durante las revisiones de código, los revisores deben específicamente comprobar:
- Adherencia a las reglas de modularización
- Identificación de posibles componentes duplicados
- Correcta ubicación de archivos
- Oportunidades adicionales de modularización

### 15. Testing (Preparación para Fase 2)

- Estructurar código para facilitar testing
- Inyectar dependencias en lugar de instanciarlas directamente
- Usar interfaces para componentes que interactuarán con servicios externos

---

*La adherencia estricta a estos estándares y directrices de modularización es obligatoria para todos los miembros del equipo y fundamental para el éxito del proyecto.*
