import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  const LifecycleWidget({Key? key}) : super(key: key);

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('[Lifecycle] initState: Se ejecuta al iniciar el widget por primera vez. initState()');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[Lifecycle] didChangeDependencies: Se ejecuta después de initState y cuando cambian las dependencias del contexto. didChangeDependencies()');
  }

  @override
  Widget build(BuildContext context) {
    print('[Lifecycle] build: Se ejecuta cada vez que se construye el widget. build() ');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciclo de Vida'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contador: $counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                  print('[Lifecycle] setState: Se ejecuta cuando se actualiza el estado. setState()');
                });
              },
              child: const Text('Incrementar contador'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('[Lifecycle] dispose: Se ejecuta cuando el widget se elimina permanentemente. dispose()');
    super.dispose();
  }
}
