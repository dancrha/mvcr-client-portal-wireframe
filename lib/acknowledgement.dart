import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Acknowledgement extends StatefulWidget {
  const Acknowledgement({super.key});

  @override
  State<Acknowledgement> createState() => _AcknowledgementState();
}

class _AcknowledgementState extends State<Acknowledgement> {
  TextEditingController _dateController = TextEditingController();

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
                          "Acknowledgement",
                          style: TextStyle(
                            fontFamily: 'ArchivoNarrow',
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                      ),
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
                              '9 / 9',
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
                                                const Acknowledgement(),
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
    super.dispose();
    _dateController.dispose();
  }
}
