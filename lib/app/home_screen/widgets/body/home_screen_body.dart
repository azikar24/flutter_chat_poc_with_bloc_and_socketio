import 'package:flutter/material.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/widgets/body/chat_input.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/widgets/body/chat_messages.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChatMessages(),
        ChatInput(),
      ],
    );
  }
}
