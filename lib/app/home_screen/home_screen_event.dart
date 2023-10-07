part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeScreenAddMessageEvent extends HomeScreenEvent {
  HomeScreenAddMessageEvent();
}

class HomeScreenPartnerName extends HomeScreenEvent {
  String partnerName = "";

  HomeScreenPartnerName({this.partnerName = ""});
}

class HomeScreenPartnerTyping extends HomeScreenEvent {
  bool isPartnerTyping = false;

  HomeScreenPartnerTyping({this.isPartnerTyping = false});
}

class HomeScreenTyping extends HomeScreenEvent {
  String message;

  HomeScreenTyping({required this.message});
}

class HomeScreenOnSendMessage extends HomeScreenEvent {
  MessageModel message;

  HomeScreenOnSendMessage({required this.message});
}

class HomeScreenOnReceiveMessage extends HomeScreenEvent {
  MessageModel message;

  HomeScreenOnReceiveMessage({required this.message});
}
