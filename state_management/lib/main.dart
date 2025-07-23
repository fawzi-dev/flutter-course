import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
        ),
        body: Center(
          child: Consumer<Counter>(
            builder: (context, counter, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You pushed the button this many times:'),
                Text(
                  counter.stateCounter.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<Counter>().increase();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                context.read<Counter>().decrease();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomSwitch extends StatefulWidget {
  const MyCustomSwitch({super.key, required this.onChanged, required this.switchValue});

  final void Function(bool) onChanged;

  final bool switchValue;

  @override
  State<MyCustomSwitch> createState() => _MyCustomSwitchState();
}

class _MyCustomSwitchState extends State<MyCustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(value: widget.switchValue, onChanged: widget.onChanged);
  }
}
