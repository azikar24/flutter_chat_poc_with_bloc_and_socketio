import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/home_screen_bloc.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/home_screen_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Application",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: const HomeScreenView(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
