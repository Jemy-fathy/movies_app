class AppUser {
  final String id;      
  final String email;
  final String name;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
  });

  factory AppUser.fromFireStore(Map<String, dynamic> data) {
    return AppUser(
      id: data['id'] as String,
      email: data['email'] as String,
      name: data['name'] as String,
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
