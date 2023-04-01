class UserNotification {
  final int id;
  final String title;
  final String subtitle;
  final dynamic data;
  final String type;
  final String time;
  final String image;

  UserNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.data,
    required this.type,
    required this.time,
    required this.image,
  });

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
        id: map['id'] as int,
        title: map['title'] ?? "",
        subtitle: map['subtitle'] ?? "",
        data: map['data'],
        type: map['type'] ?? "test",
        time: map['time'] ?? "",
        image: map['time'] ?? "");
  }
}
