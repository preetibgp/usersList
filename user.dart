class User {
  int id;
  String first_name;
  String last_name;
  String email;
  Image image;

  User(int id, String first_name,String last_name, String email,Image image) {
    this.id = id;
    this.name = first_name;
    this.name=last_name;
    this.email = email;
    this.image;
  }

  User.fromJson(Map json)
      : id = json['id'],
        first_name = json['first_name'],
  last_name=json['last_name'],
        email = json['email'];
  image=json['image'],

  Map toJson() {
    return {'id': id, 'first_name': first_name, 'last_name':last_name, 'email': email,'image':image};
  }
}
