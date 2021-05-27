import 'package:flutter/material.dart';

class ComplainForm extends StatefulWidget {
  @override
  _ComplainFormState createState() => _ComplainFormState();
}

class _ComplainFormState extends State<ComplainForm> {
  var _changeLanguage = false;
  List<String> category = [
    'Public Multi-Media Complaint ',
    'Serial Complaint',
    'First-time complaint',
    'Good Customer Complaint',
    'Personnel Complain',
    'Product Specific Complaint',
    'Wait – Times Complaint'
  ];
  String? selectedCategory;

  List<String> complain = [
    'Debt collection',
    'Credit reporting, credit repair services, or other personal consumer reports',
    'Credit card or prepaid card',
  ];
  String? selectedComplain;

  List<String> priority = ['Active', 'Inactive'];

  String? selectedpriority;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _changeLanguage = !_changeLanguage;
                      });
                    },
                    icon: Icon(
                      Icons.language,
                      size: width * 0.08,
                    )),
                CircleAvatar(
                  child: Text("dp"),
                  backgroundColor: Colors.white,
                )
              ],
            ),
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _changeLanguage ? 'गुनासो फारम' : 'Complain Form'.toUpperCase(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      _changeLanguage
                          ? 'कोटी छनौट गर्नुहोस्'
                          : 'Choose a Category',
                    ),
                  ),
                  Text("*", style: TextStyle(color: Colors.red)),
                ],
              ),
              SizedBox(height: 10),

              // DropdownButtonFormField(
              //     decoration: InputDecoration(border: OutlineInputBorder()),
              //     items: []),

              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    iconSize: 30,
                    value: selectedCategory,
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Categories'),
                    ),
                    items: category.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            // maxLines: 1,overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(
                        () {
                          selectedCategory = value;
                        },
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    _changeLanguage ? 'शीर्षक' : 'Title',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  Text(_changeLanguage ? 'गुनासो' : 'Complain for'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  _changeLanguage
                      ? SizedBox(
                          width: width * 0.39,
                        )
                      : SizedBox(
                          width: width * 0.21,
                        ),
                  Text(_changeLanguage ? 'प्राथमिकता' : 'Priority'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // complain for field
              Row(
                children: [
                  Expanded(
                    // child: DropdownButtonFormField(
                    //     decoration:
                    //         InputDecoration(border: OutlineInputBorder()),
                    //     items: []),

                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconSize: 30,
                          value: selectedComplain,
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('Complain'),
                          ),
                          items: complain.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value,
                                  // maxLines: 1,overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(
                              () {
                                selectedComplain = value;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),

                  // priority field
                  Expanded(
                      // child: DropdownButtonFormField(
                      //     decoration:
                      //         InputDecoration(border: OutlineInputBorder()),
                      //     items: []),
                      child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 30,
                        value: selectedpriority,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('priority'),
                        ),
                        items: priority.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                // maxLines: 1,overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(
                            () {
                              selectedpriority = value;
                            },
                          );
                        },
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(_changeLanguage ? 'संलग्नकहरू' : 'Attachments'),
                  SizedBox(width: 5),
                  Text(
                    _changeLanguage ? 'वैकल्पिक' : '(optional)',
                    style: TextStyle(color: Colors.black45),
                  )
                ],
              ),
              Row(
                children: [
                  // Row(
                  //   children: [
                  //     Card(elevation: 1, child: Text("photo.jpg")),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(Icons.cancel),
                  //       iconSize: 15,
                  //     )
                  //   ],
                  // ),
                  Card(
                      child: Row(
                    children: [
                      Text('Photo.jpg'),
                      GestureDetector(
                        child: Icon(Icons.cancel),
                      ),
                    ],
                  ),
                  ),

                  Card(
                      child: Row(
                    children: [
                      Text('flutter.jpg'),
                      GestureDetector(
                        child: Icon(Icons.cancel),
                      ),
                    ],
                  ),
                  ),
                  // Row(
                  //   children: [
                  //     Card(elevation: 1, child: Text("photo.jpg")),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(Icons.cancel),
                  //       iconSize: 15,
                  //     )
                  //   ],
                  // ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 23,
                      color: Colors.black12,
                      child: Text(
                        _changeLanguage ? 'थप्नुहोस्' : 'Add',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(_changeLanguage ? 'वर्णन' : 'Description'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
              TextFormField(
                maxLines: 6,
                minLines: 5,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                      child: FittedBox(
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back),
                              iconSize: 30,
                            ),
                            Text(
                              _changeLanguage ? 'अघिल्लो ' : 'Previous ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.14),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                      child: FittedBox(
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              iconSize: 30,
                            ),
                            Text(
                              _changeLanguage ? 'बुझाउनुहोस् ' : 'submit ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.11),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 40,
                      color: Colors.orangeAccent,
                      child: FittedBox(
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.save),
                              iconSize: 30,
                            ),
                            Text(
                              _changeLanguage ? 'ड्राफ्ट ' : 'Save as Draft ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
