class NotificationModel {
  String title;
  String subtitle;
  String date;
  String imageUrl;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.imageUrl,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'],
        subtitle: json['subtitle'],
        date: json['date'],
        imageUrl: json['image_url'],
      );
}
