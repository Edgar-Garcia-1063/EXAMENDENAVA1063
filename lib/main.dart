import 'package:flutter/material.dart';

// ✅ Corrección: imports locales
import 'edgar.dart';
import 'personaltask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantallas Timeline y Categorías',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const PaginaPrincipal(),
      routes: {
        '/timeline': (context) => const PersonalTasksScreen(),
        '/categories': (context) => const CategoriesScreen(),
      },
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/timeline'),
              child: const Text('Ir a Timeline'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/categories'),
              child: const Text('Ir a Categorías'),
            ),
          ],
        ),
      ),
    );
  }
}
