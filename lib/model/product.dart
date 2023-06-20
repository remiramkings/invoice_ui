class ProductModel{
  String productName;
  String quantity;
  String taxAmount;
  String mrp;
  String mrpTotal;
  String netPerSqft;


  ProductModel({required this.productName,
  required this.quantity,
  required this.taxAmount,
  required this.mrp,
  required this.mrpTotal,
  required this.netPerSqft
 });

 factory ProductModel.fromMap(Map<String, dynamic> map){
    return ProductModel(
      productName: map['product'],
      quantity: map['quantity'],
      taxAmount: map['tax_amount'],
      mrp:map['mrp'],
      mrpTotal:map['mrp_total'],
      netPerSqft: map['net_per_sqft']
    );
 }

}