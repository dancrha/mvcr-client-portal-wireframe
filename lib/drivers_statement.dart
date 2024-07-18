import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/acknowledgement.dart';
import 'package:flutter_application_1/other_drivers_information.dart';

class DriversStatement extends StatefulWidget {
  const DriversStatement({super.key});

  @override
  State<DriversStatement> createState() => _DriversStatementState();
}

class _DriversStatementState extends State<DriversStatement> {
  bool _isValid = true;
  String? _dashcamFootage;
  String? driversLicenceFileName;
  String? proofOfInsurance;
  String? damagePhotos;
  String? otherDriversDocuments;
  int _currentValue = 0; // You can set any default value

  @override
  void initState() {
    super.initState();
  }

  void _validateInput() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Container(
            width: double.infinity,
            height: 90.0,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 61, 121, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/images/logo-yrp.png',
                    ),
                  ),
                  const SizedBox(width: 20), // Adjust spacing as needed
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth = constraints.maxWidth * 0.6;

              if (constraints.maxWidth < 1100) {
                containerWidth = constraints
                    .maxWidth; // Snap to screen width if less than 600
              }

              return Center(
                child: Container(
                  width: containerWidth,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          "Reporting Driver's Statement",
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Required fields are marked with asterisks ('),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red),
                                ),
                                TextSpan(text: ')'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'In as much detail as possible, tell us what happened:',
                                  ),
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Theme(
                                data: ThemeData(
                                  fontFamily: 'ArchivoNarrow',
                                ),
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 16.0),
                                  cursorColor:
                                      const Color.fromRGBO(0, 61, 121, 1),
                                  maxLines: null, // Allows for multiple lines
                                  minLines:
                                      4, // Sets a minimum height of 4 lines
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a description of the damage';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          "Attachments",
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Do you have dash camera footage you would like police to review?',
                              ),
                              TextSpan(
                                text: ' *',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.grey,
                                radioTheme: RadioThemeData(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color.fromRGBO(0, 61, 121, 1);
                                    }
                                    return Colors.grey;
                                  }),
                                ),
                              ),
                              child: Radio(
                                value: 'Yes',
                                groupValue: _dashcamFootage,
                                onChanged: (String? value) {
                                  setState(() {
                                    _dashcamFootage = value;
                                    _validateInput();
                                  });
                                },
                              ),
                            ),
                            const Text('Yes'),
                            const SizedBox(width: 20),
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.grey,
                                radioTheme: RadioThemeData(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color.fromRGBO(0, 61, 121, 1);
                                    }
                                    return Colors.grey;
                                  }),
                                ),
                              ),
                              child: Radio(
                                value: 'No',
                                groupValue: _dashcamFootage,
                                onChanged: (String? value) {
                                  setState(() {
                                    _dashcamFootage = value;
                                    _validateInput();
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          "File Uploads",
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "Your Driver's Licence Front"),
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            final FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              setState(() {
                                                driversLicenceFileName =
                                                    result.files.single.name;
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    0, 61, 121, 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            child: Row(
                                              mainAxisSize: MainAxisSize
                                                  .min, // To wrap the content of the button
                                              children: const [
                                                Icon(Icons.upload_sharp,
                                                    color: Colors.white),
                                                SizedBox(width: 5),
                                                Text(
                                                  'Upload File',
                                                  style: TextStyle(
                                                    fontFamily: 'ArchivoNarrow',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (driversLicenceFileName != null) ...{
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            '$driversLicenceFileName',
                                            style: const TextStyle(
                                              fontFamily: 'ArchivoNarrow',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.clear_rounded))
                                        ],
                                      )
                                    },
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Proof of Your Insurance',
                                  ),
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      setState(() {
                                        proofOfInsurance =
                                            result.files.single.name;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(0, 61, 121, 1),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // To wrap the content of the button
                                      children: const [
                                        Icon(Icons.upload_sharp,
                                            color: Colors.white),
                                        SizedBox(width: 5),
                                        Text(
                                          'Upload File',
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (proofOfInsurance != null) ...{
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    '$proofOfInsurance',
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.clear_rounded))
                                ],
                              )
                            },
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              'Photos of damage or other related images',
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      setState(() {
                                        damagePhotos = result.files.single.name;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(0, 61, 121, 1),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // To wrap the content of the button
                                      children: const [
                                        Icon(Icons.upload_sharp,
                                            color: Colors.white),
                                        SizedBox(width: 5),
                                        Text(
                                          'Upload File',
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (damagePhotos != null) ...{
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(
                                    '$damagePhotos',
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.clear_rounded))
                                ],
                              )
                            },
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              "Photos of other drivers' documents",
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    FilePickerResult? result = await FilePicker
                                        .platform
                                        .pickFiles(allowMultiple: true);
                                    if (result != null) {
                                      List<File> files = result.paths
                                          .map((path) => File(path!))
                                          .toList();
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(0, 61, 121, 1),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // To wrap the content of the button
                                      children: const [
                                        Icon(Icons.upload_sharp,
                                            color: Colors.white),
                                        SizedBox(width: 5),
                                        Text(
                                          'Upload File',
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (otherDriversDocuments != null) ...{
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(
                                    '$otherDriversDocuments',
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.clear_rounded))
                                ],
                              )
                            },
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, bottom: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 120,
                            height: 45,
                            child: TextButton(
                              onPressed: _isValid
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Acknowledgement(),
                                        ),
                                      );
                                    }
                                  : null,
                              style: TextButton.styleFrom(
                                backgroundColor: _isValid
                                    ? const Color.fromRGBO(0, 61, 121, 1)
                                    : Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                padding:
                                    EdgeInsets.zero, // Remove default padding
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center row contents
                                  children: const [
                                    Text(
                                      'Continue',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                        fontFamily: 'ArchivoNarrow',
                                      ),
                                    ),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 26,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
