class Task {
  final int id;
  final int userId;
  final String title;
  final String? description;
  final List<String>? category;
  final DateTime? deadline;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.category,
    this.description,
    this.deadline,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'category': category,
      'deadline': deadline?.toIso8601String(),
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      deadline: json['deadline'],
    );
  }
}
