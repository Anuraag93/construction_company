import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CTAButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    // return TextButton(onPressed: onPressed, child: Text(text));
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Theme.of(context).colorScheme.secondary),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(text),
        ),
      ),
    );
  }
}
