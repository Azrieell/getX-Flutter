class Categori {
  int? id;
  String? incomeCategory;
  String? expenditureCategory;
  String? createdAt;
  String? updatedAt;

  Categori(
      {this.id,
      this.incomeCategory,
      this.expenditureCategory,
      this.createdAt,
      this.updatedAt});

  Categori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    incomeCategory = json['income_category'];
    expenditureCategory = json['expenditure_category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['income_category'] = this.incomeCategory;
    data['expenditure_category'] = this.expenditureCategory;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}