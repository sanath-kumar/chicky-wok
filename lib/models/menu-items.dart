class MenuItems {
  String sId;
  String name;
  String featuredImage;
  String category;
  int mrp;
  String flag;
  int sellingPrice;
  String description;

  MenuItems(
      {this.sId,
        this.name,
        this.featuredImage,
        this.category,
        this.mrp,
        this.flag,
        this.sellingPrice,
        this.description});

  MenuItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    featuredImage = json['featured_image'];
    category = json['category'];
    mrp = json['mrp'];
    flag = json['flag'];
    sellingPrice = json['selling_price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['featured_image'] = this.featuredImage;
    data['category'] = this.category;
    data['mrp'] = this.mrp;
    data['flag'] = this.flag;
    data['selling_price'] = this.sellingPrice;
    data['description'] = this.description;
    return data;
  }
}
