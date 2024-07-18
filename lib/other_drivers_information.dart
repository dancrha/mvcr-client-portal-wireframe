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
                          "Other Driver's Information",
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
                          'Please provide other details of additional drivers involved in the collision. These details are necessary to complete the report and without them, processing will be delayed. ',
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Last Name',
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
                                const SizedBox(
                                    width:
                                        20), // Adjust this value to control the space between fields
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
                                      'First Name',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.15, // Adjust this value to change the width of the field
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
                                      width: MediaQuery.of(context).size.width *
                                          0.175,
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
                                const SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 80.0),
                                        child: Text(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          "In which province or state was this driver's licence issued?",
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
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
                                                    fontFamily: 'ArchivoNarrow',
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 80.0),
                                  child: Text(
                                    style: TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    "In which country was the driver's licence issued?",
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 80),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
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
                                )
                              ]),
                          const SizedBox(
                              width:
                                  20), // Adjust this value to control the space between fields
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
                                width:
                                    MediaQuery.of(context).size.width * 0.115,
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
                          const SizedBox(
                            width: 20,
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
                                  "In which country does the driver live?",
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
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
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(0, 61, 121, 1),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      'Number/Unit',
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
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
                                const SizedBox(
                                    width:
                                        20), // Adjust this value to control the space between fields
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
                                const SizedBox(
                                    width:
                                        20), // Adjust this value to control the space between fields
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
                                const SizedBox(
                                    width:
                                        20), // Adjust this value to control the space between fields
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
                                      'Secondary Phone Number',
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
                                const SizedBox(
                                    width:
                                        20), // Adjust this value to control the space between fields
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
                                      'Business Phone Number',
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

                                const SizedBox(
                                    width:
                                        20), // Adjust this value to control the space between fields
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          "Other Driver's Vehicle Information",
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
                          "Please provide information about the other driver's vehicle involved in the collision.",
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  style: TextStyle(
                                    fontFamily: 'ArchivoNarrow',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  'Licence Plate',
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
                                    const Text(
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      'Vehicle Make',
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
                                      const Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80.0),
                                        child: const Text(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          'Vehicle Model',
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
                                    const Text(
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      'Vehicle Year',
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
                                        child: const Text(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          'Vehicle Colour',
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
                                    const Text(
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      'Insurance Provider',
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
                                      const Padding(
                                        padding: EdgeInsets.only(right: 80.0),
                                        child: Text(
                                          style: TextStyle(
                                            fontFamily: 'ArchivoNarrow',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          'Policy Number',
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
                      const SizedBox(height: 50),
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
                          'Please indicate the main area of damage to the vehicle, as it corresponds to the diagram here. You must indicate where the damage/impact on the vehicle occurred, even if it is minimal. You may select more than one area.',
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
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 80.0),
                            child: Text(
                              "Vehicle Damage",
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
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
                              '8 / 9',
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
