import 'package:construction_company/bloc/new_diary_cubit.dart';
import 'package:construction_company/bloc/new_diary_state.dart';
import 'package:construction_company/models/new_diary_model.dart';
import 'package:construction_company/themes/app_colors.dart';
import 'package:construction_company/ui/screens/new_diary/new_diary_constants.dart';
import 'package:construction_company/ui/features/add_photos_to_site.dart';
import 'package:construction_company/ui/widgets/cta_button.dart';
import 'package:construction_company/ui/widgets/diary_title.dart';
import 'package:construction_company/ui/widgets/info_card.dart';
import 'package:construction_company/ui/widgets/item_container.dart';
import 'package:construction_company/ui/widgets/location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewDiaryScreen extends StatefulWidget {
  const NewDiaryScreen({super.key});

  @override
  State<NewDiaryScreen> createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {
  bool _includeInPhotoGallery = true;
  bool _linkToExistingEvent = true;

  String _selectedEvent = '';
  String _selectedArea = '';
  String _selectedTaskCategory = '';
  DateTime _selectedDate = DateTime.now();

  final _commentsTextController = TextEditingController();
  final _tagsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: const Text(NewDiaryConstants.appBarTitle,
            style: TextStyle(fontSize: 26.0)),
      ),
      body:
          BlocBuilder<NewDiaryCubit, NewDiaryState>(builder: (context, state) {
        final newDiaryCubit = BlocProvider.of<NewDiaryCubit>(context);
        if (state is NewDiarySuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          _valuesReset();
          newDiaryCubit.reset();
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              LocationCard(locationUpdate: (location) {
                newDiaryCubit.updateLocation(location);
              }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: DiaryTitle(),
                    ),
                    InfoCard(
                        outterPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        title: NewDiaryConstants.addPhotos,
                        children: [
                          const AddPhotosToSite(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(NewDiaryConstants.includeInGallery,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                              Checkbox(
                                  value: _includeInPhotoGallery,
                                  onChanged: (value) => {
                                        setState(() {
                                          _includeInPhotoGallery = value!;
                                        })
                                      }),
                            ],
                          ),
                        ]),
                    InfoCard(title: NewDiaryConstants.comments, children: [
                      ItemContainer(
                        child: TextField(
                            controller: _commentsTextController,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              hintText: 'Comments',
                              border: InputBorder.none,
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                            )),
                      ),
                    ]),
                    InfoCard(
                        title: NewDiaryConstants.details,
                        children: _detailsChildren()),
                    InfoCard(
                      outterPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      titleWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(NewDiaryConstants.linkToExistingEvent,
                              style: Theme.of(context).textTheme.titleSmall),
                          Checkbox(
                              value: _linkToExistingEvent,
                              onChanged: (value) => {
                                    setState(() {
                                      _linkToExistingEvent = value!;
                                    })
                                  }),
                        ],
                      ),
                      children: _linkToEventChildren(),
                    ),
                    CTAButton(
                        text: NewDiaryConstants.next,
                        onPressed: () {
                          final entry = state as NewDiaryDataEntry;

                          final data = NewDiaryModel(
                              location: entry.location,
                              includeInGallery: _includeInPhotoGallery,
                              comments: _commentsTextController.text,
                              date: _selectedDate,
                              area: _selectedArea,
                              taskCategory: _selectedTaskCategory,
                              tags: _tagsTextController.text,
                              linkToExistingEvent: _linkToExistingEvent,
                              event: _selectedEvent);
                          newDiaryCubit.uploadData(data);
                        }),
                  ],
                ),
                // child: NewDiaryForm(),
              ),
            ],
          ),
        );
      }),
    );
  }

  List<Widget> _detailsChildren() => [
        ItemContainer(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: GestureDetector(
              onTap: () async {
                final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101));
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    DateFormat('yyyy-MM-dd').format(_selectedDate),
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color:
                        AppColors.groundColor.platformBrightnessColor(context),
                  )
                ],
              ),
            )),
        ItemContainer(
          padding: const EdgeInsets.only(top: 5),
          child: DropdownButton(
            onChanged: (value) {
              setState(() {
                _selectedArea = value ?? '';
              });
            },
            value: _selectedArea,
            style: Theme.of(context).textTheme.bodySmall,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.groundColor
                  .platformBrightnessColor(context)
                  ?.withOpacity(0.6),
            ),
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(value: '', child: Text('Select Area')),
              DropdownMenuItem(value: 'Area 1', child: Text('Area 1')),
              DropdownMenuItem(value: 'Area 2', child: Text('Area 2')),
              DropdownMenuItem(value: 'Area 3', child: Text('Area 3')),
            ],
          ),
        ),
        ItemContainer(
          padding: const EdgeInsets.only(top: 5),
          child: DropdownButton(
            onChanged: (value) {
              setState(() {
                _selectedTaskCategory = value ?? '';
              });
            },
            value: _selectedTaskCategory,
            style: Theme.of(context).textTheme.bodySmall,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.groundColor
                  .platformBrightnessColor(context)
                  ?.withOpacity(0.6),
            ),
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(value: '', child: Text('Task Category')),
              DropdownMenuItem(
                  value: 'Task Category 1', child: Text('Task Category 1')),
              DropdownMenuItem(
                  value: 'Task Category 2', child: Text('Task Category 2')),
              DropdownMenuItem(
                  value: 'Task Category 3', child: Text('Task Category 3')),
            ],
          ),
        ),
        ItemContainer(
          child: TextField(
              controller: _tagsTextController,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                hintText: 'Tags',
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodySmall,
              )),
        ),
      ];
  List<Widget> _linkToEventChildren() => [
        ItemContainer(
          child: DropdownButton(
            onChanged: (value) {
              setState(() {
                _selectedEvent = value ?? '';
              });
            },
            value: _selectedEvent,
            style: Theme.of(context).textTheme.bodySmall,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.groundColor
                  .platformBrightnessColor(context)
                  ?.withOpacity(0.6),
            ),
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(value: '', child: Text('Select an event')),
              DropdownMenuItem(value: 'Event 1', child: Text('Event 1')),
              DropdownMenuItem(value: 'Event 2', child: Text('Event 2')),
              DropdownMenuItem(value: 'Event 3', child: Text('Event 3')),
            ],
          ),
        ),
      ];

  void _valuesReset() {
    _linkToExistingEvent = true;
    _selectedEvent = '';
  }
}
