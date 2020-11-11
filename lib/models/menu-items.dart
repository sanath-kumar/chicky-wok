class MenuItems{
  String sId;
  String name;
  String description;
  String mrp;
  String offerPrice;
  String country;
  String thumbnail;
  int iV;

  MenuItems(
      { this.sId,
        this.name,
        this.description,
        this.mrp,
        this.offerPrice,
        this.country,
        this.thumbnail,
        this.iV});

  MenuItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    mrp = json['mrp'];
    offerPrice = json['offer_price'];
    country = json['country'];
    thumbnail = json['thumbnail'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['mrp'] = this.mrp;
    data['offer_price'] = this.offerPrice;
    data['country'] = this.country;
    data['thumbnail'] = this.thumbnail;
    data['__v'] = this.iV;
    return data;
  }
}
