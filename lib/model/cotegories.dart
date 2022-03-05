class Categories {
  String? id;
  String? name;
  String? imgUrl;
  String? description;
  List<String>? snippets;
  List<String>? subCategories;

  Categories({
    this.id,
    this.name,
    this.imgUrl,
    this.description,
    this.snippets,
    this.subCategories,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgUrl = json['img_url'];
    description = json['description'];
    snippets = json['snippets'].cast<String>();
    subCategories = json['sub_categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img_url'] = this.imgUrl;
    data['description'] = this.description;
    data['snippets'] = this.snippets;
    data['sub_categories'] = this.subCategories;
    return data;
  }
}
