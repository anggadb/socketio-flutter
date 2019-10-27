class RoomList {
  int id;
  String name;
  int senderId;
  int userId;
  dynamic participants;

  RoomList(
      int id, String name, int senderId, int userId, dynamic participants) {
    this.id = id;
    this.name = name;
    this.senderId = senderId;
    this.userId = userId;
    this.participants = participants;
  }

  RoomList.fromJson(Map json)
      : id = json['id'],
        name = json['roomName'],
        senderId = json['creator'],
        userId = json['userId'],
        participants = json['participants'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'senderId': senderId,
      'userId': userId,
      'participants': participants
    };
  }
}
