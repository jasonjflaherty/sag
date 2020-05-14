class GSAs {
  String manufacturer;
  String model;
  String description;

  GSAs({this.manufacturer, this.model, this.description});

  GSAs.fromJson(Map<String, dynamic> json) {
    manufacturer = json['manufacturer'];
    model = json['model'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    data['description'] = this.description;
    return data;
  }
}