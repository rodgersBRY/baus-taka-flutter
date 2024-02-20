class ReportModel {
    String title;
    String location;
    String date;
    String details;
    String imageUrl;

    ReportModel({
        required this.title,
        required this.location,
        required this.date,
        required this.details,
        required this.imageUrl,
    });

    factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        title: json["title"],
        location: json["location"],
        date: json["date"],
        details: json["details"],
        imageUrl: json["imageUrl"],
    );
}
