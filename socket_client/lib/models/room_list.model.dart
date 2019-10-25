class RoomList {
  int id;
  String name;
  int senderId;
  dynamic participants;

  RoomList(int id, String name, int senderId, dynamic participants) {
    this.id = id;
    this.name = name;
    this.senderId = senderId;
    this.participants = participants;
  }

  RoomList.fromJson(Map json)
      : id = json['id'],
        name = json['roomName'],
        senderId = json['creator'],
        participants = json['participants'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'senderId': senderId,
      'participants': participants
    };
  }
}
