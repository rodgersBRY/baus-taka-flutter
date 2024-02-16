import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgScreen extends StatelessWidget {
  const SvgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Svg Images"),
      ),
      body: Column(
        children: [
          Text("Image"),
          SvgPicture.asset("assets/icons/account.svg", color: Colors.red),
        ],
      ),
    );
  }
}
