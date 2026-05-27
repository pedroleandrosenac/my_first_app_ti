import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App do Pedro',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.red)),
      home: const MyHomePage(title: 'Minha aplicação em Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Você apertou essa quantidade de vezes no botão:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_counter != 0) ...[

            FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'resetar',
              child: const Icon(Icons.refresh),
            ),

            const SizedBox(width: 10),

            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'decremento',
              child: const Icon(Icons.remove),
            ),
          ],

          const SizedBox(width: 10),

          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'incremento',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
