import 'package:flutter/material.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/widgets/appbar/home_app_bar.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/widgets/body/home_screen_body.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const HomeAppBar(), elevation: 2,),
      body: const HomeScreenBody(),
    );
  }
}
