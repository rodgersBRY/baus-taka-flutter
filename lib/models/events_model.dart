class EventModel {
    String title;
    String location;
    String date;
    String details;
    List<dynamic> hashTags;
    String imageUrl;

    EventModel({
        required this.title,
        required this.location,
        required this.date,
        required this.details,
        required this.hashTags,
        required this.imageUrl,
    });

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"],
        location: json["location"],
        date: json["date"],
        details: json["details"],
        hashTags: List<dynamic>.from(json["hashTags"].map((x) => x)),
        imageUrl: json["imageUrl"],
    );
}
