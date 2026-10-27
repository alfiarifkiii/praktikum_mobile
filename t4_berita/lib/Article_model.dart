class Article{
  final String title;
  final String? description;
  final String? urlToimage;

  Article({
    required this.title,
    this.description,
    this.urlToimage
  });

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      title: json['title'] as String,
      description: json['description'] as String?,
      urlToimage: json['urlToImage'] as String?
    );
  }
}