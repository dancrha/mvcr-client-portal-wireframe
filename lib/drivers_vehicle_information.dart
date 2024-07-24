import 'package:flutter/material.dart';
import 'package:flutter_application_1/passengers_information.dart';
import 'package:numberpicker/numberpicker.dart';

class DriversVehicleInformation extends StatefulWidget {
  const DriversVehicleInformation({super.key});

  @override
  State<DriversVehicleInformation> createState() =>
      _DriversVehicleInformationState();
}

class _DriversVehicleInformationState extends State<DriversVehicleInformation> {
  TextEditingController _incidentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isValid = true;
  String? _provinceOrState;
  String? _collisionAction;
  String? _towed;
  String? _witness;
  String? _passengers;
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
  bool _isButtonEnabled = true;

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

  bool vehicleDamage01 = false;
  bool vehicleDamage02 = false;
  bool vehicleDamage03 = false;
  bool vehicleDamage04 = false;
  bool vehicleDamage05 = false;
  bool vehicleDamage06 = false;
  bool vehicleDamage07 = false;
  bool vehicleDamage08 = false;
  bool vehicleDamage09 = false;
  bool vehicleDamage10 = false;
  bool vehicleDamage11 = false;
  bool vehicleDamage12 = false;
  bool vehicleDamage13 = false;
  bool vehicleDamage14 = false;
  bool vehicleDamage15 = false;
  bool vehicleDamage16 = false;
  bool vehicleDamage17 = false;
  bool vehicleDamage18 = false;

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
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(0, 61, 121, 1), // header background color
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
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth = constraints.maxWidth * 0.8;

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
                            "Reporting Driver's Vehicle Information",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: 16.0,
                                  color: Colors
                                      .black, // Set default color for text
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
                          const SizedBox(height: 20),
                          const Text(
                            'Please provide information about the vehicle involved in the collision.',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              Column(
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
                                            TextSpan(text: "Licence Plate"),
                                            TextSpan(
                                              text: ' *',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 170,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 16.0),
                                            cursorColor: const Color.fromRGBO(
                                                0, 61, 121, 1),
                                            decoration: const InputDecoration(
                                              hintText: 'e.g. ABCD1234',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
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
                                        TextSpan(text: "Insurance Provider"),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 170,
                                    child: Theme(
                                      data: ThemeData(
                                          fontFamily: 'ArchivoNarrow'),
                                      child: TextFormField(
                                        style: const TextStyle(fontSize: 16.0),
                                        cursorColor:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(0, 61, 121, 1),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                            text: "Policy Number",
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
                                      width: 170,
                                      child: Theme(
                                        data: ThemeData(
                                            fontFamily: 'ArchivoNarrow'),
                                        child: TextFormField(
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
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
                                  ]),
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 40),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
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
                                        TextSpan(text: "Vehicle Make"),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 170,
                                    child: Theme(
                                      data: ThemeData(
                                          fontFamily: 'ArchivoNarrow'),
                                      child: TextFormField(
                                        style: const TextStyle(fontSize: 16.0),
                                        cursorColor:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        decoration: const InputDecoration(
                                          hintText: 'e.g. Toyota',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(0, 61, 121, 1),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                            text: "Vehicle Model",
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
                                      width: 170,
                                      child: Theme(
                                        data: ThemeData(
                                            fontFamily: 'ArchivoNarrow'),
                                        child: TextFormField(
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          decoration: const InputDecoration(
                                            hintText: 'e.g. Corolla',
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
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
                                  ]),
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
                                        TextSpan(text: "Vehicle Year"),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 170,
                                    child: Theme(
                                      data: ThemeData(
                                          fontFamily: 'ArchivoNarrow'),
                                      child: TextFormField(
                                        style: const TextStyle(fontSize: 16.0),
                                        cursorColor:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        decoration: const InputDecoration(
                                          hintText: 'e.g. 2014',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(0, 61, 121, 1),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                            text: "Vehicle Colour",
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
                                      width: 170,
                                      child: Theme(
                                        data: ThemeData(
                                            fontFamily: 'ArchivoNarrow'),
                                        child: TextFormField(
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          decoration: const InputDecoration(
                                            hintText: 'e.g. White',
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
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
                                  ]),
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 40),
                          const Text(
                            "Area of Damage",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Please indicate the main area of damage to your vehicle, as it corresponds to the diagram here. You must indicate where the damage/impact on your vehicle occurred, even if it is minimal. You may select more than one area.',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                    TextSpan(text: "Vehicle Damage"),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            children: [
                              SizedBox(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage01,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage01 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '01 - Right Front Corner',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage02,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage02 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '02 - Right Front',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage03,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage03 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '03 - Right Centre',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage04,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage04 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '04 - Right Rear',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage05,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage05 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '05 - Right Rear Corner',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage06,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage06 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '06 - Back Centre',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage07,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage07 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '07 - Left Rear Corner',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage08,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage08 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '08 - Left Rear',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage09,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage09 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '09 - Left Centre',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage10,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage10 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '10 - Left Front',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage11,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage11 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '11 - Left Front Corner',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage12,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage12 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '12 - Front Centre',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage13,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage13 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '13 - Front Complete',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage14,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage14 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '14 - Right Side Complete',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage15,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage15 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '15 - Back Complete',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage16,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage16 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '16 - Left Side Complete',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage17,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage17 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '17 - Top (not pictured)',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return const Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: vehicleDamage18,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            vehicleDamage18 = value ?? false;
                                          });
                                        },
                                      ),
                                      title: const Text(
                                        '18 - Undercarriage (not pictured)',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'ArchivoNarrow'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 235,
                                height: 380,
                                child: Image.asset(
                                  'assets/images/vehicle-damage.png',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
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
                                  text: 'Was the vehicle towed?',
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
                                        return const Color.fromRGBO(
                                            0, 61, 121, 1);
                                      }
                                      return Colors.grey;
                                    }),
                                  ),
                                ),
                                child: Radio(
                                  value: 'Yes',
                                  groupValue: _towed,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _towed = value;
                                      _validateInput();
                                    });
                                  },
                                ),
                              ),
                              const Text('Yes'),
                              const SizedBox(width: 30),
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.grey,
                                  radioTheme: RadioThemeData(
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return const Color.fromRGBO(
                                            0, 61, 121, 1);
                                      }
                                      return Colors.grey;
                                    }),
                                  ),
                                ),
                                child: Radio(
                                  value: 'No',
                                  groupValue: _towed,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _towed = value;
                                      _validateInput();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_towed == 'Yes') ...{
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 20,
                                  runSpacing: 20,
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
                                                    'Which company towed the vehicle?',
                                              ),
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
                                          width: 200,
                                          child: Theme(
                                            data: ThemeData(
                                                fontFamily: 'ArchivoNarrow'),
                                            child: TextFormField(
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                              cursorColor: const Color.fromRGBO(
                                                  0, 61, 121, 1),
                                              decoration: const InputDecoration(
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
                                                    'Where was the vehicle towed?',
                                              ),
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
                                          width: 200,
                                          child: Theme(
                                            data: ThemeData(
                                                fontFamily: 'ArchivoNarrow'),
                                            child: TextFormField(
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                              cursorColor: const Color.fromRGBO(
                                                  0, 61, 121, 1),
                                              decoration: const InputDecoration(
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
                              ],
                            ),
                          },
                          const SizedBox(height: 30),
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
                                  text: 'Was there a witness to the collision?',
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
                                        return const Color.fromRGBO(
                                            0, 61, 121, 1);
                                      }
                                      return Colors.grey;
                                    }),
                                  ),
                                ),
                                child: Radio(
                                  value: 'Yes',
                                  groupValue: _witness,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _witness = value;
                                      _validateInput();
                                    });
                                  },
                                ),
                              ),
                              const Text('Yes'),
                              const SizedBox(width: 30),
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.grey,
                                  radioTheme: RadioThemeData(
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return const Color.fromRGBO(
                                            0, 61, 121, 1);
                                      }
                                      return Colors.grey;
                                    }),
                                  ),
                                ),
                                child: Radio(
                                  value: 'No',
                                  groupValue: _witness,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _witness = value;
                                      _validateInput();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_witness == 'Yes') ...{
                            const SizedBox(height: 30),
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
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
                                            text: 'Witness Name',
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
                                      width: 200,
                                      child: Theme(
                                        data: ThemeData(
                                            fontFamily: 'ArchivoNarrow'),
                                        child: TextFormField(
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
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
                                      'Witness Phone Number',
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 200,
                                      child: Theme(
                                        data: ThemeData(
                                            fontFamily: 'ArchivoNarrow'),
                                        child: TextFormField(
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
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
                                      'Witness Email',
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 200,
                                      child: Theme(
                                        data: ThemeData(
                                            fontFamily: 'ArchivoNarrow'),
                                        child: TextFormField(
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
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
                          },
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
                                '5 / 9',
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
                                                  const PassengersInformation(),
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
    _incidentController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
