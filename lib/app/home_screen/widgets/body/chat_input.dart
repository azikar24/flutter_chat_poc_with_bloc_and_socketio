import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_poc_with_socket/app/config/config.dart';
import 'package:flutter_chat_poc_with_socket/app/data/message_model.dart';
import 'package:flutter_chat_poc_with_socket/app/home_screen/home_screen_bloc.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputTextController = TextEditingController();

    return Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        child: TextField(
          onChanged: (input) => context.read<HomeScreenBloc>().add(HomeScreenTyping(message: input)),
          controller: inputTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: "Enter your message here",
            suffixIcon: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                Color color = state.inputMessage.isNotEmpty ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withOpacity(0.27);
                return IconButton(
                  icon: Icon(Icons.send, color: color),
                  onPressed: () {
                    if (state.inputMessage.isNotEmpty) {
                      context.read<HomeScreenBloc>().add(HomeScreenOnSendMessage(message: MessageModel(messageText: state.inputMessage, byUUID: username)));
                      inputTextController.clear();
                    }
                  },
                );
              },
            ),
          ),
        ));
  }
}
