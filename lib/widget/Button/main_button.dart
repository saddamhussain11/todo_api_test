import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String? title;
  const MainButton({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      child: Center(child: Text(title ?? 'Button')),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButton();
  }
}
