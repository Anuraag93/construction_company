import 'dart:io';

import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  final VoidCallback? onDelete;
  final File image;
  const ImageThumbnail({super.key, this.onDelete, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            color: Theme.of(context).disabledColor,
            height: 60,
            width: 60,
            child: Image.file(image, fit: BoxFit.cover),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
                onTap: onDelete,
                child: const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.close, color: Colors.white, size: 15),
                )),
          ),
        ],
      ),
    );
  }
}
