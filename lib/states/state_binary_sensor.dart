import 'package:esphome_connect/esphome_connect.dart';
import 'package:flutter/material.dart';

extension BinarySensorStateWidget on BinarySensorState {
  Widget asListTile() {
    return ListTile(
      title: Text(name),
      subtitle: Text(id),
      trailing: Text(state.toString()),
    );
  }
}
