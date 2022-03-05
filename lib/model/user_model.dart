class UserModel {
  String? id;
  String? name;
  String? bio;
  String? profileImgUrl;
  int? beerCount;
  List<String>? followers;
  List<FollowedCategories>? followedCategories;
  List<MySnippets>? mySnippets;

  UserModel({
    this.id,
    this.name,
    this.bio,
    this.profileImgUrl,
    this.beerCount,
    this.followers,
    this.followedCategories,
    this.mySnippets,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    profileImgUrl = json['profile_img_url'];
    beerCount = json['beer_count'];
    followers = json['followers'].cast<String>();
    if (json['followed_categories'] != null) {
      followedCategories = <FollowedCategories>[];
      json['followed_categories'].forEach((v) {
        followedCategories!.add(new FollowedCategories.fromJson(v));
      });
    }
    if (json['my_snippets'] != null) {
      mySnippets = <MySnippets>[];
      json['my_snippets'].forEach((v) {
        mySnippets!.add(new MySnippets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['profile_img_url'] = this.profileImgUrl;
    data['beer_count'] = this.beerCount;
    data['followers'] = this.followers;
    if (this.followedCategories != null) {
      data['followed_categories'] =
          this.followedCategories!.map((v) => v.toJson()).toList();
    }
    if (this.mySnippets != null) {
      data['my_snippets'] = this.mySnippets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FollowedCategories {
  String? id;
  String? name;

  FollowedCategories({this.id, this.name});

  FollowedCategories.fromJson(Map<String, dynamic> json) {
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

class MySnippets {
  String? id;
  String? title;
  String? description;
  String? shortDescription;

  MySnippets({this.id, this.title, this.description, this.shortDescription});

  MySnippets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortDescription = json['short_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    return data;
  }
}
