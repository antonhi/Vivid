class PostModel {

  late String id, url, type, user;
  String? title, description;

  PostModel({required this.id, required this.url, required this.type, required this.user, this.title, this.description});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], url: json['url'], title: json['title'], description: json['description'], type: json['type'],
        user: json['user']);
  }

}