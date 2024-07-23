import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/acknowledgement.dart';
import 'package:flutter_application_1/collision_information.dart';
import 'package:flutter_application_1/driver_information.dart';
import 'package:flutter_application_1/drivers_statement.dart';
import 'package:flutter_application_1/drivers_vehicle_information.dart';
import 'package:flutter_application_1/general_information.dart';
import 'package:flutter_application_1/other_drivers_information.dart';
import 'package:flutter_application_1/passengers_information.dart';
import 'package:flutter_application_1/font_size_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<FontSizeProvider>(
      create: (context) => FontSizeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MVCR Online Form',
      home: MyHomePage(
        title: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _incidentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isValid = true;
  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _incidentController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isValid = _incidentController.text.isNotEmpty;
    });
  }

  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const Text(
                  'You will lose all progress/data entered in the form. Are you sure you want to leave?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Leave'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 800;
    bool isDesktop = screenWidth > 800;
    return Consumer<FontSizeProvider>(
        builder: (context, fontSizeProvider, child) {
      return WillPopScope(
        onWillPop: () async {
          bool shouldLeave = await _showExitConfirmationDialog();
          return shouldLeave;
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90.0),
            child: Container(
              width: double.infinity,
              height: 90.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 61, 121, 1),
              ),
              child: Row(
                children: [
                  Padding(
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
                ],
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth = constraints.maxWidth * 0.6;

              if (constraints.maxWidth < 1200) {
                containerWidth = constraints
                    .maxWidth; // Snap to screen width if less than 600
              }

              return Center(
                child: SingleChildScrollView(
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
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 42.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Motor Vehicle Collision Report - Online Form',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                'Please enter the incident number you received from York Regional Police.\n\nIf you do not have an incident number please call the non-emergency line at XXX-XXX-XXXX.',
                                style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: SizedBox(
                              width: 300,
                              child: Theme(
                                data: ThemeData(
                                  fontFamily: 'ArchivoNarrow',
                                ),
                                child: TextFormField(
                                  controller: _incidentController,
                                  style: const TextStyle(fontSize: 16.0),
                                  cursorColor: const Color.fromRGBO(0, 61, 121,
                                      1), // Set cursor color to dark blue
                                  decoration: const InputDecoration(
                                    labelText: 'Incident Number',
                                    floatingLabelStyle: TextStyle(
                                      color: Color.fromRGBO(0, 61, 121, 1),
                                    ),
                                    hintText: 'e.g. 2024-123456',
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 90),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
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
                                                const GeneralInformation(),
                                          ),
                                        );
                                      }
                                    : null,
                                style: TextButton.styleFrom(
                                  backgroundColor: _isButtonEnabled
                                      ? const Color.fromRGBO(
                                          0, 61, 121, 1) // Keep the blue color
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _incidentController.dispose();
    super.dispose();
  }
}
