import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key,
    required this.title,
    this.color = const Color(0xff303136),
    required this.onPress
  });

  final String title ;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color
          ),
          child: Center(child: Text(title , style: const TextStyle(color: Color(0xff29A8FF) , fontSize: 20),)),
        ),
      ),
    );
  }
}
