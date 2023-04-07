import 'package:esphome_connect/esphome_connect.dart';
import 'package:flutter/material.dart';

extension ButtonStateWidget on ButtonState {
  Widget asListTile() {
    return ListTile(
      title: Text(name),
      subtitle: Text(id),
      trailing: MaterialButton(
        child: const Text('Press'),
        onPressed: () {},
      ),
    );
  }
}
