import 'dart:convert';

class CategoryModel {
  String text;
  String imageUrl;
  String route;

  CategoryModel({
    required this.text,
    required this.imageUrl,
    required this.route,
  });
  

  CategoryModel copyWith({
    String? text,
    String? imageUrl,
    String? route,
  }) {
    return CategoryModel(
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'imageUrl': imageUrl,
      'route': route,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      text: map['text'],
      imageUrl: map['imageUrl'],
      route: map['route'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(text: $text, imageUrl: $imageUrl, route: $route)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.text == text &&
      other.imageUrl == imageUrl &&
      other.route == route;
  }

  @override
  int get hashCode => text.hashCode ^ imageUrl.hashCode ^ route.hashCode;
}
