import 'package:flutter/material.dart';
// Import the Edgar.dart file
import 'package:examennava1063y1069/Edgar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantallas de la App', // More general title
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // Set EdgarPage as the home.
      home: const MyApp(), // Use the correct class name from Edgar.dart
      routes: {
        //  Define the route.  Important:  The route for EdgarPage is '/Edgar'
        '/Edgar': (context) => const MyApp(),
      },
    );
  }
}

//  The main page.  This is now separate from the first page.
class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add some padding for better UI
          child: ElevatedButton(
            // Navigate to the '/Edgar' route when the button is pressed.
            onPressed: () {
              Navigator.pushNamed(context, '/Edgar');
            },
            child: const Text('Ir a Edgar Page'), // Clearer button text
          ),
        ),
      ),
    );
  }
}
