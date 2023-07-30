import 'package:construction_company/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ItemContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.groundColor
              .platformBrightnessColor(context)!
              .withOpacity(0.6),
          width: 1,
        )),
      ),
      child: child,
    );
  }
}
