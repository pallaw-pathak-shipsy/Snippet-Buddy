import 'package:blog_minimal/model/cotegories.dart';

class Post {
  String? id;
  String? title;
  String? description;
  String? shortDescription;
  int? beersCount;
  Author? author;
  List<Categories>? categories;
  String? date;
  String? image;

  Post({
    this.id,
    this.title,
    this.description,
    this.shortDescription,
    this.beersCount,
    this.author,
    this.categories,
    this.date,
    this.image,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortDescription = json['short_description'];
    beersCount = json['beers_count'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }

    date = json["date"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['beers_count'] = this.beersCount;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data["date"] = this.date;
    data["image"] = this.image;

    return data;
  }
}

class Author {
  String? id;
  String? name;

  Author({this.id, this.name});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
