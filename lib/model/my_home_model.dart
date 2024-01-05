class Character {
  int? id;
  String? name;
  String? status;
  String? image;
  String? type;
  String? gender;
  String url;
  //vdbfd
  Character.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    status = map["status"];
    image = map["image"];
    type = map["type"];
    gender = map["gender"];
    url = map["url"];
  }
}
