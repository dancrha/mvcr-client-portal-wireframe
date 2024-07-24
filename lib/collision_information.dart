import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/font_size_notifier.dart';

import 'package:flutter_application_1/driver_information.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CollisionInformation extends StatefulWidget {
  final DateTime selectedDate;
  const CollisionInformation({Key? key, required this.selectedDate})
      : super(key: key);
  @override
  State<CollisionInformation> createState() => _CollisionInformationState();
}

class _CollisionInformationState extends State<CollisionInformation> {
  TextEditingController _incidentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final TextEditingController _fromTimeController = TextEditingController();
  final TextEditingController _toTimeController = TextEditingController();

  TextEditingController _locationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  MapController _mapController = MapController();

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
  bool _isButtonEnabled = true;

  double fontSize = 16.0;
  double headerFontSize = 32.0;

  LatLng? _selectedLocation;
  String _address = "";

  @override
  void initState() {
    super.initState();
    _incidentController.addListener(_validateInput);
    _dateController.addListener(_validateInput);
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

  Future<void> _getAddressFromCoordinates(LatLng point) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        _locationController.text = address;
      }
    } catch (e) {
      _locationController.text = "Address not found";
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
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(0, 61, 121, 1), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Color.fromRGBO(0, 61, 121, 1), // body text color
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

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
        // _mapController.move(_selectedLocation, 15);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final Color customBlueColor = Color.fromRGBO(0, 61, 121, 1);

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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

    if (selectedTime != null) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTimeOfDay = localizations.formatTimeOfDay(selectedTime);
      controller.text = formattedTimeOfDay;
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
              color: const Color.fromRGBO(0, 61, 121, 1),
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
                          Wrap(
                            spacing: 5,
                            runSpacing: 20,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Collision Information',
                                    style: TextStyle(
                                      fontFamily: 'ArchivoNarrow',
                                      fontWeight: FontWeight.bold,
                                      fontSize: headerFontSize,
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     IconButton(
                                  //       onPressed: () {
                                  //         // setFontSize(
                                  //         //     fontSize - 1, headerFontSize - 1);
                                  //         Provider.of<FontSizeProvider>(context,
                                  //                 listen: true)
                                  //             .setFontSize(fontSize - 1,
                                  //                 headerFontSize - 1);
                                  //       },
                                  //       icon: const Icon(Icons.text_decrease),
                                  //     ),
                                  //     IconButton(
                                  //       onPressed: () =>
                                  //           Provider.of<FontSizeProvider>(
                                  //                   context,
                                  //                   listen: false)
                                  //               .setFontSize(fontSize + 1,
                                  //                   headerFontSize + 1),
                                  //       // setFontSize(
                                  //       //     fontSize + 1, headerFontSize + 1),
                                  //       icon: const Icon(Icons.text_increase),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: fontSize,
                                color:
                                    Colors.black, // Set default color for text
                              ),
                              children: const [
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
                          Text(
                            'Tell us some more specific details about the collision. Please provide all answers to the best of your knowledge.',
                            style: TextStyle(
                              fontFamily: 'ArchivoNarrow',
                              //fontWeight: FontWeight.bold,
                              fontSize: fontSize,
                            ),
                          ),
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
                                  text:
                                      'Where did the collision occur? (Address, Roadway or Intersection)',
                                ),
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
                          Text(
                              'Enter the location manually or select the location on the map.',
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: fontSize,
                                color: Colors.black,
                              )),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: Theme(
                              data: ThemeData(fontFamily: 'ArchivoNarrow'),
                              child: TextFormField(
                                //controller: _locationController,
                                style: TextStyle(fontSize: fontSize),
                                cursorColor:
                                    const Color.fromRGBO(0, 61, 121, 1),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          const Color.fromRGBO(0, 61, 121, 1),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height:
                                450, // Adjust the height to accommodate the text below the map
                            width: 600,
                            child: Stack(
                              children: [
                                FlutterMap(
                                  mapController: _mapController,
                                  options: MapOptions(
                                    center: LatLng(43.844068, -79.431071),
                                    zoom: 9.8,
                                    maxZoom: 18.0,
                                    onTap: (tapPosition, point) {
                                      setState(() {
                                        _selectedLocation = point;
                                        _locationController.text =
                                            "${point.latitude}, ${point.longitude}";
                                        // Implement a reverse geocoding function here to get a human-readable address if needed
                                      });
                                    },
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                      subdomains: ['a', 'b', 'c'],
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        Marker(
                                          width: 80.0,
                                          height: 80.0,
                                          point: _selectedLocation ??
                                              LatLng(43.844068, -79.431071),
                                          builder: (ctx) => const Align(
                                            alignment: Alignment.topCenter,
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 16,
                                  right: 16,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 40, // Adjust the size as needed
                                        height: 40, // Adjust the size as needed
                                        child: FloatingActionButton(
                                          heroTag: "zoomIn",
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            // Implement zoom in functionality
                                            _mapController.move(
                                                _mapController.center,
                                                _mapController.zoom + 1);
                                          },
                                          backgroundColor: Colors
                                              .white, // Set background color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Adjust the radius to make it more square
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 40, // Adjust the size as needed
                                        height: 40, // Adjust the size as needed
                                        child: FloatingActionButton(
                                          heroTag: "zoomOut",
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            // Implement zoom out functionality
                                            _mapController.move(
                                                _mapController.center,
                                                _mapController.zoom - 1);
                                          },
                                          backgroundColor: Colors
                                              .white, // Set background color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Adjust the radius to make it more square
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_selectedLocation != null)
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 20),
                              color: Colors.white,
                              child: Text(
                                "Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'ArchivoNarrow'),
                              ),
                            ),

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
                          const SizedBox(
                              height:
                                  20), // Add some space between the text and the number picker
                          Row(
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
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey, // Border color
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Optional: Border radius
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$_currentValue',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
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

                          const SizedBox(height: 40),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize:
                                    16.0, // Replace with your desired font size
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'Please indicate the time of the collision. If exact time is unknown indicate a range.',
                                ),
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          IntrinsicWidth(
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 240, 240, 240),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey.shade700,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                              fontFamily: 'ArchivoNarrow',
                                              fontSize:
                                                  16.0, // Replace with your desired font size
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            children: [
                                              const TextSpan(
                                                text: 'Date of Collision:',
                                                style: TextStyle(
                                                    //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    " ${widget.selectedDate.toLocal().toString().split(' ')[0]}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
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
                                          text: 'From:',
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
                                    width: 250,
                                    child: GestureDetector(
                                      onTap: () => _selectTime(
                                          context, _fromTimeController),
                                      child: AbsorbPointer(
                                        child: TextFormField(
                                          controller: _fromTimeController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelStyle: TextStyle(
                                              fontFamily: 'Archivo Narrow',
                                              fontSize: 14,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.access_time,
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
                                    'To:',
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 250,
                                    child: GestureDetector(
                                      onTap: () => _selectTime(
                                          context, _toTimeController),
                                      child: AbsorbPointer(
                                        child: TextFormField(
                                          controller: _toTimeController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelStyle: TextStyle(
                                              fontFamily: 'Archivo Narrow',
                                              fontSize: 14,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.access_time,
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
                          const SizedBox(height: 40),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'ArchivoNarrow',
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: const [
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
                          const SizedBox(height: 10),
                          SizedBox(
                              width: 400,
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
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: fontSize,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              )),
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
                          const SizedBox(height: 10),
                          SizedBox(
                              width: 400,
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
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: fontSize,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              )),
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
                          const SizedBox(height: 10),
                          SizedBox(
                              width: 400,
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
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: fontSize,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              )),
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
                          const SizedBox(height: 10),
                          SizedBox(
                              width: 400,
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
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: fontSize,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              )),
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
                          const SizedBox(height: 10),
                          SizedBox(
                              width: 400,
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
                                      style: TextStyle(
                                        fontFamily: 'ArchivoNarrow',
                                        fontSize: fontSize,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            const Color.fromRGBO(0, 61, 121, 1),
                                        width: 2.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                ),
                              )),
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
                                  text:
                                      'Is there damage to any other property?',
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
                          if (_propertyDamage == 'Yes') ...{
                            const SizedBox(height: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  width: 400,
                                  child: Theme(
                                    data: ThemeData(
                                      fontFamily: 'ArchivoNarrow',
                                    ),
                                    child: TextFormField(
                                      controller: _incidentController,
                                      style: TextStyle(fontSize: fontSize),
                                      cursorColor:
                                          const Color.fromRGBO(0, 61, 121, 1),
                                      maxLines:
                                          null, // Allows for multiple lines
                                      minLines:
                                          4, // Sets a minimum height of 4 lines
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color.fromRGBO(
                                                0, 61, 121, 1),
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
                                    children: [
                                      const Icon(
                                        Icons.navigate_before,
                                        size: 22,
                                        color: Color.fromRGBO(
                                            0, 61, 121, 1), // Dark blue icon
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Back',
                                          style: TextStyle(
                                            color: const Color.fromRGBO(0, 61,
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
                                '3 / 9',
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
                                                  const DriverInformation(),
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
    super.dispose();
  }
}
