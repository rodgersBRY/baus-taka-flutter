import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  final TextEditingController controller;

  CustomKeyboard({super.key, required this.controller});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
          ],
        ),
        Row(
          children: [
            _buildButton(''),
            _buildButton('0'),
            _buildButton('⌫', onPressed: _backspace, color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed, Color? color}) {
    return Expanded(
      child: Container(
        height: 70,
        child: InkWell(
          onTap: onPressed ?? () => _input(text),
          splashColor: Colors.white,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 35,
                color: color ?? Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    final value = _controller.text + text;
    _controller.text = value;
  }

  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      _controller.text = value.substring(0, value.length - 1);
    }
  }
}
