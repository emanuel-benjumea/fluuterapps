import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'listado_page.dart';
import 'detalle_page.dart';

void main() {
  runApp(const MyApp());
}

// Configuración de rutas
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ListadoPage(),
    ),
    GoRoute(
      path: '/detalle/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetallePage(id: id);
      },
    ),
  ],
);

// Widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Taller 3 - API The Meal DB',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}
