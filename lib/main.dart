import 'package:esphome_connect/esphome_connect.dart';
import 'package:esphome_connect_app/esp_element_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESPHome Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final esp = EspHomeController(
    url: 'http://192.168.178.93',
    username: 'admin',
    password: 'admin',
  );

  @override
  Widget build(BuildContext context) {
    final espStatesList = EspElementList(esp: esp);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ESPHome Connect'),
      ),
      body: StreamBuilder<EspHomeControllerState>(
        stream: esp.controllerState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as EspHomeControllerState;
            return AnimatedOpacity(
              opacity: data == EspHomeControllerState.connected ? 1 : 0.5,
              duration: const Duration(milliseconds: 512),
              curve: Curves.easeInOut,
              child: espStatesList,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
