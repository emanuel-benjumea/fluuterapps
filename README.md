# 🚀 Taller Flutter: Navegación, Widgets y Ciclo de Vida

## 📱 Descripción

Esta aplicación Flutter fue desarrollada como parte del **taller de navegación, widgets personalizados y ciclo de vida** en Flutter.

El proyecto implementa:

- ✅ Navegación entre pantallas con paso de parámetros usando `go_router`.
- ✅ Widgets personalizados: `GridView`, `TabBar`, y un widget con ciclo de vida (`StatefulWidget`).
- ✅ Evidencia del ciclo de vida de un `StatefulWidget` a través de impresiones en consola (`print()`).
- ✅ Diseño limpio y modular usando una estructura de carpetas organizada.


---

## 🧭 Navegación y paso de parámetros

- Se usa la librería `go_router` para gestionar las rutas.
- Desde `HomeScreen`, se navega a `DetailScreen` con un mensaje como parámetro.
- `DetailScreen` muestra el parámetro recibido en pantalla.
- Se utiliza `context.push(...)` para mantener el historial de navegación y permitir regresar con la flecha en el AppBar.

---

## 🧱 Widgets personalizados

### 1. **GridWidget (GridView)**
- Muestra una lista de elementos en forma de cuadrícula.
- Implementado con `GridView.builder()`.

### 2. **TabWidget (TabBar + TabBarView)**
- Incluye 3 pestañas:
  - GridView
  - Información textual
  - Contenido adicional

### 3. **LifecycleWidget (StatefulWidget)**
- Contador interactivo con botón.
- Imprime en consola:
  - `initState()`
  - `didChangeDependencies()`
  - `build()`
  - `setState()`
  - `dispose()`

---

## 🔁 Ciclo de Vida del StatefulWidget

En `lifecycle_widget.dart`, se usa un `StatefulWidget` para imprimir en consola el ciclo de vida del widget:

```dart
print('[Lifecycle] initState: ...');
print('[Lifecycle] didChangeDependencies: ...');
print('[Lifecycle] build: ...');
print('[Lifecycle] setState: ...');
print('[Lifecycle] dispose: ...');

```
## ▶️ Ejecución rápida

```bash
flutter pub get
flutter run
```
