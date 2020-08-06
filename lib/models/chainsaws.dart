class Chainsaws {
  String model;
  String exhaust;
  String mfr;
  String handlebar;
  String spike;
  String cbHg;
  String remarks;

  Chainsaws(
      {this.model,
      this.exhaust,
      this.mfr,
      this.handlebar,
      this.spike,
      this.cbHg,
      this.remarks});

  Chainsaws.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    exhaust = json['exhaust'];
    mfr = json['mfr'];
    handlebar = json['handlebar'];
    spike = json['spike'];
    cbHg = json['cbHg'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['exhaust'] = this.exhaust;
    data['mfr'] = this.mfr;
    data['handlebar'] = this.handlebar;
    data['spike'] = this.spike;
    data['cbHg'] = this.cbHg;
    data['remarks'] = this.remarks;
    return data;
  }
}
