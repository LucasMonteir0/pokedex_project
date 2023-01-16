import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  )
                ]),
          ),
        ),
        IconButton(
            iconSize: 16,
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ]),
    );
  }
}
