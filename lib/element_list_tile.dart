import 'package:esphome_connect/esphome_connect.dart';
import 'package:flutter/material.dart';

class ElementListTile extends StatelessWidget {
  const ElementListTile({super.key, required this.element});

  final EspHomeElement element;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(element.name),
      subtitle: Text(element.id),
    );
  }
}
