import 'package:construction_company/ui/screens/new_diary/new_diary_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewDiaryScreen())),
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text(
            'Welcome to the Martin Pulgar Construction app where the ground staff can create a new diary and upload photos',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
