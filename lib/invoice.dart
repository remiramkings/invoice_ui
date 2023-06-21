import 'package:flutter/material.dart';
import 'package:ui_project/service/product_service.dart';
import 'package:ui_project/utils/date_utility.dart';
import 'model/enquiry_model.dart';
import 'model/product.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  List<ProductModel> productList = [];
  EnquiryModel? enquiry;
  late String createdDate;

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
    return productList.isEmpty
        ? []
        : productList.map((product) {
            return drawItem(product);
          }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            const SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/abc_mercantile_logo.png'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ABC MERCANTILE GROUP INDIA PVT LTD.',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('PPXII 130A-130B, Corporate House, Kuppam P.O.,',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      Text('Taliparamba, Kannur, Kerala-670 502',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      Text('info@abcmercantile.com',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'QUOTATION # 28 / 2023',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'TO',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Date ${enquiry == null ? '' : DateUtility.getFormattedDate(enquiry!.createdDate)}'),
                        Text(
                            'Quot Date ${enquiry == null ? '' : DateUtility.getFormattedDate(enquiry!.createdDate)}'),
                        Text('Currency INR'),
                        Text('PO # NA'),
                        Text('')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(enquiry == null ? '' : enquiry!.clientName),
                        Text(enquiry == null ? '' : enquiry!.mobileNumber),
                        Text(enquiry == null ? '' : enquiry!.clientLocation),
                        Text(enquiry == null ? '' : enquiry!.clientEmail),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
                alignment: Alignment.centerLeft, child: Text('ITEM DETAILS')),
            SizedBox(height: 10),
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
                    flex: 1,
                    child: Text(enquiry == null ? ' ' : enquiry!.total,
                        textAlign: TextAlign.right)),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Discount', textAlign: TextAlign.right)),
                Expanded(
                    flex: 1,
                    child: Text(enquiry == null ? '' : enquiry!.discount,
                        textAlign: TextAlign.right)),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Round Off', textAlign: TextAlign.right)),
                Expanded(
                    flex: 1,
                    child: Text(enquiry == null ? '' : enquiry!.roundOf,
                        textAlign: TextAlign.right)),
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
                    flex: 1,
                    child: Text(enquiry == null ? '' : enquiry!.grandTotal,
                        textAlign: TextAlign.right)),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('TERMS & CONDITIONS',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text.rich(TextSpan(
                  text: 'PAYMENT: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '100% Advance payment',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ])),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text.rich(TextSpan(
                  text: 'SUBSCRIPTION PERIOD: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '12 Months',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ])),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text.rich(TextSpan(
                  text: '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                          'Futher to the subscription period the client needs to pay the monthly subscription charges at the beginning of the next period & it is upgradable periodically based on adding more number of users.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ])),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text.rich(TextSpan(
                  text: 'CONFIDENTIALITY: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                          'Client to maintain the confidentiality of usage terms and commercials on a best effort basis',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ])),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(enquiry == null
                        ? ''
                        : DateUtility.getFormattedDate(enquiry!.createdDate))),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Text('Authorized Signature',
                          textAlign: TextAlign.right),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
