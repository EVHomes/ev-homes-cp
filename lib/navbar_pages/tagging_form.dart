import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'enquiry_form.dart';

class ClientReportPage extends StatefulWidget {
  const ClientReportPage({super.key});

  @override
  _ClientReportPageState createState() => _ClientReportPageState();
}

class _ClientReportPageState extends State<ClientReportPage> {
  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Example list of contact info data
    final List<ContactInfo> contactList = [
      ContactInfo(
        name: 'Sakshi Talwe',
        phoneNumber: '9920042354',
        lastCall: DateTime(2024, 8, 17, 13, 7, 20),
        nextCall: DateTime(2024, 10, 16, 13, 7, 20),
      ),

      ContactInfo(
        name: 'Dev Joshi',
        phoneNumber: '9812345678',
        lastCall: DateTime(2024, 7, 10, 10, 30, 45),
        nextCall: DateTime(2024, 9, 12, 14, 50, 30),
      ),
      ContactInfo(
        name: 'Nyara Singh',
        phoneNumber: '9876543210',
        lastCall: DateTime(2024, 6, 5, 8, 20, 15),
        nextCall: DateTime(2024, 12, 1, 16, 10, 55),
      ),
      ContactInfo(
        name: 'Shiv Thakre',
        phoneNumber: '9920042354',
        lastCall: DateTime(2024, 8, 17, 13, 7, 20),
        nextCall: DateTime(2024, 10, 16, 13, 7, 20),
      ),

      ContactInfo(
        name: 'Apoorva Jha',
        phoneNumber: '9812345678',
        lastCall: DateTime(2024, 7, 10, 10, 30, 45),
        nextCall: DateTime(2024, 9, 12, 14, 50, 30),
      ),
      ContactInfo(
        name: 'Sakshi Talwe',
        phoneNumber: '9920042354',
        lastCall: DateTime(2024, 8, 17, 13, 7, 20),
        nextCall: DateTime(2024, 10, 16, 13, 7, 20),
      ),

      ContactInfo(
        name: 'Dev Joshi',
        phoneNumber: '9812345678',
        lastCall: DateTime(2024, 7, 10, 10, 30, 45),
        nextCall: DateTime(2024, 9, 12, 14, 50, 30),
      ),
      ContactInfo(
        name: 'Nyara Singh',
        phoneNumber: '9876543210',
        lastCall: DateTime(2024, 6, 5, 8, 20, 15),
        nextCall: DateTime(2024, 12, 1, 16, 10, 55),
      ),
      ContactInfo(
        name: 'Shiv Thakre',
        phoneNumber: '9920042354',
        lastCall: DateTime(2024, 8, 17, 13, 7, 20),
        nextCall: DateTime(2024, 10, 16, 13, 7, 20),
      ),

      ContactInfo(
        name: 'Apoorva Jha',
        phoneNumber: '9812345678',
        lastCall: DateTime(2024, 7, 10, 10, 30, 45),
        nextCall: DateTime(2024, 9, 12, 14, 50, 30),
      ),

      // Add more ContactInfo instances here
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Tagging Report'),
        ),
        body: Stack(
          children: [

            ListView.builder(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 180),
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContactCard(contactInfo: contactList[index]),
                );
              },
            ),
            if (_isMenuVisible) ...[
              Positioned(
                bottom: 170.0, // Position above the FAB
                right: 16.0,
                child: AnimatedOpacity(
                  opacity: _isMenuVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent),
                    onPressed: () {
                      // Navigate to the Client Tagging Form page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClientTaggingForm()),
                      );
                    },
                    child: const Text(
                      'Client Tagging Form',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 220.0, // Position above the Client Tagging Form button
                right: 16.0,
                child: AnimatedOpacity(
                  opacity: _isMenuVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent),
                    onPressed: () {
                      // Navigate to the Enquiry Form page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EnquiryForm()),
                      );
                    },
                    child: const Text(
                      'Enquiry Form',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
            Positioned(
              bottom: 100.0,
              right: 20.0,
              child: FloatingActionButton(
                backgroundColor: Colors.deepPurpleAccent,
                elevation: 10,
                onPressed: _toggleMenu,
                tooltip: 'Add',
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}

class ContactInfo {
  final String name;
  final String phoneNumber;
  final DateTime lastCall;
  final DateTime nextCall;

  ContactInfo({
    required this.name,
    required this.phoneNumber,
    required this.lastCall,
    required this.nextCall,
  });
}

class ContactCard extends StatelessWidget {
  final ContactInfo contactInfo;

  const ContactCard({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5, color: Colors.black26)),
        child: Row(
          children: [
            // Left Section: Name and Phone Number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactInfo.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone_outlined,
                        color: Colors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        contactInfo.phoneNumber,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Right Section: Icons and Dates
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      _formatDateTime(contactInfo.lastCall),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_upward,
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      _formatDateTime(contactInfo.nextCall),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_downward,
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  // Helper method to format DateTime
  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}  ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  String _getMonthName(int month) {
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

class ClientTaggingForm extends StatefulWidget {
  const ClientTaggingForm({super.key});

  @override
  _ClientTaggingFormState createState() => _ClientTaggingFormState();
}

class _ClientTaggingFormState extends State<ClientTaggingForm> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = {
    'dateTime': TextEditingController(),
    'validTill': TextEditingController(),
    'name': TextEditingController(),
    'phone': TextEditingController(),
    'altPhone': TextEditingController(),
    'email': TextEditingController(),
    'cpEmail': TextEditingController(),
    'cpName': TextEditingController(),
    'cpFirmName': TextEditingController(),
    'remarks': TextEditingController(), // Added remarks controller
  };

  String _projectRequirement = 'EV Nine Square';
  String _taggingStatus = 'Pending';
  String _teamLeader = 'Manisha';
  String _dataAnalyzer = 'Pavan Ale';
  String _requirement = '1RK'; // Existing requirement field

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _controllers['dateTime']!.text = DateFormat('yyyy-MM-dd HH:mm').format(now);
    _controllers['validTill']!.text =
        DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 60)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Client Tagging Form'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Date-Time', 'dateTime', readOnly: true),
              _buildTextField('Valid Till', 'validTill', readOnly: true),
              _buildTextField('Name', 'name'),
              _buildTextField('Phone Number', 'phone',
                  keyboardType: TextInputType.phone),
              _buildTextField('Alternate Phone Number', 'altPhone',
                  keyboardType: TextInputType.phone),
              _buildTextField('Email', 'email',
                  keyboardType: TextInputType.emailAddress),
              _buildDropdown(
                  'Project & Requirement',
                  _projectRequirement,
                  [

                    'EV Nine Square',
                    'EV Heart City',
                    'EV 10 Marina Bay'
                  ],
                  (val) => setState(() => _projectRequirement = val!)),
              _buildDropdown(
                  'Requirement',
                  _requirement,
                  [ '1RK', '1BHK', '2BHK', '3BHK', 'JODI'],
                  (val) => setState(() => _requirement = val!)),
              _buildTextField('Remarks', 'remarks',
                  maxLines: 3), // Added remarks field
              _buildDropdown(
                  'Tagging Status',
                  _taggingStatus,
                  ['Pending', 'In Progress', 'Completed'],
                  (val) => setState(() => _taggingStatus = val!)),
              _buildTextField('CP Email', 'cpEmail',
                  keyboardType: TextInputType.emailAddress),
              _buildDropdown(
                  'Team Leader',
                  _teamLeader,
                  [

                    'Manisha',
                    'Renu',
                    'Hiral',
                    'Jignyasa'
                  ],
                  (val) => setState(() => _teamLeader = val!)),
              _buildDropdown(
                  'Data Analyzer',
                  _dataAnalyzer,
                  ['Pavan Ale', 'Narayan Jha'],
                  (val) => setState(() => _dataAnalyzer = val!)),
              _buildTextField('CP Name', 'cpName'),
              _buildTextField('CP Firm Name', 'cpFirmName'),
              const SizedBox(height: 20),
              FFButtonWidget(
                onPressed: () {},
                text: 'Submit',
                options: FFButtonOptions(
                  width: 230.0,
                  height: 52.0,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Colors.deepPurpleAccent,
                  textStyle: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildTextField(
    String label,
    String controllerKey, {
    TextInputType? keyboardType,
    IconData? suffixIcon,
    VoidCallback? onTap,
    bool readOnly = false,
    int? maxLines, // Added parameter for maximum lines
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: _controllers[controllerKey],
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Color.fromARGB(
                  255, 63, 63, 63), // Customize the label text color
              fontSize: 16.0, // Customize the label text size
              fontWeight: FontWeight.normal, // Customize the label text weight
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(icon: Icon(suffixIcon), onPressed: onTap)
                : null,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(22, 17, 22, 17)),
        style: const TextStyle(
          color:
              Color.fromARGB(255, 63, 63, 63), // Customize the main text color
          fontSize: 18.0, // Customize the main text size
          // Customize the main text style
        ),
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLines: maxLines,
        validator: (value) =>
            value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        value: value,

        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Color.fromARGB(
                  255, 63, 63, 63), // Customize the label text color
              fontSize: 16.0, // Customize the label text size
              fontWeight: FontWeight.normal, // Customize the label text weight
            ),

            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            contentPadding:
            const EdgeInsetsDirectional.fromSTEB(22, 17, 22, 17)),
      ),
    );
  }
}
