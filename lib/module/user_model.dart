class UserModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? email;
  String? password;
  String? token;
  String? id;

  UserModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.email,
    this.password,
    this.token,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}
