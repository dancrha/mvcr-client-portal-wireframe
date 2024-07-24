import 'package:flutter/material.dart';
import 'package:flutter_application_1/collision_information.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  TextEditingController _incidentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final bool _isValid = false;
  String? _hasCompletedReport;
  String? _selectedMunicipality;
  String? _400series;
  String? _vehiclesInvolved;
  String? _anyInjuries;
  String? _anyPedCycInvolved;
  String? _leaveWithoutExchanging;
  String? _driverInfo;
  String? selected;
  bool isChecked = false;

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

  void _updateButtonState() {
    setState(() {
      if (_hasCompletedReport == 'No' &&
          _selectedMunicipality != 'Other' &&
          _400series == 'No' &&
          _anyInjuries == 'No' &&
          _vehiclesInvolved == 'No' &&
          _anyPedCycInvolved == 'No' &&
          _leaveWithoutExchanging == 'No') {
        _isButtonEnabled = true;
      } else if (_hasCompletedReport == 'No' &&
          _selectedMunicipality != 'Other' &&
          _400series == 'No' &&
          _anyInjuries == 'No' &&
          _vehiclesInvolved == 'No' &&
          _anyPedCycInvolved == 'No' &&
          _leaveWithoutExchanging == 'Yes' &&
          _driverInfo == 'No') {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final Color customBlueColor = Color.fromRGBO(0, 61, 121, 1);

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: customBlueColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate; // Store the selected date
        _dateTimeController.text =
            selectedDate.toLocal().toString().split(' ')[0];
        _moreThanThreeDays = DateTime.now().difference(selectedDate).inDays > 3;
        _isButtonEnabled = true; // Enable the button if a date is selected
      });
    }
  }

  bool _moreThanThreeDays = false;

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
                          Center(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              color: const Color.fromRGBO(
                                  230, 240, 255, 1), // Blue background color
                              // border: Border.all(
                              //   color: Colors.black, // Border color
                              //   width: 1,
                              // ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20),
                              child: IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.campaign,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Please answer the following questions to determine if your collision may be reported online.',
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors
                                              .black, // Change text color to white for better contrast
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(height: 40),
                          const Text(
                            'General Information',
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
                          const SizedBox(height: 20),
                          const Text(
                            'Tell us some basic information about the collision. Please provide all answers to the best of your knowledge.',
                            style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                //fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Have you already completed a police report for this collision?'),
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
                                  groupValue: _hasCompletedReport,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _hasCompletedReport = value;
                                      _validateInput();
                                      _updateButtonState();
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
                                  groupValue: _hasCompletedReport,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _hasCompletedReport = value;
                                      _validateInput();
                                      _updateButtonState();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_hasCompletedReport == 'Yes') ...{
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'If a police report has already been filed for this collision, you do not need to complete an online report.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'In what municipality did the collision happen?'),
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 300,
                            child: DropdownButtonFormField(
                              value: _selectedMunicipality,
                              items: [
                                'Aurora',
                                'East Gwillimbury',
                                'Georgina',
                                'King Township',
                                'Newmarket',
                                'Richmond Hill',
                                'Markham',
                                'Whitchurch-Stouffville',
                                'Vaughan',
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
                                  _selectedMunicipality = newValue;
                                  _validateInput();
                                  _updateButtonState();
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
                              menuMaxHeight: 300,
                              isExpanded: true,
                            ),
                          ),
                          if (_selectedMunicipality == 'Other') ...{
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Collisions that happen outside of York Region must be reported to the police agency where the incident occurred.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(text: 'When did the collision occur?'),
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: 250,
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _dateTimeController,
                                  decoration: const InputDecoration(
                                    labelText: 'Date of Collision',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Archivo Narrow',
                                      fontSize: 14,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_moreThanThreeDays) ...{
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
                                      children: const [
                                        Icon(
                                          Icons.warning,
                                          color: Color.fromRGBO(240, 156, 0, 1),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Collision occurred outside the allowed reporting period. This submission is subject to officer discretion.',
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
                                    const SizedBox(height: 10),
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                          (Set states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Color.fromRGBO(
                                                  0, 61, 121, 1);
                                            }
                                            return null;
                                          },
                                        ),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value ?? false;
                                          });
                                        },
                                      ),
                                      title: RichText(
                                        text: const TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: 16.0,
                                            color: Colors
                                                .black, // Set default color for text
                                          ),
                                          children: [
                                            TextSpan(text: 'I understand.'),
                                            TextSpan(
                                              text: ' *',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Did your collision occur on a 400 series highway?'),
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
                                  groupValue: _400series,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _400series = value;
                                      _validateInput();
                                      _updateButtonState();
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
                                  groupValue: _400series,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _400series = value;
                                      _validateInput();
                                      _updateButtonState();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_400series == 'Yes') ...{
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Collisions that happened on a 400-series highway (400, 404, 407, 427) must be reported to the Ontario Provincial Police.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () async {
                                final Uri _url =
                                    Uri.parse('https://www.opp.ca/');
                                if (await canLaunchUrl(_url)) {
                                  await launchUrl(_url);
                                } else {
                                  throw 'Could not launch $_url';
                                }
                              },
                              child: const Text(
                                'Visit the Ontario Provincial Police website',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 61, 121, 1),
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Were there any injuries to anyone involved?'),
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
                                  groupValue: _anyInjuries,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _anyInjuries = value;
                                      _validateInput();
                                      _updateButtonState();
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
                                  groupValue: _anyInjuries,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _anyInjuries = value;
                                      _validateInput();
                                      _updateButtonState();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_anyInjuries == 'Yes') ...{
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align items to the top
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Please call 1-866-876-5423 ext.7700 to speak to a York Regional Police officer about your collision. A collision that resulted in injury cannot be reported online.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            )
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'Did the collision involve any of the following: ',
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '• Buses (School, Public, Commercial)',
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10), // Space between items
                                Text(
                                  '• Armoured Vehicle',
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10), // Space between items
                                Text(
                                  '• Large Commercial Vehicle',
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10), // Space between items
                                Text(
                                  '• Vehicle Transporting Dangerous Goods',
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10), // Space between items
                                Text(
                                  '• Any Government Vehicle (Police, Fire, Ambulance)',
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                  groupValue: _vehiclesInvolved,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _vehiclesInvolved = value;
                                      _validateInput();
                                      _updateButtonState();
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
                                  groupValue: _vehiclesInvolved,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _vehiclesInvolved = value;
                                      _validateInput();
                                      _updateButtonState();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_vehiclesInvolved == 'Yes') ...{
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align items to the top
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Please call 1-866-876-5423 ext.7700 to speak to a York Regional Police officer about your collision. A collision involving any of these vehicle types cannot be reported online.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            )
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Were any pedestrians or cyclists involved?'),
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
                                  groupValue: _anyPedCycInvolved,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _anyPedCycInvolved = value;
                                      _validateInput();
                                      _updateButtonState();
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
                                  groupValue: _anyPedCycInvolved,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _anyPedCycInvolved = value;
                                      _validateInput();
                                      _updateButtonState();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_anyPedCycInvolved == 'Yes') ...{
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align items to the top
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Please call 1-866-876-5423 ext.7700 to speak to a York Regional Police officer about your collision. A collision involving pedestrians or cyclists cannot be reported online.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            )
                          },
                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        'Did any of the people involved in the collision leave without exchanging information?'),
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
                                  groupValue: _leaveWithoutExchanging,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _leaveWithoutExchanging = value;
                                      _validateInput();
                                      _updateButtonState();
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
                                  groupValue: _leaveWithoutExchanging,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _leaveWithoutExchanging = value;
                                      _validateInput();
                                      _updateButtonState();
                                    });
                                  },
                                ),
                              ),
                              const Text('No'),
                            ],
                          ),
                          if (_leaveWithoutExchanging == 'Yes') ...{
                            const SizedBox(height: 40),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .black, // Set default color for text
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          'Do you have information about the driver who left the scene from another source (ie. Witness)?'),
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
                                    groupValue: _driverInfo,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _driverInfo = value;
                                        _validateInput();
                                        _updateButtonState();
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
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
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
                                    groupValue: _driverInfo,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _driverInfo = value;
                                        _validateInput();
                                        _updateButtonState();
                                      });
                                    },
                                  ),
                                ),
                                const Text('No'),
                              ],
                            ),
                          },
                          if (_driverInfo == 'Yes') ...{
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align items to the top
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Please call 1-866-876-5423 ext.7700 to speak to a York Regional Police officer about your collision. A collision involving an individual who failed to remain cannot be reported online.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 44, 33),
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            )
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
                                '2 / 9',
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
                                child: Tooltip(
                                  message: _isButtonEnabled
                                      ? ''
                                      : 'Your collision is ineligible for online reporting',
                                  child: TextButton(
                                    onPressed: _isButtonEnabled
                                        ? () {
                                            if (_selectedDate != null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CollisionInformation(
                                                    selectedDate:
                                                        _selectedDate!,
                                                  ),
                                                ),
                                              );
                                            }
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
