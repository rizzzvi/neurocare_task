class Drug {
  String? nameType;
  String? drugName;

  Drug({this.nameType, this.drugName});

  Drug.fromJson(Map<String, dynamic> json) {
    nameType = json['name_type'];
    drugName = json['drug_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_type'] = this.nameType;
    data['drug_name'] = this.drugName;
    return data;
  }
}
