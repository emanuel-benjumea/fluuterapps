import 'package:flutter/material.dart';

class HeavyTaskView extends StatelessWidget {
  const HeavyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tareas Pesadas')),
      body: const Center(child: Text('Aquí van las tareas pesadas...')),
    );
  }
}
