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
                          'General Information',
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
                          'Please answer the following questions to determine if your collision may be reported online.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          'Tell us some basic information about the collision. Please provide all answers to the best of your knowledge.',
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            //fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      if (_hasCompletedReport == 'Yes')
                        Padding(
                            padding: const EdgeInsets.only(left: 80.0, top: 20),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'If a police report has already been filed for this collision, you do not need to complete an online report.',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 190, 44, 33),
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
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
                            menuMaxHeight: 300,
                            isExpanded: true,
                          ),
                        ),
                      ),
                      if (_selectedMunicipality == 'Other') ...{
                        Padding(
                            padding: const EdgeInsets.only(left: 80.0, top: 20),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 190, 44, 33),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Collisions that happen outside of York Region must be reported to the police agency where the incident occurred.',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 190, 44, 33),
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      },
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: _dateController,
                                      decoration: const InputDecoration(
                                        labelText: 'Date of Collision',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontFamily: 'Archivo Narrow',
                                          fontSize: 14,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.calendar_today,
                                        ), // Added calendar icon
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _selectTime(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: _timeController,
                                      style: const TextStyle(
                                        fontFamily: 'Archivo Narrow',
                                        fontSize: 16,
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Time of Collision',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontFamily: 'Archivo Narrow',
                                          fontSize: 14,
                                        ),
                                        prefixIcon: Icon(Icons
                                            .access_time), // Added time icon
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
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
                      ),
                      if (_400series == 'Yes') ...{
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0, top: 20),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.report,
                                color: Color.fromARGB(255, 190, 44, 33),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Collisions that happened on a 400-series highway (400, 404, 407, 427) must be reported to the Ontario Provincial Police.',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 190, 44, 33),
                                  fontFamily: 'ArchivoNarrow',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80.0),
                          child: GestureDetector(
                            onTap: () async {
                              final Uri _url = Uri.parse('https://www.opp.ca/');
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
                          ),
                        )
                      },
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      if (_anyInjuries == 'Yes') ...{
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 80.0, right: 80.0, top: 20),
                          child: Row(
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
                          ),
                        )
                      },
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                        'Did the collision involve any of the following: ',
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Add extra space between the question and the list
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0), // Add margin to the list items
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
                      ),
                      if (_vehiclesInvolved == 'Yes') ...{
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 80.0, right: 80.0, top: 20),
                          child: Row(
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
                          ),
                        )
                      },
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      if (_anyPedCycInvolved == 'Yes') ...{
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 80.0, right: 80.0, top: 20),
                          child: Row(
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
                          ),
                        )
                      },
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set default color for text
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
                      ),
                      if (_leaveWithoutExchanging == 'Yes') ...{
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: RichText(
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
                                        'Do you have information about the driver who left the scene from another source (ie. Witness)?'),
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
                        ),
                      },
                      if (_driverInfo == 'Yes') ...{
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 80.0, right: 80.0, top: 20),
                          child: Row(
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
                          ),
                        )
                      },
                      const SizedBox(height: 80),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 40, bottom: 20),
                            child: Container(
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
                                          color: Color.fromRGBO(
                                              0, 61, 121, 1), // Dark blue text
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
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              '2 / 8',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'ArchivoNarrow',
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 40, bottom: 20),
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
                                                const CollisionInformation(),
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
