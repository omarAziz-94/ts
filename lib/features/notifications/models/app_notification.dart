class AppNotification {
  int id;
  String title;
  String body;
  DateTime date;
  bool isRead;

  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isRead,
  });
}
