import 'package:flutter/material.dart';
import 'package:ui_project/service/product_service.dart';

import 'model/product.dart';
import 'model/enquiry_model.dart';

class Quotation3 extends StatefulWidget {
  const Quotation3({super.key});

  @override
  State<Quotation3> createState() => _Quotation3State();
}

class _Quotation3State extends State<Quotation3> {
  List<ProductModel> productList = [];
  EnquiryModel? enquiry;

  loadProducts() async {
    var map = await ProductService.getInstance().getEnquiryData();
    setState(() {
      productList = map['products'];
      enquiry = map['enquiry'];
    });
  }

  initState() {
    loadProducts();
  }

  TableRow drawItem(ProductModel product) {
    return TableRow(children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.productName),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.quantity),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.network('https://picsum.photos/300/300'),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.quantity),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.netPerSqft),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.netPerSqft),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.mrpTotal),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(product.taxAmount),
        ),
      )
    ]);
  }

  List<TableRow> drawItems() {
    return productList.isEmpty ? [] : productList.map((product){
      return drawItem(product);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(flex: 4),
                  1: IntrinsicColumnWidth(flex: 1),
                  2: IntrinsicColumnWidth(flex: 3),
                  3: IntrinsicColumnWidth(flex: 1),
                  4: IntrinsicColumnWidth(flex: 1),
                  5: IntrinsicColumnWidth(flex: 1),
                  6: IntrinsicColumnWidth(flex: 2),
                  7: IntrinsicColumnWidth(flex: 2),
                },
                children: [
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('ITEMS',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('QTY/SQFT',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('IMAGE',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('QTY',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('MRP/SQFT',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('NET/SQFT',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('MRP TOTAL',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('NET TOTAL',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ]),
                  ...drawItems()
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Total Amount', textAlign: TextAlign.right)),
              Expanded(
                  flex: 1, child: Text(enquiry == null ? '' : enquiry!.total, textAlign: TextAlign.right)),
              SizedBox(width: 10)
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  flex: 1, child: Text('Discount', textAlign: TextAlign.right)),
              Expanded(flex: 1, child: Text(enquiry == null ? '' : enquiry!.discount, textAlign: TextAlign.right)),
              SizedBox(width: 10)
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Round Off', textAlign: TextAlign.right)),
              Expanded(flex: 1, child: Text(enquiry == null ? '' : enquiry!.roundOf, textAlign: TextAlign.right)),
              SizedBox(width: 10)
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Grand Total', textAlign: TextAlign.right)),
              Expanded(
                  flex: 1, child: Text(enquiry == null ? '' : enquiry!.grandTotal, textAlign: TextAlign.right)),
              SizedBox(width: 10)
            ],
          ),
        ],
      ),
    ));
  }
}
