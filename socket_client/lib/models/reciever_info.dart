class SocketInfo {
  String name;
  String id;
  String socketId;

  SocketInfo(String name, String id, String socketId) {
    this.name = name;
    this.id = id;
    this.socketId = socketId;
  }

  SocketInfo.fromJson(Map json)
      : name = json['name'],
        id = json['id'],
        socketId = json['socketId'];

  Map toJson() {
    return {"name": name, "id": id, "socketId": socketId};
  }
}
