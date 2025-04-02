import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taller 2 - Flutter')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () => context.push('/estudiantes'),
            child: const Text('Lista de Estudiantes (Future)'),
          ),
          ElevatedButton(
            onPressed: () => context.push('/contador'),
            child: const Text('Contador (Timer)'),
          ),
          ElevatedButton(
            onPressed: () => context.push('/tarea-pesada'),
            child: const Text('Tarea Pesada (Isolate)'),
          ),
        ],
      ),
    );
  }
}
