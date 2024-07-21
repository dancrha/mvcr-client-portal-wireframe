import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/drivers_vehicle_information.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class DriverInformation extends StatefulWidget {
  const DriverInformation({super.key});

  @override
  State<DriverInformation> createState() => _DriverInformationState();
}

class _DriverInformationState extends State<DriverInformation> {
  TextEditingController _incidentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isValid = true;
  String? _provinceOrState;
  String? _collisionAction;
  String? _seatbelt;
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
  double fontSize = 16.0;
  double headerFontSize = 32.0;

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

  void setFontSize(double size, double headerSize) {
    if (size > 12 && size < 20 && headerSize > 28 && headerSize < 36) {
      setState(() {
        fontSize = size;
        headerFontSize = headerSize;
      });
    }
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
                  // Adjust spacing as needed
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
                containerWidth = constraints.maxWidth;
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
                              const Text(
                                'Reporting Driver Information',
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: fontSize,
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
                              Text(
                                'Please provide information about the reporting driver.',
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 50),
                              Wrap(
                                spacing: 20,
                                runSpacing: 30,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "Last Name"),
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
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "First Name"),
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
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "Date of Birth"),
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
                                            200, // Adjust this value to change the width of the field
                                        child: GestureDetector(
                                          onTap: () => _selectDate(context),
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              controller: _dateController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelStyle: TextStyle(
                                                  fontFamily: 'Archivo Narrow',
                                                  fontSize: 14,
                                                ),
                                                prefixIcon:
                                                    Icon(Icons.calendar_today),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: isMobile ? 30 : 40),
                              Wrap(
                                spacing: 20,
                                runSpacing: 30,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "Driver's License Number"),
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
                                        width: 300,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
                                            cursorColor: const Color.fromRGBO(
                                                0, 61, 121, 1),
                                            decoration: const InputDecoration(
                                              hintText:
                                                  'Note: please do not include dashes or spaces.', // Add your hint text here
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontFamily: 'ArchivoNarrow',
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "In which province or state was this driver's licence issued?",
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
                                            width: 300,
                                            child: DropdownButtonFormField(
                                              value: _provinceOrState,
                                              items: [
                                                'Ontario',
                                                'Alberta',
                                                'British Columbia',
                                                'Manitoba',
                                                'New Brunswick',
                                                'Newfoundland and Labrador',
                                                'Northwest Territories',
                                                'Nova Scotia',
                                                'Nunavut',
                                                'Prince Edward Island',
                                                'Quebec',
                                                'Saskatchewan',
                                                'Yukon',
                                                'Alabama',
                                                'Alaska',
                                                'Arizona',
                                                'Arkansas',
                                                'California',
                                                'Colorado',
                                                'Connecticut',
                                                'Delaware',
                                                'Florida',
                                                'Georgia',
                                                'Hawaii',
                                                'Idaho',
                                                'Indiana',
                                                'Iowa',
                                                'Kansas',
                                                'Kentucky',
                                                'Louisiana',
                                                'Maine',
                                                'Maryland',
                                                'Massachusetts',
                                                'Michigan',
                                                'Minnesota',
                                                'Mississippi',
                                                'Missouri',
                                                'Montana',
                                                'Nebraska',
                                                'Nevada',
                                                'New Hampshire',
                                                'New Jersey',
                                                'New Mexico',
                                                'New York',
                                                'North Carolina',
                                                'North Dakota',
                                                'Ohio',
                                                'Oklahoma',
                                                'Oregon',
                                                'Pennsylvania',
                                                'Rhode Island',
                                                'South Carolina',
                                                'South Dakota',
                                                'Tennessee',
                                                'Texas',
                                                'US (Gov’t)',
                                                'Utah',
                                                'Vermont',
                                                'Virginia',
                                                'Washington',
                                                'West Virginia',
                                                'Wisconsin',
                                                'Wyoming',
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'ArchivoNarrow',
                                                      fontSize: fontSize,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  _provinceOrState = newValue;
                                                  _validateInput();
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          0, 61, 121, 1),
                                                      width: 2.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 10.0),
                                              ),
                                              menuMaxHeight:
                                                  300, // Set the maximum height of the dropdown menu
                                              isExpanded:
                                                  true, // Ensure the dropdown takes full width of its parent
                                            )),
                                      ]),
                                ],
                              ),
                              SizedBox(height: isMobile ? 30 : 40),
                              Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "Address"),
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
                                        width: 300,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Apt #/Unit',
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 100,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                              SizedBox(height: isMobile ? 30 : 40),
                              Wrap(
                                spacing: 20,
                                runSpacing: 30,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "City/Town"),
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
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "Province/State"),
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
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: "Postal Code/Zip Code"),
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
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                              SizedBox(height: isMobile ? 30 : 40),
                              Wrap(
                                spacing: 20,
                                runSpacing: 30,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Cell Phone Number',
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: <TextInputFormatter>[
                                              MaskedInputFormatter(
                                                  '(000) 000-0000'), // Define the phone number pattern
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Home Phone Number',
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: <TextInputFormatter>[
                                              MaskedInputFormatter(
                                                  '(000) 000-0000'), // Define the phone number pattern
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Business Phone Number',
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 200,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: <TextInputFormatter>[
                                              MaskedInputFormatter(
                                                  '(000) 000-0000'), // Define the phone number pattern
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: isMobile ? 30 : 40),
                              Wrap(
                                spacing: 20,
                                runSpacing: 30,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "Email"),
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
                                        width: 250,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "Confirm Email"),
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
                                        width: 250,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                TextStyle(fontSize: fontSize),
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
                              SizedBox(height: isMobile ? 30 : 40),
                              Text(
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                'What were you doing at the time of the collision?',
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 350,
                                child: DropdownButtonFormField(
                                  value: _collisionAction,
                                  items: [
                                    'Changing lanes',
                                    'Going ahead',
                                    'Slowing or stopping',
                                    'Making a U-turn',
                                    'Merging',
                                    'Passing or overtaking',
                                    'Parked',
                                    'Reversing',
                                    'Stopped',
                                    'Turning left',
                                    'Turning right',
                                    'Overtaking',
                                    'Pulling away from shoulder or curb',
                                    'Pulling onto shoulder or curb',
                                    'Turning right on red',
                                    'Other',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: fontSize,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _collisionAction = newValue;
                                      _validateInput();
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 61, 121, 1),
                                          width: 2.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                  ),
                                  menuMaxHeight:
                                      300, // Set the maximum height of the dropdown menu
                                  isExpanded: true,
                                ),
                              ),
                              if (_collisionAction == 'Other') ...{
                                const SizedBox(height: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      'Describe the action you were taking:',
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 400,
                                      child: Theme(
                                        data: ThemeData(
                                          fontFamily: 'ArchivoNarrow',
                                        ),
                                        child: TextFormField(
                                          controller: _incidentController,
                                          style: TextStyle(fontSize: fontSize),
                                          cursorColor: const Color.fromRGBO(
                                              0, 61, 121, 1),
                                          maxLines:
                                              null, // Allows for multiple lines
                                          minLines:
                                              4, // Sets a minimum height of 4 lines
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
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please describe the action you were taking';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              },
                              const SizedBox(height: 40),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Were you wearing a seatbelt?',
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
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return const Color.fromRGBO(
                                                0, 61, 121, 1);
                                          }
                                          return Colors.grey;
                                        }),
                                      ),
                                    ),
                                    child: Radio(
                                      value: 'Yes',
                                      groupValue: _seatbelt,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _seatbelt = value;
                                          _validateInput();
                                        });
                                      },
                                    ),
                                  ),
                                  const Text('Yes'),
                                  Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: Colors.grey,
                                      radioTheme: RadioThemeData(
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return const Color.fromRGBO(
                                                0, 61, 121, 1);
                                          }
                                          return Colors.grey;
                                        }),
                                      ),
                                    ),
                                    child: Radio(
                                      value: 'No',
                                      groupValue: _seatbelt,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _seatbelt = value;
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
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        padding: EdgeInsets.zero,
                                        backgroundColor: const Color.fromRGBO(
                                            230,
                                            240,
                                            255,
                                            1), // Light blue background
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.navigate_before,
                                            size: 22,
                                            color: Color.fromRGBO(0, 61, 121,
                                                1), // Dark blue icon
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'Back',
                                              style: TextStyle(
                                                color: Color.fromRGBO(0, 61,
                                                    121, 1), // Dark blue text
                                                fontSize: fontSize,
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
                                    '4 / 9',
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
                                                      const DriversVehicleInformation(),
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
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
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
                        ))),
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
