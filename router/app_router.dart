import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail/:message',
      name: 'detail',
      builder: (context, state) {
        final message = state.pathParameters['message'] ?? 'Sin mensaje';
        return DetailScreen(message: message);
      },
    ),
  ],
);
