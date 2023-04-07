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
  final esp = EspHomeController(
    url: 'http://192.168.178.200',
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
          final data = esp.staticState;

          return Stack(
            children: [
              AnimatedOpacity(
                opacity: data == EspHomeControllerState.connected ? 1 : 0.5,
                duration: const Duration(milliseconds: 512),
                curve: Curves.easeInOut,
                child: espStatesList,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 8),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 512),
                  curve: Curves.easeInOut,
                  height: data == EspHomeControllerState.connected ? 0 : 64,
                  child: Container(
                    height: 64,
                    color: Colors.amber,
                    child: Center(
                      child: Text(data.toString()),
                    )
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
