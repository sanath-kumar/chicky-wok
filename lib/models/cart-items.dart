class CartItems {
  String sId;
  String name;
  String description;
  String mrp;
  String quantity;
  String total;
  String thumbnail;


  CartItems({
    this.sId,
    this.name,
    this.description,
    this.mrp,
    this.quantity,
    this.total,
    this.thumbnail
    });

  CartItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    mrp = json['mrp'];
    quantity = json['quantity'];
    total = json['total'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['mrp'] = this.mrp;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['thumbnail'] = this.thumbnail;

    return data;
  }
}