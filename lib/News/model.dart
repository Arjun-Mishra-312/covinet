class NewsApiModel {
  String title, imageUrl, url, description;

  NewsApiModel(
      {required this.title,
      required this.description,
      required this.url,
      required this.imageUrl});

  factory NewsApiModel.fromJson(Map<String, dynamic> jsonData) {
    return NewsApiModel(
      title: jsonData['title'] ?? "",
      description: jsonData['description'] ?? "",
      url: jsonData['url'] ?? "",
      imageUrl: jsonData['urlToImage'] ?? "",
    );
  }
}
