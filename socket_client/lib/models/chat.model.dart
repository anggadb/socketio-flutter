class Chat {
  int id;
  int sender;
  int reciever;
  String chat;
  String image;
  dynamic readers;

  Chat(int id, int sender, int reciever, String chat, String image,
      dynamic readers) {
    this.id = id;
    this.sender = sender;
    this.reciever = reciever;
    this.chat = chat;
    this.image = image;
    this.readers = readers;
  }

  Chat.fromJson(Map json)
      : id = json['id'],
        sender = json['sender'],
        reciever = json['reciever'],
        chat = json['message'],
        image = json['imagePath'],
        readers = json['readers'];

  Map toJson() {
    return {
      'id': id,
      'sender': sender,
      'reciever': reciever,
      'chat': chat,
      'image': image,
      'readers': readers
    };
  }
}
