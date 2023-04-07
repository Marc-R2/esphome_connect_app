import 'package:esphome_connect/esphome_connect.dart';
import 'package:esphome_connect_app/states/state_binary_sensor.dart';
import 'package:esphome_connect_app/states/state_button.dart';
import 'package:esphome_connect_app/states/state_number.dart';
import 'package:esphome_connect_app/states/state_switch.dart';
import 'package:flutter/material.dart';

class ElementListTile extends StatelessWidget {
  const ElementListTile({super.key, required this.element});

  final EspHomeElement element;

  @override
  Widget build(BuildContext context) {
    switch (element.runtimeType) {
      case NumberState:
        return (element as NumberState).asListTile();
      case BinarySensorState:
        return (element as BinarySensorState).asListTile();
      case ButtonState:
        return (element as ButtonState).asListTile();
      case SwitchState:
        return (element as SwitchState).asListTile();
      default:
        return ListTile(
          title: Text(element.name),
          subtitle: Text(element.id),
          trailing: Tooltip(
            message: 'Cannot render Unknown state: ${element.runtimeType}',
            child: const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ),
        );
    }
  }
}
