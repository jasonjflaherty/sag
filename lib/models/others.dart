class Others {
  String powerunit;
  String sparkArrester;
  String mfg;
  String type;
  String remarks;

  Others(
      {this.powerunit, this.sparkArrester, this.mfg, this.type, this.remarks});

  Others.fromJson(Map<String, dynamic> json) {
    powerunit = json['powerunit'];
    sparkArrester = json['spark-arrester'];
    mfg = json['mfg'];
    type = json['type'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['powerunit'] = this.powerunit;
    data['spark-arrester'] = this.sparkArrester;
    data['mfg'] = this.mfg;
    data['type'] = this.type;
    data['remarks'] = this.remarks;
    return data;
  }
}