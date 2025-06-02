class TodolistModel {
  String? createdAt;
  String? title;
  String? description;
  String? token;
  String? id;

  TodolistModel({
    this.createdAt,
    this.title,
    this.description,
    this.token,
    this.id,
  });

  TodolistModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    description = json['description'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}
