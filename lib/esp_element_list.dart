
import 'package:esphome_connect/esphome_connect.dart';
import 'package:esphome_connect_app/element_list_tile.dart';
import 'package:flutter/material.dart';

class EspElementList extends StatelessWidget {
  const EspElementList({
    super.key,
    required this.esp,
  });

  final EspHomeController esp;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: esp.valueStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final states = esp.elements;

          return ListView.builder(
            itemCount: states.length,
            itemBuilder: (context, index) =>
                ElementListTile(element: states[index]),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
