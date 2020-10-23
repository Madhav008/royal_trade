class Users {
  final String userId;
  final String email;
  final String username;
  final String name;
  final String image;
  final bool isAdmin;

  Users(
      {this.username,
      this.name,
      this.image,
      this.email,
      this.userId,
      this.isAdmin});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'name': name,
      'image': image,
      'email': email,
      'isAdmin': isAdmin,
    };
  }

  Users.fromFirestore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        username = firestore['username'],
        name = firestore['name'],
        image = firestore['image'],
        email = firestore['email'],
        isAdmin = firestore['isAdmin'];
}
