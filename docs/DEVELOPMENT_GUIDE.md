# 🛠️ Barber Time: Manual de Desarrollo

Esta guía es el manual de operaciones para cualquier desarrollador que trabaje en el proyecto Barber Time. Contiene las reglas, flujos de trabajo y estándares que garantizan un desarrollo eficiente y un código de alta calidad.

---

## 1. Filosofía de Desarrollo

Nuestro enfoque se basa en tres pilares:

1.  **Claridad sobre Astucia:** Escribe código que sea fácil de entender, no que demuestre tu habilidad para crear construcciones complejas.
2.  **Prevención sobre Corrección:** Sigue las guías para evitar problemas comunes como la duplicación de código y las inconsistencias de diseño.
3.  **Colaboración Eficiente:** La estructura y la documentación están diseñadas para que cualquier persona (humano o IA) pueda integrarse al proyecto rápidamente.

---

## 2. Flujo de Trabajo y Metodología

### 2.1 La Regla Más Importante: Revisa Antes de Crear
**Antes de escribir una sola línea de código para una nueva funcionalidad, componente o lógica, DEBES revisar el código existente.**

El objetivo es prevenir la duplicación. Pregúntate:
- ¿Ya existe un widget que hace algo similar en `lib/core/widgets/` o en la feature actual?
- ¿Ya hay una función de utilidad o un caso de uso que pueda reutilizar?
- ¿Este nuevo estilo que necesito ya está definido en el `AppTheme`?

La duplicación de código es la forma más rápida de introducir inconsistencias y dificultar el mantenimiento.

### 2.2 Proceso de Desarrollo de Tareas
1.  **Planificación:** Antes de empezar, crea un archivo `TASK_nombre_tarea.md` en la carpeta `/tasks/` describiendo los objetivos y los pasos de implementación.
2.  **Desarrollo:** Implementa la funcionalidad siguiendo estrictamente los documentos de `ARCHITECTURE.md` y `DESIGN_SYSTEM.md`.
3.  **Modularización Proactiva:** Recuerda la regla de las 200 líneas. Divide tus archivos antes de que se vuelvan demasiado grandes.
4.  **Verificación Pre-Commit:** Antes de considerar una tarea terminada, repasa la lista de verificación.

### 2.3 Lista de Verificación Pre-Commit
- [ ] **No hay código duplicado.** He revisado el proyecto en busca de funcionalidades existentes.
- [ ] El código sigue la **Arquitectura Limpia**.
- [ ] **Ningún archivo `.dart` excede las 200 líneas.**
- [ ] La UI es 100% consistente con el **Sistema de Diseño** (no hay estilos hardcodeados).
- [ ] Los archivos nuevos están ubicados en las carpetas correctas.
- [ ] El código nuevo o complejo está documentado.
- [ ] Se han considerado los diferentes estados de la UI (carga, error, éxito, vacío).

### 2.4 Enfoque Actual del Proyecto
- **Frontend Primero:** La fase actual se centra exclusivamente en el desarrollo de la interfaz de usuario con datos *mock*.
- **Backend y Pruebas Fuera de Alcance:** La integración con backend (Firebase) y la escritura de pruebas automatizadas (unitarias, widgets) se realizarán en fases futuras y no son parte del trabajo actual.

---

## 3. Estándares de Código y Nomenclatura

### 3.1 Convenciones de Nomenclatura
- **Archivos:** `snake_case.dart` (ej: `user_repository.dart`, `login_page.dart`)
- **Clases/Enums/Typedefs:** `UpperCamelCase` (ej: `UserRepository`, `LoginState`)
- **Variables/Funciones/Parámetros:** `lowerCamelCase` (ej: `userName`, `fetchUserData()`)
- **Constantes Globales:** `kLowerCamelCase` (ej: `kDefaultPadding`)

### 3.2 Gestión de Estado (BLoC/Cubit)
- Usar el patrón BLoC/Cubit para toda la gestión de estado.
- Los estados deben ser **inmutables**, usando `freezed` para su definición.
- **Estructura:**
  - `auth_cubit.dart`: Contiene la clase `AuthCubit` con la lógica.
  - `auth_state.dart`: Contiene la definición del estado `AuthState` con `freezed`.

### 3.3 Documentación de Código
- **Clases y funciones públicas:** Documentar con `///` (triple slash) explicando el propósito.
- **Lógica compleja o no obvia:** Usar comentarios `//` para explicar el *porqué* de una implementación.
- **TODOs:** Usar el formato `// TODO(tu_nombre): Descripción de la tarea pendiente.`

---

## 4. Comandos Esenciales

```bash
# Obtener/actualizar dependencias
flutter pub get

# Analizar el código en busca de errores y advertencias
flutter analyze

# Formatear todo el código del proyecto
dart format .

# Regenerar archivos generados por build_runner (freezed, etc.)
flutter pub run build_runner build --delete-conflicting-outputs

# Ejecutar la aplicación
flutter run
```

---

## 5. Optimización de UI y Rendimiento

### 5.1 Mejores Prácticas de Optimización

#### Carga Eficiente de Listas
- **Lazy Loading con Slivers:** Utilizar `CustomScrollView` con componentes `Sliver` en lugar de combinaciones de `SingleChildScrollView` y `Column` para mejorar el rendimiento.
- **Construcción Bajo Demanda:** Implementar `SliverList` con `SliverChildBuilderDelegate` para construir elementos solo cuando sean visibles.

```dart
// Enfoque NO optimizado
SingleChildScrollView(
  child: Column(
    children: salones.map((salon) => SalonCard(salon: salon)).toList(),
  ),
)

// Enfoque optimizado con lazy loading
CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => SalonCard(salon: salones[index]),
        childCount: salones.length,
      ),
    ),
  ],
)
```

#### Optimización de Imágenes
- **Uso Obligatorio de Caching:** Utilizar `cached_network_image` para todas las imágenes de red.
- **Placeholders y Errores:** Configurar siempre placeholders y widgets de error para mejorar la experiencia de usuario.

```dart
// Implementación Correcta
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
  errorWidget: (context, url, error) => Icon(Icons.error),
)
```

#### APIs Deprecadas y Actualizaciones
- Reemplazar `withOpacity` por `withAlpha` para evitar pérdida de precisión: 
  ```dart
  // Incorrecto
  color: Colors.black.withOpacity(0.5)
  
  // Correcto
  color: Colors.black.withAlpha((0.5 * 255).round())
  ```

- Usar `WidgetStateProperty` en lugar de `MaterialStateProperty` (APIs actualizadas):
  ```dart
  // Deprecado
  overlayColor: MaterialStateProperty.resolveWith((states) => color)
  
  // Actual
  overlayColor: WidgetStateProperty.resolveWith((states) => color)
  ```

### 5.2 Análisis de Código (Linter)

El proyecto utiliza un linter estricto para garantizar la calidad y consistencia del código. **Es obligatorio que todo el código pase el análisis sin errores antes de cualquier commit.**

**Verificación obligatoria:**
```bash
# Este comando NO debe mostrar errores ni advertencias
flutter analyze
```

**Configuración del Editor:**
- **VS Code:** Instala las extensiones "Flutter" y "Dart". Habilita el formateo automático al guardar.
- **Android Studio:** El soporte para Dart/Flutter ya incluye formateo automático.

**Lo que el linter vigila:**
- Cumplimiento de la regla de 200 líneas por archivo
- Nomenclatura correcta (snake_case, lowerCamelCase, etc.)
- Imports organizados y sin duplicados
- Detección de código muerto o sin usar

### 5.2 Gestión de Secretos y Variables de Entorno

**Regla de oro:** Nunca subir secretos (API keys, tokens, contraseñas) al repositorio Git.

**Proceso estándar:**
1. **Archivo `.env.example`**: Contiene una plantilla de las variables de entorno necesarias
2. **Archivo `.env`**: Contiene los valores reales (incluido en `.gitignore`)
3. **Configuración local**: Cada desarrollador debe copiar `.env.example` a `.env` y rellenar los valores

**Ejemplo de uso:**
```bash
# .env.example (se sube a Git)
GOOGLE_MAPS_API_KEY=tu_clave_aqui
FIREBASE_API_KEY=tu_clave_aqui

# .env (NO se sube a Git)
GOOGLE_MAPS_API_KEY=AIzaSyBOTi...
FIREBASE_API_KEY=pk_test_51M...
```

### 5.3 Estrategia de Ramas (Git Flow)

**Estructura de ramas:**
- `main`: Rama principal. Siempre estable y funcional.
- `develop`: Rama de integración. Las features se unen aquí antes de ir a main.
- `feature/nombre-tarea`: Cada tarea se desarrolla en su propia rama.

**Flujo de trabajo:**
1. **Crear rama feature:** `git checkout -b feature/componente-botones`
2. **Desarrollar la funcionalidad** siguiendo las guías de este documento
3. **Commit frecuentes** con mensajes descriptivos
4. **Push de la rama:** `git push origin feature/componente-botones`
5. **Pull Request:** Solicitar revisión para mergear a `develop`
6. **Merge:** Solo después de revisión y aprobación

**Nomenclatura de ramas:**
- `feature/nombre-descriptivo`: Para nuevas funcionalidades
- `fix/descripcion-bug`: Para corrección de errores
- `docs/actualizacion-guias`: Para cambios en documentación

**Reglas de commit:**
- Mensajes en español, descriptivos y concisos
- Formato: `tipo: descripción breve`
- Ejemplos: `feat: añadir botón de login`, `fix: corregir navegación en home`

---

## 6. Gestión de Activos (Assets)

Para mantener el proyecto organizado, todos los activos estáticos como imágenes, iconos y fuentes deben gestionarse de manera centralizada.

### 5.1 Estructura de Carpetas
1.  Crea una carpeta `assets/` en la raíz del proyecto.
2.  Dentro de `assets/`, crea subcarpetas específicas por tipo de activo:
    *   `assets/images/`: Para imágenes de mapa de bits (`.png`, `.jpg`).
    *   `assets/icons/`: Para iconos vectoriales (`.svg`).
    *   `assets/fonts/`: Para archivos de fuentes personalizadas.

### 5.2 Nomenclatura
- Usa `snake_case` para los nombres de archivo (ej: `profile_avatar_placeholder.png`).
- Los nombres deben ser descriptivos de su contenido.

### 5.3 Registro en `pubspec.yaml`
- Todos los activos deben ser declarados en el archivo `pubspec.yaml` para que Flutter los reconozca. Asegúrate de registrar los directorios.
