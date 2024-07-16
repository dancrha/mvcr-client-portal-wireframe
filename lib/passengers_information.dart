import 'package:flutter/material.dart';
import 'package:flutter_application_1/drivers_statement.dart';
import 'package:numberpicker/numberpicker.dart';

class PassengersInformation extends StatefulWidget {
  const PassengersInformation({super.key});

  @override
  State<PassengersInformation> createState() => _PassengersInformationState();
}

class _PassengersInformationState extends State<PassengersInformation> {
  bool _isValid = true;

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
                          "Passenger(s) Information",
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
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          'Please provide the names and phone numbers of any passengers in the vehicle at the time of the collision.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                        'How many passengers were in the vehicle?',
                                  ),
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                              height:
                                  20), // Add some space between the text and the number picker
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_currentValue > 1) _currentValue--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                Container(
                                    width: 50,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey, // Border color
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          5.0), // Optional: Border radius
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$_currentValue',
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (_currentValue < 8) _currentValue++;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                  borderRadius: BorderRadius.circular(
                                      5.0), // Optional: Rounded corners for the ripple effect
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          for (int i = 0; i < _currentValue; i++)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80.0),
                                  child: Text(
                                    "Passenger ${i + 1}:",
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                TextSpan(text: "Last Name"),
                                                TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            child: Theme(
                                              data: ThemeData(
                                                  fontFamily: 'ArchivoNarrow'),
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                cursorColor:
                                                    const Color.fromRGBO(
                                                        0, 61, 121, 1),
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          0, 61, 121, 1),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          width:
                                              20), // Adjust this value to control the space between fields
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
                                                TextSpan(text: "First Name"),
                                                TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            child: Theme(
                                              data: ThemeData(
                                                  fontFamily: 'ArchivoNarrow'),
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                cursorColor:
                                                    const Color.fromRGBO(
                                                        0, 61, 121, 1),
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          0, 61, 121, 1),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          width:
                                              20), // Adjust this value to control the space between fields
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
                                                TextSpan(text: "Phone Number"),
                                                TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            child: Theme(
                                              data: ThemeData(
                                                  fontFamily: 'ArchivoNarrow'),
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                cursorColor:
                                                    const Color.fromRGBO(
                                                        0, 61, 121, 1),
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          0, 61, 121, 1),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                                          builder: (context) =>
                                              const DriversStatement(),
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
