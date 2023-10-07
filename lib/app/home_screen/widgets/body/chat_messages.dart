import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_poc_with_socket/app/config/config.dart';
import 'package:flutter_chat_poc_with_socket/app/data/message_model.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/home_screen_bloc.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key}) : super(key: key);

  Widget buildMessage(MessageModel messageModel, BuildContext context) {
    final byMe = messageModel.byUUID == username;
    final containerColor = byMe ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.tertiaryContainer;
    final textColor = byMe ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.onTertiaryContainer;
    return Align(
      alignment: byMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          messageModel.messageText ?? "",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return buildMessage(state.messages[index], context);
            },
            itemCount: state.messages.length,
          );
        },
      ),
    );
  }
}
