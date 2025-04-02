import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/home_page.dart';
import '../views/lista_estudiantes_page.dart';
import '../views/contador_page.dart';
import '../views/tarea_pesada_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/estudiantes',
      builder: (context, state) => const ListaEstudiantesPage(),
    ),
    GoRoute(
      path: '/contador',
      builder: (context, state) => const ContadorPage(),
    ),
    GoRoute(
      path: '/tarea-pesada',
      builder: (context, state) => const TareaPesadaPage(),
    ),
  ],
);
