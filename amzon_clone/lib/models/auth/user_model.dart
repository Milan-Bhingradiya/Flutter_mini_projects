class Usermodel {
  String? token;
  String? name;
  String? email;
  String? password;
  String? address;
  String? type;
  String? id;

  Usermodel(
      {this.name, this.email, this.password, this.address, this.type, this.id});

   void fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}
