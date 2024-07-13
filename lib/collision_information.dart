import 'package:flutter/material.dart';
import 'package:flutter_application_1/driver_information.dart';
import 'package:numberpicker/numberpicker.dart';

class CollisionInformation extends StatefulWidget {
  const CollisionInformation({super.key});

  @override
  State<CollisionInformation> createState() => _CollisionInformationState();
}

class _CollisionInformationState extends State<CollisionInformation> {
  TextEditingController _incidentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  bool _isValid = true;
  String? _roadSurface;
  String? _roadCondition;
  String? _weather;
  String? _roadAlignment;
  String? _pavementMarkings;
  String? _direction;
  String? _propertyDamage;
  String? _vehicleParked;
  String? _vehiclesInvolved;
  String? _anyInjuries;
  String? _anyPedCycInvolved;
  String? _leaveWithoutExchanging;
  String? _driverInfo;
  int _currentValue = 1; // You can set any default value

  @override
  void initState() {
    super.initState();
    _incidentController.addListener(_validateInput);
    _dateController.addListener(_validateInput);
    _timeController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color.fromRGBO(
                  0, 61, 121, 1), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: const Color.fromRGBO(0, 61, 121, 1), // body text color
            ),
            dialogBackgroundColor:
                Colors.white, // background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color.fromRGBO(
                  0, 61, 121, 1), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: const Color.fromRGBO(0, 61, 121, 1), // body text color
            ),
            dialogBackgroundColor:
                Colors.white, // background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
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
              double containerWidth = constraints.maxWidth * 0.7;

              if (constraints.maxWidth < 600) {
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
                          'Collision Information',
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
                          'Tell us some more specific details about the collision. Please provide all answers to the best of your knowledge.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // This aligns children to the start (left) of the column
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
                                        'Including your own, how many vehicles were involved in the collision?',
                                  ),
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
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
                                  child: Text(
                                    '$_currentValue',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(width: 10),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      if (_currentValue < 8) _currentValue++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                                    'Describe the weather at the time of the collision:',
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
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField(
                              value: _weather,
                              items: [
                                'Clear',
                                'Fog/Dust/Smoke',
                                'Rain',
                                'Freezing Rain/Hail',
                                'Snow',
                                'Drifting/Blowing Snow',
                                'Strong Winds',
                                'Glare',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _weather = newValue;
                                  _validateInput();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 61, 121, 1),
                                      width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
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
                                    'What was the condition of the road at the time of the collision?',
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
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField(
                              value: _roadCondition,
                              items: [
                                'Good',
                                'Poor',
                                'Under Repair or Construction',
                                'Other (recommended)',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _roadCondition = newValue;
                                  _validateInput();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 61, 121, 1),
                                      width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
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
                                    'What was the road surface at the location of the collision?',
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
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField(
                              value: _roadSurface,
                              items: [
                                'Asphalt', // Default value
                                'Oil Treated Gravel',
                                'Gravel or Crushed Stone',
                                'Concrete',
                                'Earth',
                                'Wood',
                                'Steel',
                                'Brick/Interlocking Stone',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _roadSurface = newValue;
                                  _validateInput();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 61, 121, 1),
                                      width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
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
                                    'What best describes the roadway (road alignment) where the accident happened?',
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
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField(
                              value: _roadAlignment,
                              items: [
                                'Straight on level',
                                'Straight on hill',
                                'Curve on level',
                                'Curve on hill',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _roadAlignment = newValue;
                                  _validateInput();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 61, 121, 1),
                                      width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
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
                                    'Were there road pavement markings where the accident occurred?',
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
                                groupValue: _pavementMarkings,
                                onChanged: (String? value) {
                                  setState(() {
                                    _pavementMarkings = value;
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
                                groupValue: _pavementMarkings,
                                onChanged: (String? value) {
                                  setState(() {
                                    _pavementMarkings = value;
                                    _validateInput();
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
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
                                    'What direction was your vehicle facing at the time of the collision?',
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
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField(
                              value: _direction,
                              items: [
                                'North',
                                'East',
                                'South',
                                'West',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _direction = newValue;
                                  _validateInput();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 61, 121, 1),
                                      width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
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
                                text: 'Is there damage to any other property?',
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
                                groupValue: _propertyDamage,
                                onChanged: (String? value) {
                                  setState(() {
                                    _propertyDamage = value;
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
                                groupValue: _propertyDamage,
                                onChanged: (String? value) {
                                  setState(() {
                                    _propertyDamage = value;
                                    _validateInput();
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                      if (_propertyDamage == 'Yes') ...{
                        const SizedBox(height: 30),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 80.0, right: 80.0),
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
                                          'Describe the damage caused to property:',
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
                                    controller: _incidentController,
                                    style: const TextStyle(fontSize: 16.0),
                                    cursorColor: Color.fromRGBO(0, 61, 121, 1),
                                    maxLines: null, // Allows for multiple lines
                                    minLines:
                                        4, // Sets a minimum height of 4 lines
                                    decoration: InputDecoration(
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
                      },
                      const SizedBox(height: 30),
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
                                    'Was your vehicle parked at the time of the collision?',
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
                                groupValue: _vehicleParked,
                                onChanged: (String? value) {
                                  setState(() {
                                    _vehicleParked = value;
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
                                groupValue: _vehicleParked,
                                onChanged: (String? value) {
                                  setState(() {
                                    _vehicleParked = value;
                                    _validateInput();
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
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
                                              const DriverInformation(),
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
    _incidentController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
