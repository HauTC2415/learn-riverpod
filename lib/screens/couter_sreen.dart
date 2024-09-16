import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CouterScreen extends ConsumerStatefulWidget {
  const CouterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CouterScreenState();
}

final counterProvider = StateProvider<int>((ref) => 0);

class _CouterScreenState extends ConsumerState<CouterScreen> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: $count',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state--;
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
