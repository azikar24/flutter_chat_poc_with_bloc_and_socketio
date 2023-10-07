
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_poc_with_socket/app/config/config.dart';
import 'package:flutter_chat_poc_with_socket/app/data/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  Socket? socket;

  HomeScreenBloc() : super(HomeScreenState()) {
    initSocket();
    socketListeners();

    on<HomeScreenPartnerName>((event, emit) {
      emit(state.copyWith(partnerName: event.partnerName));
    });

    on<HomeScreenPartnerTyping>((event, emit) {
      emit(state.copyWith(isPartnerTyping: event.isPartnerTyping));
    });

    on<HomeScreenOnSendMessage>((event, emit) {
      print("HERE::::::${event.message}");
      List<MessageModel> list = state.messages;
      list.add(event.message);
      emit(state.copyWith(messages: list, inputMessage: ""));
      socket?.emit("message", event.message);
      socket?.emit("typing", false);
    });

    on<HomeScreenOnReceiveMessage>((event, emit) {
      List<MessageModel> list = state.messages;
      list.add(event.message);
      emit(state.copyWith(messages: list));
    });

    on<HomeScreenTyping>((event, emit) {
      if (state.inputMessage.isNotEmpty && event.message.isNotEmpty || state.inputMessage.isEmpty && event.message.isEmpty) {
        emit(state.copyWith(inputMessage: event.message));
      } else {
        socket?.emit("typing", event.message.isNotEmpty);
        emit(state.copyWith(inputMessage: event.message));
      }
    });
  }

  void socketListeners() {
    socket?.on("message", (event) {
      final type = event["type"] ?? "";
      final data = event["data"] ?? "";

      switch (type) {
        case "username":
          add(HomeScreenPartnerName(partnerName: data));
          break;
        case "typing":
          add(HomeScreenPartnerTyping(isPartnerTyping: data));
          break;
        case "message":
          add(HomeScreenOnReceiveMessage(message: MessageModel.fromJson(data)));
          break;
        default:
          print("NOT SUPPORTED TYPE");
      }
    });
  }

//
  void initSocket() {
    if (socket != null) {
      print("Socket Already Initialized");
      return;
    }
    OptionBuilder builder = OptionBuilder().setQuery(
      {'username': username, 'room': socketRoom},
    ).setTransports(
      ['websocket', 'pool'],
    );
    builder.enableForceNewConnection();
    builder.disableAutoConnect();
    socket = io(
      socketHost,
      builder.build(),
    );

    socket?.connect();
    socket?.onConnect((data) => print("AppSocket Connected"));
    socket?.onConnectError((data) => print("error: $data"));
    socket?.onDisconnect((data) => print("disconnected: $data"));
  }

  ValueChanged<String>? onInputChange(String input) {
    emit(state.copyWith(inputMessage: input));
  }
}
