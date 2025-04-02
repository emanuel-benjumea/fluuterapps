import 'dart:isolate';
import 'dart:async';
import 'dart:io'; // Para sleep
import 'package:flutter/material.dart';

class TareaPesadaPage extends StatefulWidget {
  const TareaPesadaPage({super.key});

  @override
  State<TareaPesadaPage> createState() => _TareaPesadaPageState();
}

class _TareaPesadaPageState extends State<TareaPesadaPage> {
  bool _procesando = false;

  // Función que se ejecuta en el isolate
  static void _tareaPesada(SendPort sendPort) {
    int suma = 0;
    for (int i = 1; i <= 1000000; i++) {
      suma += i;
      if (i % 100000 == 0) {
        sleep(const Duration(milliseconds: 100)); // Simula lentitud
      }
    }
    sendPort.send(suma);
  }

  Future<void> _iniciarIsolate() async {
    setState(() => _procesando = true);

    final receivePort = ReceivePort();
    await Isolate.spawn(_tareaPesada, receivePort.sendPort);

    final resultado = await receivePort.first;

    if (!mounted) return;

    setState(() => _procesando = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('El resultado esperado de sumar los números del 1 al 1,000,000 es: $resultado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarea Pesada con Isolate')),
      body: Center(
        child: _procesando
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Procesando...'),
                ],
              )
            : ElevatedButton(
                onPressed: _iniciarIsolate,
                child: const Text('Iniciar tarea pesada'),
              ),
      ),
    );
  }
}
