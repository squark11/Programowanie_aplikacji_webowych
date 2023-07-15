class Role {
  final String id;
  final String name;

  Role({
    required this.id,
    required this.name,
  });

  // JSON
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
