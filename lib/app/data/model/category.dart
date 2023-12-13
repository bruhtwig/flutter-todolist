class Category {
  final int id;
  final int userId;
  final String title;

  Category({
    required this.id,
    required this.userId,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}
