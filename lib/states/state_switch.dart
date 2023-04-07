import 'package:esphome_connect/esphome_connect.dart';
import 'package:flutter/material.dart';

extension SwitchStateWidget on SwitchState {
  Widget asListTile() {
    return ListTile(
      title: Text(name),
      subtitle: Text(id),
      trailing: Switch(
        value: value,
        onChanged: (value) {},
      ),
    );
  }
}
