class RoomList {
  int id;
  String name;
  String type;
  dynamic participants;

  RoomList(int id, String name, String type, dynamic participants) {
    this.id = id;
    this.name = name;
    this.type = type;
    this.participants = participants;
  }

  RoomList.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        type = json['type'],
        participants = json['participants'];

  Map toJson() {
    return {'id': id, 'name': name, 'type': type, 'participants': participants};
  }
}
