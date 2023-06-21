class EnquiryModel {
  String total;
  String discount;
  String roundOf;
  String grandTotal;
  String createdDate;
  String clientName;
  String mobileNumber;
  String clientLocation;
  String clientEmail;


  EnquiryModel({
    required this.total,
    required this.discount,
    required this.roundOf,
    required this.grandTotal,
    required this.createdDate,
    required this.clientName,
    required this.mobileNumber,
    required this.clientLocation,
    required this.clientEmail
  });

  factory EnquiryModel.fromMap(Map<String, dynamic> map){
    return EnquiryModel(
      total: map['total'],
      discount: map['discount'],
      roundOf: map['roundof'],
      grandTotal: map['grand_total'],
      createdDate:map['created_date'],
      clientName:map['client_name'],
      mobileNumber: map['client_mobile_number'],
      clientLocation: map['client_location'],
      clientEmail: map['client_email']
      );
  }
}