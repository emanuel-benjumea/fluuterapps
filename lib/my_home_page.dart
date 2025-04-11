import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_view.dart';
import 'user_list_view.dart';
import 'establishment_list_view.dart';
import 'counter_view.dart';
import 'heavy_task_view.dart';
import 'student_list_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _logout(BuildContext context) async {
    await AuthService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserListView()),
              );
            },
            icon: const Icon(Icons.people),
            label: const Text('Gestión de Usuarios'),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EstablishmentListView()),
              );
            },
            icon: const Icon(Icons.store),
            label: const Text('Gestión de Establecimientos'),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterView()),
              );
            },
            icon: const Icon(Icons.exposure_plus_1),
            label: const Text('Contador'),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HeavyTaskView()),
              );
            },
            icon: const Icon(Icons.memory),
            label: const Text('Tareas Pesadas'),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StudentListView()),
              );
            },
            icon: const Icon(Icons.school),
            label: const Text('Listado de Estudiantes'),
          ),
        ],
      ),
    );
  }
}
