import 'package:flutter/material.dart';
import 'package:flutter_application_1/collision_information.dart';
import 'package:flutter_application_1/drivers_statement.dart';
import 'package:flutter_application_1/general_information.dart';
import 'package:flutter_application_1/other_drivers_information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MVCR Online Form',
      home: MyHomePage(title: ''),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/images/logo-yrp.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth * 0.5;

            if (constraints.maxWidth < 1000) {
              containerWidth =
                  constraints.maxWidth; // Snap to screen width if less than 600
            }

            return Center(
              child: SingleChildScrollView(
                child: Container(
                  width: containerWidth,
                  padding: const EdgeInsets.all(20.0),
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
                          'Welcome',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 42.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          'Motor Vehicle Collision Report Online Form',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 80.0, right: 80.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Text(
                              'Please enter the incident number you received from York Regional Police.\n\nIf you do not have an incident number please call the non-emergency line at XXX-XXX-XXXX.',
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
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
                      ),
                      const SizedBox(height: 90),
                      Padding(
                          padding: const EdgeInsets.only(right: 40, bottom: 20),
                          child: Align(
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
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _incidentController.dispose();
    super.dispose();
  }
}
