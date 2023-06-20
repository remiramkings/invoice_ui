class EnquiryModel {
  String total;
  String discount;
  String roundOf;
  String grandTotal;

  EnquiryModel({
    required this.total,
    required this.discount,
    required this.roundOf,
    required this.grandTotal,
  });

  factory EnquiryModel.fromMap(Map<String, dynamic> map){
    return EnquiryModel(
      total: map['total'],
      discount: map['discount'],
      roundOf: map['roundof'],
      grandTotal: map['grand_total']);
  }
}