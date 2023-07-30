import 'package:construction_company/bloc/new_diary_cubit.dart';
import 'package:construction_company/repositories/upload_data_repository.dart';
import 'package:construction_company/themes/app_theme.dart';
import 'package:construction_company/ui/screens/new_diary/new_diary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewDiaryCubit(UploadDataRepository()),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light, // Change when dark theme is ready
        home: const NewDiaryScreen(),
      ),
    );
  }
}
