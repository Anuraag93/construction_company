import 'dart:io';

import 'package:construction_company/bloc/new_diary_cubit.dart';
import 'package:construction_company/bloc/new_diary_state.dart';
import 'package:construction_company/ui/screens/new_diary/new_diary_constants.dart';
import 'package:construction_company/ui/widgets/cta_button.dart';
import 'package:construction_company/ui/widgets/image_tumbnail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddPhotosToSite extends StatefulWidget {
  const AddPhotosToSite({super.key});

  @override
  State<AddPhotosToSite> createState() => _AddPhotosToSiteState();
}

class _AddPhotosToSiteState extends State<AddPhotosToSite> {
  List<File> _images = [];

  Future<void> getImages(NewDiaryCubit cubit) async {
    try {
      final pickedImages = await ImagePicker().pickMultiImage();
      List<File> files = pickedImages.map((e) => File(e.path)).toList();

      setState(() {
        _images.addAll(files);
        cubit.updateImages(_images);
      });
      return;
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewDiaryCubit, NewDiaryState>(builder: (context, state) {
      final newDiaryCubit = BlocProvider.of<NewDiaryCubit>(context);
      if (state is NewDiaryDataEntry) _images = state.images ?? [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _images
                  .map((file) => ImageThumbnail(
                        image: file,
                        onDelete: () {
                          setState(() {
                            _images.remove(file);
                            newDiaryCubit.updateImages(_images);
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CTAButton(
              text: NewDiaryConstants.addPhotoBtn,
              onPressed: () {
                getImages(newDiaryCubit);
              },
            ),
          )
        ],
      );
    });
  }
}
