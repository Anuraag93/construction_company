import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget> children;

  final EdgeInsets outterPadding;

  const InfoCard(
      {super.key,
      required this.children,
      this.title,
      this.titleWidget,
      this.outterPadding = const EdgeInsets.all(20.0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: outterPadding,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (titleWidget != null) titleWidget!,
            if (titleWidget == null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(title ?? "",
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            const Divider(),
            ...children,
          ]),
        ),
      ),
    );
  }
}
