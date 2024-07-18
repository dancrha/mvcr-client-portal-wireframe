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
                          "Reporting Driver's Vehicle Information",
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
                          'Please provide information about the vehicle involved in the collision.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
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
                                      TextSpan(text: "Licence Plate"),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Theme(
                                    data:
                                        ThemeData(fontFamily: 'ArchivoNarrow'),
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
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
                                SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80.0),
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
                                                text: "Vehicle Model",
                                              ),
                                              TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
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
                                SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80.0),
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
                                                text: "Vehicle Colour",
                                              ),
                                              TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
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
                                const SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80.0),
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
                                                text: "Policy Number",
                                              ),
                                              TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          "Area of Damage",
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          'Please indicate the main area of damage to your vehicle, as it corresponds to the diagram here. You must indicate where the damage/impact on your vehicle occurred, even if it is minimal. You may select more than one area.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
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
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '02 - Right Front',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '03 - Right Centre',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '04 - Right Rear',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '05 - Right Rear Corner',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '06 - Back Centre',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '07 - Left Rear Corner',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '08 - Left Rear',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
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
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '10 - Left Front',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '11 - Left Front Corner',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '12 - Front Centre',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '13 - Front Complete',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '14 - Right Side Complete',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '15 - Back Complete',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '16 - Left Side Complete',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
                                      '17 - Top (not pictured)',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'ArchivoNarrow'),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    title: Text(
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
                          ),
                          SizedBox(
                            width: 450,
                            height: 450,
                            child: Image.asset(
                              'assets/images/vehicle-damage.png',
                            ),
                          ),
                        ],
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
                                text: 'Was the vehicle towed?',
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
                      ),
                      if (_towed == 'Yes') ...{
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Row(
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
                                                  'Which company towed the vehicle?',
                                            ),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                                            TextSpan(
                                              text:
                                                  'Where was the vehicle towed?',
                                            ),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                            ),
                          ],
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
                                text: 'Was there a witness to the collision?',
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
                      ),
                      if (_witness == 'Yes') ...{
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Row(
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
                                              text: 'Witness Name',
                                            ),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                                            TextSpan(
                                              text: 'Witness Phone Number',
                                            ),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
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
                            ),
                          ],
                        ),
                      },
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
                                              const PassengersInformation(),
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
    _incidentController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
