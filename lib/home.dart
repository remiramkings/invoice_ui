import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

enum PageSize { A4, A5 }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageSize? selectedPageSize = PageSize.A4;

  XFile? galleryImage;
  List<XFile>? imageFileList = [];
  String? imagePath;
  List<String> multiImagePath = [];

  onChangeImage() async {
    ImagePicker imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    galleryImage = image;
    imagePath = image!.path;
    setState(() {});
  }

  void selectImages() async {
    ImagePicker imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      multiImagePath = selectedImages.map((e) => e.path).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(''),
            ),
            InkWell(
              child: Icon(Icons.image),
              onTap: onChangeImage,
            ),
            SizedBox(width: 10),
            InkWell(
              child: Icon(Icons.image),
              onTap: selectImages,
            )
          ],
        )),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Invoice')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: null, child: Text('Quotation'))
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Text(
                'Water Mark',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'QUOT'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Page Size',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(children: [
                  Radio<PageSize>(
                      value: PageSize.A4,
                      groupValue: selectedPageSize,
                      onChanged: (PageSize? pageSize) {
                        setState(() {
                          selectedPageSize = pageSize;
                        });
                      }),
                  Text('${PageSize.A4.name}')
                ]),
                SizedBox(width: 20),
                Row(children: [
                  Radio<PageSize>(
                      value: PageSize.A5,
                      groupValue: selectedPageSize,
                      onChanged: (PageSize? pageSize) {
                        setState(() {
                          selectedPageSize = pageSize;
                        });
                      }),
                  Text('${PageSize.A5.name}')
                ])
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Show Bank Details'))
                ]),
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Hide Price'))
                ]),
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Show Long Description'))
                ]),
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Show Short Description'))
                ]),
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Show Product Specifications'))
                ]),
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Split Product in New Line'))
                ]),
                Row(children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(flex: 1, child: Text('Show Generated User Name'))
                ])
              ],
            ),
            imagePath != null && imagePath!.isNotEmpty
                ? Text(imagePath!)
                : Text(''),
            Expanded(
              flex:1,
              child: Column(
                  children: multiImagePath.isNotEmpty
                      ? multiImagePath.map((e) => Text(e)).toList()
                      : [Text('')]),
            ),
                    SizedBox(height:50),
           
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 1200,
                    height: 960,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('ABC'),
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(height: 20),
                        Row(children: [
                          Expanded(
                              flex: 1,
                              child: Text('INVOICE #/2023',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 1,
                              child: Text('TO',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)))
                        ]),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.grey, width: 1))),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.green),
                                          ),
                                          const SizedBox(width: 10),
                                          const Expanded(
                                              flex: 1,
                                              child: Row(children: [
                                                Text('Date',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(width: 10),
                                                Text('16-16-2023')
                                              ]))
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.blue),
                                          ),
                                          const SizedBox(width: 10),
                                          const Expanded(
                                              flex: 1,
                                              child: Row(children: [
                                                Text('Invoice Date',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(width: 10),
                                                Text('16-16-2023')
                                              ]))
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 219, 135, 245)),
                                          ),
                                          const SizedBox(width: 10),
                                          const Expanded(
                                              flex: 1,
                                              child: Row(children: [
                                                Text('Currency',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(width: 10),
                                                Text('')
                                              ]))
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.black),
                                          ),
                                          const SizedBox(width: 10),
                                          const Expanded(
                                              flex: 1,
                                              child: Row(children: [
                                                Text('PO #',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(width: 10),
                                                Text('NA')
                                              ]))
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(flex: 1, child: Container(child: Text('')))
                          ]),
                        ),
                        SizedBox(height: 20),
                        Text('ITEM DETAILS'),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 216, 216, 216),
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Text('ITEMS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'QTY',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text('RATE',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Text('NET',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Text('TAX',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              Expanded(
                                  flex: 1,
                                  child: Text('TOTAL',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image.network(
                                          'https://picsum.photos/300/300'),
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Text('BUCKET & BUCKET PLATE'),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Text('1',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('2500.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('2500.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('0.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('5000.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(color: Colors.grey),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image.network(
                                          'https://picsum.photos/300/300'),
                                    ),
                                    SizedBox(width: 10),
                                    Text('',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Text('0',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('0.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('0.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('0.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                flex: 1,
                                child: Text('0.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(color: Colors.grey),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('TERMS & CONDITIONS',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(TextSpan(
                                          text: 'PRICES :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Delivery and Demonstration at your site',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ])),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(TextSpan(
                                          text: 'GST :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text: 'Inclusive',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ])),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(TextSpan(
                                          text: 'DELIVERY :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Within 4-6 weeks from the date of receipt of your clear order',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ])),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(TextSpan(
                                          text: 'PAYMENT :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Immediately against delivery of materials',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ])),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(TextSpan(
                                          text: 'VALIDITY :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '30 Days. Further validity subject to out confirmation',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ])),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(TextSpan(
                                          text: 'WARRANTY :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '12 month warranty from the date of supply against manufacturing defect only. Consumables like bulbs, tubes, electrodes etc. are excluded',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ])),
                                    )
                                  ],
                                )),
                            Expanded(
                              flex: 1,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Total Amount',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                        flex: 1,
                                        child: Text('5000.00',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.grey),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Round Off',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                        flex: 1,
                                        child: Text('0.00',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 216, 216, 216)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Grand Total',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Expanded(
                                            flex: 1,
                                            child: Text('.00',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    )),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Payed',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                        flex: 1,
                                        child: Text('0.00',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.grey),
                              ]),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text.rich(TextSpan(text: 'for ', children: [
                            TextSpan(
                              text: 'ABC',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])),
                        ),
                        SizedBox(height: 60),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text('Authorized Signature'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
