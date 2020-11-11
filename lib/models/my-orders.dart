class MyOrders {
  String sId;
  String items;
  String created;
  String total;

  MyOrders({this.sId, this.items, this.created, this.total});

  MyOrders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    created = json['created'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['items'] = this.items;
    data['created'] = this.created;
    data['total'] = this.total;
    return data;
  }
}
