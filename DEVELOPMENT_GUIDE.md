# 🚀 Barber Time: Guía de Desarrollo

## Propósito
Este documento establece la metodología, estándares y flujo de trabajo para el desarrollo de Barber Time, asegurando consistencia y calidad en todo el proyecto.

## 1. Principios Fundamentales

- **Arquitectura Limpia:** Separación estricta entre Presentación, Dominio y Datos
- **Estructura Modular:** Organización por características (feature-first)
- **Limitación de Tamaño:** Archivos no deben exceder las **200 líneas**
- **Documentación Continua:** Crear y actualizar documentación durante el desarrollo
- **Inmutabilidad:** Preferir objetos inmutables, especialmente para modelos y estados
- **Testabilidad:** Diseñar el código para facilitar pruebas unitarias y de widgets

## 2. Flujo de Trabajo

### 2.1 Antes de Iniciar una Nueva Tarea
1. Revisar los documentos guía (PROJECT_OVERVIEW.md, DEVELOPMENT_GUIDE.md, CODE_STANDARDS.md)
2. Crear un archivo `TASK_nombre_tarea.md` en la carpeta `/tasks/` describiendo objetivos y pasos
3. Planificar la implementación respetando la arquitectura limpia y principios del proyecto

### 2.2 Durante el Desarrollo
1. Implementar siguiendo el enfoque de arquitectura limpia
   - **Primero el Dominio:** Entidades, repositorios (interfaces), casos de uso
   - **Luego la Presentación:** UI, BLoCs/Cubits, controladores
   - **Datos (Mock):** Implementaciones temporales para testing
2. Dividir archivos que se aproximen a 200 líneas
3. Documentar código con comentarios explicativos

### 2.3 Al Finalizar
1. Actualizar el archivo TASK correspondiente
2. Verificar que el código siga los estándares establecidos
3. Comprobar funcionalidad en diferentes tamaños de pantalla

## 3. Desarrollo Frontend (Fase Actual)

### 3.1 Enfoque Actual
En esta fase nos enfocamos exclusivamente en el frontend de la aplicación:
- Construir interfaces de usuario completas y funcionales
- Implementar la navegación entre pantallas
- Utilizar datos mock para simular respuestas del backend
- Establecer la gestión del estado con BLoC/Cubit

### 3.2 Datos Temporales (Mock)
- Crear modelos de datos realistas para desarrollo
- Implementar clases `MockDataSource` para simular APIs
- Utilizar datos estáticos pero representativos
- Considerar diferentes escenarios (carga, error, vacío)

## 4. Diseño Visual

### 4.1 Tema Principal
- **Concepto:** Minimalista, elegante, enfoque estético masculino
- **Tema:** Dark Theme predominante
- **Paleta Principal:**
  - **Azules:** #00296B (kPrimaryColor), #001B4D (kBackgroundColor)
  - **Dorados:** #FDC500 (kAccentColor)
  - **Texto:** #FFFFFF (kTextColor), #B0BAC5 (kSecondaryTextColor)

### 4.2 Componentes UI
- Utilizar componentes predefinidos en `/lib/core/widgets/`
- Seguir patrones establecidos para transiciones y animaciones
- Mantener consistencia visual en toda la aplicación

## 5. Recomendaciones para la Colaboración

- **Comunicación:** Documentar decisiones importantes en los archivos TASK
- **Reutilización:** Buscar componentes existentes antes de crear nuevos
- **Consistencia:** Seguir los patrones ya establecidos en el código base
- **Modularidad:** Favorecer componentes pequeños y enfocados sobre widgets monolíticos
- **Solicitar Feedback:** Pedir revisión de código cuando sea necesario

## 6. Recursos Útiles

- [Flutter Docs](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Best Practices](https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5)

---

*Este documento es una guía viva y puede actualizarse a medida que evoluciona el proyecto.*
