import 'package:construction_company/ui/screens/new_diary/new_diary_constants.dart';
import 'package:flutter/material.dart';

class DiaryTitle extends StatelessWidget {
  const DiaryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(NewDiaryConstants.title,
            style: Theme.of(context).textTheme.titleLarge),
        const Tooltip(
          message: NewDiaryConstants.helperMessage,
          triggerMode: TooltipTriggerMode.tap,
          child: Icon(
            Icons.help,
            color: Color(0xFF9a9a9a),
          ),
        )
      ],
    );
  }
}
