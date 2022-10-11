import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String data;
  const Header(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: Theme.of(context).textTheme.displaySmall?.fontSize),
    );
  }
}
