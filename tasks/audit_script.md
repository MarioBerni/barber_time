# 🔍 Script de Auditoría del Sistema Unificado

## Comandos para Ejecutar la Auditoría

### 1. Auditoría de Contenedores
```bash
# Buscar Container con BoxDecoration
grep -r "Container(decoration: BoxDecoration" lib/ --include="*.dart"

# Buscar Container con decoration
grep -r "decoration:" lib/ --include="*.dart" | grep -v "AppContainers"
```

### 2. Auditoría de Espaciado
```bash
# Buscar SizedBox hardcodeados
grep -r "const SizedBox(" lib/ --include="*.dart"

# Buscar Padding hardcodeados
grep -r "const Padding(" lib/ --include="*.dart"
```

### 3. Auditoría de Estilos de Texto
```bash
# Buscar TextStyle hardcodeados
grep -r "TextStyle(" lib/ --include="*.dart"

# Buscar fontFamily hardcodeados
grep -r "fontFamily:" lib/ --include="*.dart"
```

### 4. Auditoría de Colores
```bash
# Buscar colores hex hardcodeados
grep -r "Color(0x" lib/ --include="*.dart"

# Buscar Colors. hardcodeados
grep -r "Colors\." lib/ --include="*.dart"
```

### 5. Auditoría de Bordes
```bash
# Buscar BorderRadius hardcodeados
grep -r "BorderRadius.circular(" lib/ --include="*.dart"

# Buscar Border hardcodeados
grep -r "Border(" lib/ --include="*.dart"
```

### 6. Auditoría de Sombras
```bash
# Buscar BoxShadow hardcodeados
grep -r "BoxShadow(" lib/ --include="*.dart"
```

## Archivos Prioritarios para Revisar

### Features
- `lib/features/home/presentation/widgets/`
- `lib/features/profile/presentation/widgets/`
- `lib/features/auth/presentation/widgets/`

### Core Widgets
- `lib/core/widgets/buttons/`
- `lib/core/widgets/inputs/`
- `lib/core/widgets/navigation/`
- `lib/core/widgets/states/`

## Checklist de Refactorización

### Para Cada Archivo Encontrado:
- [ ] Identificar el patrón de uso
- [ ] Determinar el componente unificado apropiado
- [ ] Refactorizar manteniendo la funcionalidad
- [ ] Verificar que no se rompa la UI
- [ ] Actualizar imports si es necesario
- [ ] Documentar cambios en LINTING_CHANGES.md

## Métricas de Progreso

### Antes de la Auditoría:
- Archivos con estilos hardcodeados: [CONTAR]
- Líneas de código duplicado: [CONTAR]

### Después de la Auditoría:
- Archivos usando sistema unificado: [CONTAR]
- Reducción de código duplicado: [CALCULAR %]
- Consistencia visual: 100%
