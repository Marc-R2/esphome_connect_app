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
        final states = esp.elements;

        if (states.isEmpty) {
          return const Center (
            child: Text('No states available'),
          );
        }

        return ListView.builder(
          itemCount: states.length,
          itemBuilder: (context, index) =>
              ElementListTile(element: states[index]),
        );
      },
    );
  }
}
