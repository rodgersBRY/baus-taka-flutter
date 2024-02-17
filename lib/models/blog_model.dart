class BlogItemModel {
    String title;
    String location;
    int likesCount;
    String details;
    List<dynamic> comments;
    String imageUrl;

    BlogItemModel({
        required this.title,
        required this.location,
        required this.likesCount,
        required this.details,
        required this.comments,
        required this.imageUrl,
    });

    factory BlogItemModel.fromJson(Map<String, dynamic> json) => BlogItemModel(
        title: json["title"],
        location: json["location"],
        likesCount: json["likesCount"],
        details: json["details"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "location": location,
        "likesCount": likesCount,
        "details": details,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "imageUrl": imageUrl,
    };
}
