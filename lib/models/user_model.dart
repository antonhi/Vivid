class UserModel {
  late String username;
  String? bio, photoURL;
  List<String>? posts, followers, following;

  UserModel({required this.username, this.photoURL, this.bio, this.posts, this.followers, this.following});
}
