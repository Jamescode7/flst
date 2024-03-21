import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  final VoidCallback onPress;
  final bool isActive;
  final String text;
  const FlatButton({
    Key? key,
    required this.onPress,
    required this.isActive,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.grey : Colors.blue,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: isActive ? onPress : null,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
