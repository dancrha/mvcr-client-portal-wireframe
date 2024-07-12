import 'package:flutter/material.dart';
import 'package:flutter_application_1/general_information.dart';

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
  bool _isValid = false;

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
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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

          if (constraints.maxWidth < 600) {
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
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Motor Vehicle Collision Report Online Form',
                        style: TextStyle(
                          fontFamily: 'ArchivoNarrow',
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          'Please enter the incident number you received from York Regional Police. If you do not have an incident number please call the non-emergency line at XXX-XXX-XXXX.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Theme(
                          data: ThemeData(
                            fontFamily: 'ArchivoNarrow',
                          ),
                          child: TextFormField(
                            controller: _incidentController,
                            style: const TextStyle(fontSize: 16.0),
                            decoration: const InputDecoration(
                              labelText: 'Incident #',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 150,
                          height: 40,
                          child: TextButton(
                            onPressed: _isValid
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NextPage(),
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
                              padding: const EdgeInsets.all(15.0),
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: 'ArchivoNarrow',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _incidentController.dispose();
    super.dispose();
  }
}
