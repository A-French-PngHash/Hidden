import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_hidden_photo/Cubits/HomeCubit/home_cubit.dart';
import 'package:my_hidden_photo/Views/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        buttonTheme: ButtonThemeData(buttonColor: Colors.red),
      ),
      home: BlocProvider(create: (context) => HomeCubit(), child: SafeArea(child: Home())),
    );
  }
}
