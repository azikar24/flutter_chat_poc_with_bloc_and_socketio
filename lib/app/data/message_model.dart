class MessageModel {
  String? messageText;
  String? byUUID;

  MessageModel({this.messageText, this.byUUID});

  MessageModel.fromJson(Map<String, dynamic> json) {
    messageText = json['messageText'];
    byUUID = json['byUUID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageText'] = messageText;
    data['byUUID'] = byUUID;
    return data;
  }
}
