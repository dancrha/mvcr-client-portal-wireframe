import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Acknowledgement extends StatefulWidget {
  const Acknowledgement({super.key});

  @override
  State<Acknowledgement> createState() => _AcknowledgementState();
}

class _AcknowledgementState extends State<Acknowledgement> {
  TextEditingController _dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isValid = true;
  String? _dashcamFootage;
  String? driversLicenceFileName;
  String? proofOfInsurance;
  String? damagePhotos;
  String? _provinceOrState;
  String? otherDriversDocuments;
  String? otherDriversInformation;
  String? countryIssued;
  String? countryResidence;
  int _currentValue = 0; // You can set any default value
  bool _isButtonEnabled = true;

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _dateController.addListener(_validateInput);
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
                          const Text(
                            "Acknowledgement",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Please read and check to indicate you understand before submitting your request for a report:\n',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 17.0,
                            ),
                          ),
                          const Text(
                            '• I understand that prior to being issued a collision report number, I may receive a callback from a York Regional Police officer with follow-up questions to confirm accuracy and/or to ensure the legal requirements for self-reporting have been met.\n\n'
                            '• I understand that it is a crime in Canada to lie to the police or mislead them in an investigation. It is also a crime in Canada to falsely accuse another person of committing a crime.\n\n'
                            '• I understand that if my incident involves a criminal or provincial offence, the information submitted herein may be used as evidence in court.\n\n'
                            '• I understand that police are not responsible for determining driver fault, and that according to Ontario Regulation 668 under the Insurance Act, Fault Determination Rules allow insurance companies to decide which driver is at fault, and to what degree.\n',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontSize: 17.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '• By checking this box, I hereby certify that, to the best of my knowledge, the provided information is true and accurate.',
                            style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Checkbox(
                              fillColor: MaterialStateProperty.resolveWith(
                                (Set states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color.fromRGBO(0, 61, 121, 1);
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
                            title: const Text(
                              'Yes, I understand',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontFamily: 'ArchivoNarrow'),
                            ),
                          ),
                          const SizedBox(height: 40),
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
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                            fontSize: 17.0,
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
                                '9 / 9',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'ArchivoNarrow',
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 170,
                                height: 50,
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
                                                  const Acknowledgement(),
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
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.done,
                                        size: 23,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Text(
                                          'Submit Form',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontFamily: 'ArchivoNarrow',
                                          ),
                                        ),
                                      ),
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
    super.dispose();
    _dateController.dispose();
  }
}
