import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const pageName = '/homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: SizedBox(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text('Start'),
        ),
      ),
    );
  }
}
