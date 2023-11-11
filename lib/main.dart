import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
import 'flash_light_page.dart';

void main() {
  TorchController().initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashlight App',
      home: FlashLightPage(),
    );
  }
}
