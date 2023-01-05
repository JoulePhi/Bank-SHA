class FriendlyTipsModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  FriendlyTipsModel({
    this.id,
    this.thumbnail,
    this.title,
    this.url,
  });

  factory FriendlyTipsModel.fromJson(Map<String, dynamic> json) {
    return FriendlyTipsModel(
      id: json['id'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      url: json['url'],
    );
  }
}
