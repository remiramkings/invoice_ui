import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/abc_mercantile_logo.png'),
                ),
                const SizedBox(height: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ABC MERCANTILE GROUP INDIA PVT LTD.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('PPXII 130A-130B, Corporate House, Kuppam P.O.,',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text('Taliparamba, Kannur, Kerala-670 502',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text('info@abcmercantile.com',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(color: Colors.grey),
            SizedBox(height: 5),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'QUOTATION # 28 / 2023',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date 19-06-2023'),
                  Text('Quot Date 19-06-2023'),
                  Text('Currency INR'),
                  Text('PO # NA')
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'TO',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ABHILASH CHILAMBIL',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text('9846229357', style: TextStyle(fontSize: 15)),
                  Text('thekkadi'),
                  Text('abhilashchilambil@gmail.com')
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                alignment: Alignment.centerLeft, child: Text('ITEM DETAILS')),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 1200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Table(
                  border: TableBorder.all(color: Colors.grey),
                  columnWidths: <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(flex: 2),
                    1: IntrinsicColumnWidth(flex: 1),
                    2: IntrinsicColumnWidth(flex: 2),
                  },
                  children: [
                    TableRow(children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('ITEMS',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('QTY/SQFT',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('IMAGE',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('QTY',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('MRP/SQFT',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('NET/SQFT',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('MRP TOTAL',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('NET TOTAL',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('AUGER'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child:
                                Image.network('https://picsum.photos/300/300'),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('10'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('0'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('2000'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('400000'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('4200000'),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('BUCKET & BUCKET PLATE'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('250'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child:
                                Image.network('https://picsum.photos/300/300'),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('1'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('2500'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('250'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('625000'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('656250'),
                        ),
                      )
                    ])
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
                    child: Text('4856250', textAlign: TextAlign.right)),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Discount', textAlign: TextAlign.right)),
                Expanded(flex: 1, child: Text('0', textAlign: TextAlign.right)),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Round Off', textAlign: TextAlign.right)),
                Expanded(flex: 1, child: Text('0', textAlign: TextAlign.right)),
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
                    child: Text('4856250', textAlign: TextAlign.right)),
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
                      text: 'Client to maintain the confidentiality of usage terms and commercials on a best effort basis',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ])),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('19-06-2023')
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18 ),
                    child: Text('Authorized Signature', textAlign: TextAlign.right),
                  )
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
