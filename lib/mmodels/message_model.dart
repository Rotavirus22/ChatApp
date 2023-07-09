class MessageModel {
  String? senderId;
  String? sender;
  String? receiverId;
  String? receiver;
  String? content;
  bool? seen;
  DateTime? createdOn;
  MessageModel(
      { this.senderId,this.sender,this.receiverId,this.receiver, this.content, this.seen, this.createdOn});

  MessageModel.fromMap(Map<String, dynamic> map) {
    senderId = map["senderId"];
    sender = map["sender"];
    receiverId = map["receiverId"];
    receiver = map["receiver"];
    content = map["content"];
    seen = map["seen"];
    createdOn = map["createdOn"].toDate();
  }
  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "sender":sender,
      "receiverId":receiverId,
      "receiver":receiver,
      "content": content,
      "seen": seen,
      "createdOn": createdOn,
    };
  }
}
