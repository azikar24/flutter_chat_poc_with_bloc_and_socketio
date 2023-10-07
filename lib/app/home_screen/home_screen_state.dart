part of 'home_screen_bloc.dart';

class HomeScreenState {
  String partnerName;
  bool isPartnerTyping;

  String inputMessage;

  List<MessageModel> messages = List.empty(growable: true);

  HomeScreenState({
    this.partnerName = "",
    this.isPartnerTyping = false,
    this.inputMessage = "",
    List<MessageModel>? messages,
  }) {
    this.messages = messages ?? List.empty(growable: true);
  }

  HomeScreenState copyWith({
    String? partnerName,
    bool? isPartnerTyping,
    List<MessageModel>? messages,
    String? inputMessage,
  }) {
    return HomeScreenState(
      partnerName: partnerName ?? this.partnerName,
      isPartnerTyping: isPartnerTyping ?? this.isPartnerTyping,
      messages: messages ?? this.messages,
      inputMessage: inputMessage ?? this.inputMessage,
    );
  }
}
