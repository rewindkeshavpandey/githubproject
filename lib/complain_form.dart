
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ComplainForm extends StatefulWidget {
  @override
  _ComplainFormState createState() => _ComplainFormState();
}

class _ComplainFormState extends State<ComplainForm> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = true;

  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  //multiple file pick code
  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths!.first.extension);
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    });
  }

  var _changeLanguage = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,

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

              
              Builder(
                builder: (BuildContext context) => _loadingPath
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: const CircularProgressIndicator(),
                      )
                    : _directoryPath != null
                        ? ListTile(
                            title: const Text('Directory path'),
                            subtitle: Text(_directoryPath!),
                          )
                        : _paths != null
                            ? Container(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _paths != null && _paths!.isNotEmpty
                                          ? _paths!.length
                                          : 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final bool isMultiPath =
                                        _paths != null && _paths!.isNotEmpty;
                                    final String name = '' +
                                        (isMultiPath
                                            ? _paths!
                                                .map((e) => e.name)
                                                .toList()[index]
                                            : _fileName ?? '...');

                                    return Row(
                                      children: [
                                        Text(
                                          name,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 10),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.cancel, size: 10,)),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
              ),
              InkWell(
                onTap: () {
                  _openFileExplorer();
                },

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
