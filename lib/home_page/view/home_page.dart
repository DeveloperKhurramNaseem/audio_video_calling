import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  @override
  void initState() {    
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Stream Id',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),                    
                  ),
                ),               
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },child: const Text('Start'),),
    );
  }
}
