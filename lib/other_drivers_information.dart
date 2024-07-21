import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/acknowledgement.dart';

class OtherDriversInformation extends StatefulWidget {
  const OtherDriversInformation({super.key});

  @override
  State<OtherDriversInformation> createState() =>
      _OtherDriversInformationState();
}

class _OtherDriversInformationState extends State<OtherDriversInformation> {
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
                          const Text(
                            "Other Driver's Information",
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
                            'Please provide other details of additional drivers involved in the collision. These details are necessary to complete the report and without them, processing will be delayed. ',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                alignment: WrapAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Last Name',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'First Name',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Date of Birth',
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
                              )
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 50),
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
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        "Driver's Licence Number",
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 300,
                                        child: Theme(
                                          data: ThemeData(
                                              fontFamily: 'ArchivoNarrow'),
                                          child: TextFormField(
                                            style:
                                                const TextStyle(fontSize: 16.0),
                                            cursorColor: const Color.fromRGBO(
                                                0, 61, 121, 1),
                                            decoration: const InputDecoration(
                                              hintText:
                                                  'Note: Please do not include dashes or spaces.',
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
                                  if (isMobile) const SizedBox(height: 30),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          "In which province or state was this driver's licence issued?",
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
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'ArchivoNarrow',
                                                      fontSize: 16.0,
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
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          0, 61, 121, 1),
                                                      width: 2.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
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
                            ],
                          ),
                          SizedBox(height: isMobile ? 30 : 50),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.start,
                            children: [
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
                                      "In which country was the driver's licence issued?",
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                        width: 300,
                                        child: DropdownButtonFormField(
                                          value: countryIssued,
                                          items: [
                                            'Afghanistan',
                                            'Albania',
                                            'Algeria',
                                            'Andorra',
                                            'Angola',
                                            'Antigua and Barbuda',
                                            'Argentina',
                                            'Armenia',
                                            'Australia',
                                            'Austria',
                                            'Azerbaijan',
                                            'Bahamas',
                                            'Bahrain',
                                            'Bangladesh',
                                            'Barbados',
                                            'Belarus',
                                            'Belgium',
                                            'Belize',
                                            'Benin',
                                            'Bhutan',
                                            'Bolivia',
                                            'Bosnia and Herzegovina',
                                            'Botswana',
                                            'Brazil',
                                            'Brunei',
                                            'Bulgaria',
                                            'Burkina Faso',
                                            'Burundi',
                                            'Cabo Verde',
                                            'Cambodia',
                                            'Cameroon',
                                            'Canada',
                                            'Central African Republic',
                                            'Chad',
                                            'Chile',
                                            'China',
                                            'Colombia',
                                            'Comoros',
                                            'Congo, Democratic Republic of the',
                                            'Congo, Republic of the',
                                            'Costa Rica',
                                            'Croatia',
                                            'Cuba',
                                            'Cyprus',
                                            'Czech Republic',
                                            'Denmark',
                                            'Djibouti',
                                            'Dominica',
                                            'Dominican Republic',
                                            'Ecuador',
                                            'Egypt',
                                            'El Salvador',
                                            'Equatorial Guinea',
                                            'Eritrea',
                                            'Estonia',
                                            'Eswatini',
                                            'Ethiopia',
                                            'Fiji',
                                            'Finland',
                                            'France',
                                            'Gabon',
                                            'Gambia',
                                            'Georgia',
                                            'Germany',
                                            'Ghana',
                                            'Greece',
                                            'Grenada',
                                            'Guatemala',
                                            'Guinea',
                                            'Guinea-Bissau',
                                            'Guyana',
                                            'Haiti',
                                            'Honduras',
                                            'Hungary',
                                            'Iceland',
                                            'India',
                                            'Indonesia',
                                            'Iran',
                                            'Iraq',
                                            'Ireland',
                                            'Israel',
                                            'Italy',
                                            'Jamaica',
                                            'Japan',
                                            'Jordan',
                                            'Kazakhstan',
                                            'Kenya',
                                            'Kiribati',
                                            'Korea, North',
                                            'Korea, South',
                                            'Kosovo',
                                            'Kuwait',
                                            'Kyrgyzstan',
                                            'Laos',
                                            'Latvia',
                                            'Lebanon',
                                            'Lesotho',
                                            'Liberia',
                                            'Libya',
                                            'Liechtenstein',
                                            'Lithuania',
                                            'Luxembourg',
                                            'Madagascar',
                                            'Malawi',
                                            'Malaysia',
                                            'Maldives',
                                            'Mali',
                                            'Malta',
                                            'Marshall Islands',
                                            'Mauritania',
                                            'Mauritius',
                                            'Mexico',
                                            'Micronesia',
                                            'Moldova',
                                            'Monaco',
                                            'Mongolia',
                                            'Montenegro',
                                            'Morocco',
                                            'Mozambique',
                                            'Myanmar',
                                            'Namibia',
                                            'Nauru',
                                            'Nepal',
                                            'Netherlands',
                                            'New Zealand',
                                            'Nicaragua',
                                            'Niger',
                                            'Nigeria',
                                            'North Macedonia',
                                            'Norway',
                                            'Oman',
                                            'Pakistan',
                                            'Palau',
                                            'Palestine',
                                            'Panama',
                                            'Papua New Guinea',
                                            'Paraguay',
                                            'Peru',
                                            'Philippines',
                                            'Poland',
                                            'Portugal',
                                            'Qatar',
                                            'Romania',
                                            'Russia',
                                            'Rwanda',
                                            'Saint Kitts and Nevis',
                                            'Saint Lucia',
                                            'Saint Vincent and the Grenadines',
                                            'Samoa',
                                            'San Marino',
                                            'Sao Tome and Principe',
                                            'Saudi Arabia',
                                            'Senegal',
                                            'Serbia',
                                            'Seychelles',
                                            'Sierra Leone',
                                            'Singapore',
                                            'Slovakia',
                                            'Slovenia',
                                            'Solomon Islands',
                                            'Somalia',
                                            'South Africa',
                                            'South Sudan',
                                            'Spain',
                                            'Sri Lanka',
                                            'Sudan',
                                            'Suriname',
                                            'Sweden',
                                            'Switzerland',
                                            'Syria',
                                            'Taiwan',
                                            'Tajikistan',
                                            'Tanzania',
                                            'Thailand',
                                            'Timor-Leste',
                                            'Togo',
                                            'Tonga',
                                            'Trinidad and Tobago',
                                            'Tunisia',
                                            'Turkey',
                                            'Turkmenistan',
                                            'Tuvalu',
                                            'Uganda',
                                            'Ukraine',
                                            'United Arab Emirates',
                                            'United Kingdom',
                                            'United States',
                                            'Uruguay',
                                            'Uzbekistan',
                                            'Vanuatu',
                                            'Vatican City',
                                            'Venezuela',
                                            'Vietnam',
                                            'Yemen',
                                            'Zambia',
                                            'Zimbabwe'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
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
                                              countryIssued = newValue;
                                              _validateInput();
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 61, 121, 1),
                                                  width: 2.0),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
                                          ),
                                          menuMaxHeight:
                                              300, // Set the maximum height of the dropdown menu
                                          isExpanded:
                                              true, // Ensure the dropdown takes full width of its parent
                                        )),
                                  ]),
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
                                    'What type of licence do they hold?',
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 150,
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
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 50),
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
                                  "In which country does the driver live?",
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: 300,
                                    child: DropdownButtonFormField(
                                      value: countryResidence,
                                      items: [
                                        'Afghanistan',
                                        'Albania',
                                        'Algeria',
                                        'Andorra',
                                        'Angola',
                                        'Antigua and Barbuda',
                                        'Argentina',
                                        'Armenia',
                                        'Australia',
                                        'Austria',
                                        'Azerbaijan',
                                        'Bahamas',
                                        'Bahrain',
                                        'Bangladesh',
                                        'Barbados',
                                        'Belarus',
                                        'Belgium',
                                        'Belize',
                                        'Benin',
                                        'Bhutan',
                                        'Bolivia',
                                        'Bosnia and Herzegovina',
                                        'Botswana',
                                        'Brazil',
                                        'Brunei',
                                        'Bulgaria',
                                        'Burkina Faso',
                                        'Burundi',
                                        'Cabo Verde',
                                        'Cambodia',
                                        'Cameroon',
                                        'Canada',
                                        'Central African Republic',
                                        'Chad',
                                        'Chile',
                                        'China',
                                        'Colombia',
                                        'Comoros',
                                        'Congo, Democratic Republic of the',
                                        'Congo, Republic of the',
                                        'Costa Rica',
                                        'Croatia',
                                        'Cuba',
                                        'Cyprus',
                                        'Czech Republic',
                                        'Denmark',
                                        'Djibouti',
                                        'Dominica',
                                        'Dominican Republic',
                                        'Ecuador',
                                        'Egypt',
                                        'El Salvador',
                                        'Equatorial Guinea',
                                        'Eritrea',
                                        'Estonia',
                                        'Eswatini',
                                        'Ethiopia',
                                        'Fiji',
                                        'Finland',
                                        'France',
                                        'Gabon',
                                        'Gambia',
                                        'Georgia',
                                        'Germany',
                                        'Ghana',
                                        'Greece',
                                        'Grenada',
                                        'Guatemala',
                                        'Guinea',
                                        'Guinea-Bissau',
                                        'Guyana',
                                        'Haiti',
                                        'Honduras',
                                        'Hungary',
                                        'Iceland',
                                        'India',
                                        'Indonesia',
                                        'Iran',
                                        'Iraq',
                                        'Ireland',
                                        'Israel',
                                        'Italy',
                                        'Jamaica',
                                        'Japan',
                                        'Jordan',
                                        'Kazakhstan',
                                        'Kenya',
                                        'Kiribati',
                                        'Korea, North',
                                        'Korea, South',
                                        'Kosovo',
                                        'Kuwait',
                                        'Kyrgyzstan',
                                        'Laos',
                                        'Latvia',
                                        'Lebanon',
                                        'Lesotho',
                                        'Liberia',
                                        'Libya',
                                        'Liechtenstein',
                                        'Lithuania',
                                        'Luxembourg',
                                        'Madagascar',
                                        'Malawi',
                                        'Malaysia',
                                        'Maldives',
                                        'Mali',
                                        'Malta',
                                        'Marshall Islands',
                                        'Mauritania',
                                        'Mauritius',
                                        'Mexico',
                                        'Micronesia',
                                        'Moldova',
                                        'Monaco',
                                        'Mongolia',
                                        'Montenegro',
                                        'Morocco',
                                        'Mozambique',
                                        'Myanmar',
                                        'Namibia',
                                        'Nauru',
                                        'Nepal',
                                        'Netherlands',
                                        'New Zealand',
                                        'Nicaragua',
                                        'Niger',
                                        'Nigeria',
                                        'North Macedonia',
                                        'Norway',
                                        'Oman',
                                        'Pakistan',
                                        'Palau',
                                        'Palestine',
                                        'Panama',
                                        'Papua New Guinea',
                                        'Paraguay',
                                        'Peru',
                                        'Philippines',
                                        'Poland',
                                        'Portugal',
                                        'Qatar',
                                        'Romania',
                                        'Russia',
                                        'Rwanda',
                                        'Saint Kitts and Nevis',
                                        'Saint Lucia',
                                        'Saint Vincent and the Grenadines',
                                        'Samoa',
                                        'San Marino',
                                        'Sao Tome and Principe',
                                        'Saudi Arabia',
                                        'Senegal',
                                        'Serbia',
                                        'Seychelles',
                                        'Sierra Leone',
                                        'Singapore',
                                        'Slovakia',
                                        'Slovenia',
                                        'Solomon Islands',
                                        'Somalia',
                                        'South Africa',
                                        'South Sudan',
                                        'Spain',
                                        'Sri Lanka',
                                        'Sudan',
                                        'Suriname',
                                        'Sweden',
                                        'Switzerland',
                                        'Syria',
                                        'Taiwan',
                                        'Tajikistan',
                                        'Tanzania',
                                        'Thailand',
                                        'Timor-Leste',
                                        'Togo',
                                        'Tonga',
                                        'Trinidad and Tobago',
                                        'Tunisia',
                                        'Turkey',
                                        'Turkmenistan',
                                        'Tuvalu',
                                        'Uganda',
                                        'Ukraine',
                                        'United Arab Emirates',
                                        'United Kingdom',
                                        'United States',
                                        'Uruguay',
                                        'Uzbekistan',
                                        'Vanuatu',
                                        'Vatican City',
                                        'Venezuela',
                                        'Vietnam',
                                        'Yemen',
                                        'Zambia',
                                        'Zimbabwe'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                          countryResidence = newValue;
                                          _validateInput();
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(0, 61, 121, 1),
                                              width: 2.0),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                      ),
                                      menuMaxHeight:
                                          300, // Set the maximum height of the dropdown menu
                                      isExpanded:
                                          true, // Ensure the dropdown takes full width of its parent
                                    )),
                              ]),
                          SizedBox(height: isMobile ? 20 : 50),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
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
                                    "Address",
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 300,
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
                                  const Text(
                                    style: TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
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
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 50),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
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
                                    'City/Town',
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 200,
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
                                  const Text(
                                    style: TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    'Province/State',
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 200,
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
                                  const Text(
                                    style: TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    'Postal Code/Zip Code',
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 140,
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
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 50),
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
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Primary Phone Number',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        'Secondary Phone Number',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        style: TextStyle(
                                          fontFamily: 'ArchivoNarrow',
                                          fontSize: 16.0,
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
                            ],
                          ),
                          SizedBox(height: isMobile ? 20 : 50),
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
                                'Email',
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 200,
                                child: Theme(
                                  data: ThemeData(fontFamily: 'ArchivoNarrow'),
                                  child: TextFormField(
                                    style: const TextStyle(fontSize: 16.0),
                                    cursorColor:
                                        const Color.fromRGBO(0, 61, 121, 1),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 61, 121, 1),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          const Text(
                            "Other Driver's Vehicle Information",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Please provide information about the other driver's vehicle involved in the collision.",
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Wrap(
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
                              const SizedBox(width: 30),
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
                              const SizedBox(width: 30),
                              if (isMobile) const SizedBox(height: 30),
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
                          const SizedBox(height: 40),
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
                                            TextSpan(text: "Vehicle Make"),
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 80.0),
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
                                          width: 170,
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
                                      ]),
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
                                            TextSpan(text: "Vehicle Year"),
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 80.0),
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
                                          width: 170,
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
                                      ]),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
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
                            'Please indicate the main area of damage to the vehicle, as it corresponds to the diagram here. You must indicate where the damage/impact on the vehicle occurred, even if it is minimal. You may select more than one area.',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vehicle Damage",
                                style: TextStyle(
                                  fontFamily: 'ArchivoNarrow',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Wrap(
                            //spacing: 10.0, // spacing between columns and image

                            alignment: WrapAlignment.start,
                            children: [
                              SizedBox(
                                width: 250, // set width based on screen size
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                                width: 250, // set width based on screen size
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
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  '8 / 9',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'ArchivoNarrow',
                                  ),
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
    super.dispose();
    _dateController.dispose();
  }
}
