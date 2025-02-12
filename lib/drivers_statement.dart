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
  final _formKey = GlobalKey<FormState>();

  bool _isValid = true;
  String? _dashcamFootage;
  String? driversLicenceFileName;
  String? proofOfInsurance;
  String? damagePhotos;
  String? otherDriversDocuments;
  int _currentValue = 0; // You can set any default value
  bool _isButtonEnabled = true;
  String? _otherDriverInfo;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  void _validateInput() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 800;
    bool isDesktop = screenWidth > 800;
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
              double containerWidth = constraints.maxWidth * 0.7;

              if (constraints.maxWidth < 1200) {
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
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20.0,
                        bottom: 20,
                        left: isMobile
                            ? 10
                            : isTablet
                                ? 20
                                : 80,
                        right: isMobile
                            ? 10
                            : isTablet
                                ? 20
                                : 80,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Reporting Driver's Statement",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RichText(
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
                          const SizedBox(height: 30),
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
                                width: isMobile ? 400 : 600,
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
                          const SizedBox(height: 40),
                          const Text(
                            "Attachments",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                      'Do you have dash camera footage you would like police to review?',
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.grey,
                                  radioTheme: RadioThemeData(
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
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
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
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
                          if (_dashcamFootage == 'Yes') ...{
                            const SizedBox(height: 20),
                            IntrinsicWidth(
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                      255, 240, 240, 240), // Light orange color
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.campaign,
                                            color: Colors.grey.shade700,
                                            size: 34),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Expanded(
                                          child: Text(
                                            'If it is deemed that video is necessary, an officer will connect with you with instructions on how to upload your video.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'ArchivoNarrow',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          },
                          const SizedBox(height: 40),
                          const Text(
                            "File Uploads",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              style:
                                                  TextStyle(color: Colors.red),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                      fontFamily:
                                                          'ArchivoNarrow',
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
                            ],
                          ),
                          const SizedBox(height: 40),
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
                          const SizedBox(height: 40),
                          Column(
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
                                          damagePhotos =
                                              result.files.single.name;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(0, 61, 121, 1),
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
                          const SizedBox(height: 40),
                          Column(
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
                                      FilePickerResult? result =
                                          await FilePicker.platform
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
                          const SizedBox(height: 40),
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
                                      "Do you have the other driver's information?",
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.grey,
                                  radioTheme: RadioThemeData(
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
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
                                  groupValue: _otherDriverInfo,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _otherDriverInfo = value;
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
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
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
                                  groupValue: _otherDriverInfo,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _otherDriverInfo = value;
                                      _validateInput();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          const SizedBox(height: 80),
                          Row(
                            children: [
                              Container(
                                width: 110,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    padding: EdgeInsets.zero,
                                    backgroundColor: const Color.fromRGBO(230,
                                        240, 255, 1), // Light blue background
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.navigate_before,
                                        size: 22,
                                        color: Color.fromRGBO(
                                            0, 61, 121, 1), // Dark blue icon
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Back',
                                          style: TextStyle(
                                            color: Color.fromRGBO(0, 61, 121,
                                                1), // Dark blue text
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                '7 / 9',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'ArchivoNarrow',
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 130,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: _isButtonEnabled
                                      ? () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  _otherDriverInfo == 'Yes'
                                                      ? const OtherDriversInformation()
                                                      : const Acknowledgement(),
                                            ),
                                          );
                                        }
                                      : null,
                                  style: TextButton.styleFrom(
                                    backgroundColor: _isButtonEnabled
                                        ? const Color.fromRGBO(0, 61, 121,
                                            1) // Keep the blue color
                                        : Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontFamily: 'ArchivoNarrow',
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.navigate_next,
                                        size: 22,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
