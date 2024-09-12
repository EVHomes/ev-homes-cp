import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ev_homes_crm_v7/navbar_pages/profile.dart';
import 'package:ev_homes_crm_v7/navbar_pages/tagging_form.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../components/nav_bar.dart';
import '../components/plus.dart';
import '../components/videoplayer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'description.dart';
import 'enquiry_form.dart';
import 'dart:math';
void onSearchPressed(BuildContext context) {
  _showSnackBar(context, 'Search clicked', 'You clicked the search icon!');
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const NavBar()));
}

void onProfilePressed(BuildContext context) {

  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ProfileWidget()));
}

void _showSnackBar(BuildContext context, String title, String message) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: ContentType.help,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

//
// class EMICalculatorScreen extends StatefulWidget {
//   @override
//   _EMICalculatorScreenState createState() => _EMICalculatorScreenState();
// }
//
// class _EMICalculatorScreenState extends State<EMICalculatorScreen> {
//   final TextEditingController _loanAmountController = TextEditingController();
//   final TextEditingController _interestRateController = TextEditingController();
//   final TextEditingController _loanTenureController = TextEditingController();
//
//   double _emiResult = 0.0;
//
//   void _calculateEMI() {
//     double principal = double.tryParse(_loanAmountController.text) ?? 0.0;
//     double annualInterestRate = double.tryParse(_interestRateController.text) ?? 0.0;
//     int tenure = int.tryParse(_loanTenureController.text) ?? 0;
//
//     double monthlyInterestRate = annualInterestRate / 12 / 100;
//     int tenureInMonths = tenure * 12;
//
//     if (monthlyInterestRate > 0) {
//       _emiResult = principal * monthlyInterestRate *
//           pow(1 + monthlyInterestRate, tenureInMonths) /
//           (pow(1 + monthlyInterestRate, tenureInMonths) - 1);
//     } else {
//       _emiResult = principal / tenureInMonths;
//     }
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EMI Calculator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _loanAmountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Loan Amount',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _interestRateController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Annual Interest Rate (%)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _loanTenureController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Loan Tenure (Years)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _calculateEMI,
//               child: Text('Calculate EMI'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Your EMI: ₹${_emiResult.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OfferSection(),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return MainSection(scrollController: scrollController);
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
                FluentIcons.add_24_regular,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CustomAppBar Widget
class CustomAppBar extends StatelessWidget {
  final VoidCallback onSearchPressed;
  final VoidCallback onProfilePressed;

  const CustomAppBar({
    required this.onSearchPressed,
    required this.onProfilePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
          child: Image.asset(
            'assets/logo.png',
            height: 40,
          ),
        ),
        Row(
          children: [
            IconButton(

              padding: const EdgeInsetsDirectional.fromSTEB(30, 50, 20, 30),
              onPressed: onSearchPressed,
              icon: const Icon(FluentIcons.search_24_regular),
            ),
            IconButton(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 20, 30),
              onPressed: onProfilePressed,
              icon: const Icon(FluentIcons.person_24_regular),
            ),
          ],
        ),
      ],
    );
  }
}

// Section Widget
class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 300,
        width: 600,
        child: VideoPlayerWidget(videoPath: 'assets/offers.mp4'));
  }
}

class MainSection extends StatelessWidget {
  final ScrollController scrollController;

  const MainSection({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          CustomAppBar(
            onSearchPressed: () => onSearchPressed(context),
            onProfilePressed: () => onProfilePressed(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: const Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // EMICalculatorScreen(),
                    SizedBox(height: 20),
                    OurProjectsSection(),
                    SizedBox(height: 20),
                    WhatsNewSection(),
                    SizedBox(height: 20),
                    MarketplaceSection(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhatsNewSection extends StatelessWidget {
  const WhatsNewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: Text(
          'What\'s New',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Manrope',
              ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 290,
        child: ListView.builder(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
          scrollDirection: Axis.horizontal,
          itemCount: ourProjects.length,
          itemBuilder: (context, index) {
            return WhatsNewCard(newItem: whatsNewItems[index]);
          },
        ),
      ),
    ]);
  }
}

class OurProjectsSection extends StatelessWidget {
  const OurProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: Text(
          'Our Projects',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Manrope',
              ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 270,
        child:
        ListView.builder(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
          scrollDirection: Axis.horizontal,
          itemCount: ourProjects.length,

          itemBuilder: (context, index) {
            return ProjectCard(
              project: ourProjects[index],
              index: index,  // Pass the index here
            );
          },
        ),




      ),
    ]);
  }
}

class MarketplaceSection extends StatelessWidget {
  const MarketplaceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Text(
            'MarketPlace',
            style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'Manrope',
                ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 340,
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 0, 25),
            scrollDirection: Axis.horizontal,
            itemCount: marketplaceItems.length,
            itemBuilder: (context, index) {
              return MarketplaceCard(item: marketplaceItems[index]);
            },
          ),
        ),
      ],
    );
  }
}

//data model
class ProjectItem {
  final String title;
  final String location;
  final String imageUrl;
  final List<String> imageUrls;
  // final List<String> amenitiesUrls;
  final List<String> amenities;
  final List<String> amenitiesicon;

  final String description;

  ProjectItem({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.imageUrls,
    // required this.amenitiesUrls,
    required this.amenities,
    required this.amenitiesicon,
    required this.description,
  });
}

class WhatsNewItem {
  final String title;
  final String imageUrl;
  final List<String> imageUrls;
  // final List<String> amenitiesUrls;
  final List<String> amenities;
  final List<String> amenitiesicon;
  final String description;

  WhatsNewItem({
    required this.title,
    required this.imageUrl,
    required this.imageUrls,
    // required this.amenitiesUrls,

    required this.amenities,
    required this.amenitiesicon,
    required this.description,
  });
}

class MarketplaceItem {
  final String title;
  final String imageUrl;
  final List<String> imageUrls;
  // final List<String> amenitiesUrls;
  final List<String> amenities;
  final List<String> amenitiesicon;
  final String description;

  MarketplaceItem({
    required this.title,
    required this.imageUrl,
    required this.imageUrls,
    // required this.amenitiesUrls,
    required this.amenities,
    required this.amenitiesicon,
    required this.description,
  });
}

// Separate the Data
final List<ProjectItem> ourProjects = [
  ProjectItem(
    title: 'Marina Bay',
    imageUrl: 'assets/marinabay.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.', location: 'Vashi',
  ),
  ProjectItem(
    title: 'Nine Square',
    imageUrl: 'assets/ninesquare.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.', location: 'Vashi',
  ),
  ProjectItem(
    title: 'Marina Bay',
    imageUrl: 'assets/marinabay.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.', location: 'Vashi',
  ),
  ProjectItem(
    title: 'Nine Square',
    imageUrl: 'assets/ninesquare.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.', location: 'Vashi',
  ),
  ProjectItem(
    title: 'Marina Bay',
    imageUrl: 'assets/marinabay.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.', location: 'Vashi',
  ),
  ProjectItem(
    title: 'Nine Square',
    imageUrl: 'assets/ninesquare.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.', location: 'Vashi',
  ),




  // Add more projects as needed
];
final List<WhatsNewItem> whatsNewItems = [
  WhatsNewItem(
    title: 'Dubai',
    imageUrl: 'assets/wn3.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  WhatsNewItem(
    title: 'New York',
    imageUrl: 'assets/wn2.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  WhatsNewItem(
    title: 'Hong Kong',
    imageUrl: 'assets/wn1.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  WhatsNewItem(
    title: 'Dubai',
    imageUrl: 'assets/wn3.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  WhatsNewItem(
    title: 'New York',
    imageUrl: 'assets/wn2.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  WhatsNewItem(
    title: 'Dubai',
    imageUrl: 'assets/wn1.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['swimming_pool_24_regular', 'dumbbell_24_regular', 'leaf_one_24_regular', 'desktop_24_regular', 'sparkle_24_regular','premium_24_filled'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),


  // Add more projects as needed
];
final List<MarketplaceItem> marketplaceItems = [
  MarketplaceItem(
    title: 'Accacia Essence',
    imageUrl: 'assets/mp3.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  MarketplaceItem(
    title: 'Bombay Velvet',
    imageUrl: 'assets/mp1.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  MarketplaceItem(
    title: 'Veronica',
    imageUrl: 'assets/mp2.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  MarketplaceItem(
    title: 'Accacia Essence',
    imageUrl: 'assets/mp3.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  MarketplaceItem(
    title: 'Bombay Velvet',
    imageUrl: 'assets/mp1.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),
  MarketplaceItem(
    title: 'Veronica',
    imageUrl: 'assets/mp2.jpg',
    imageUrls: ['assets/marinabay/mb1.jpg','assets/marinabay/mb2.jpg','assets/marinabay/mb3.jpg','assets/marinabay/mb4.jpg',],
    amenities: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    amenitiesicon: ['Swimming ', 'Gym', 'Meditation', 'WFH', 'Garden','Banquet Hall'],
    description: 'Marina Bay A EV Homes offers premium, NYC-inspired apartments with sleek, modern designs, panoramic city views, and luxurious amenities in a vibrant urban setting.',
  ),

  // Add more items as needed
];


class ProjectCard extends StatelessWidget {
  final ProjectItem project;
  final int index;

  const ProjectCard({
    required this.project,
    required this.index,  // Add this line to accept index
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define the list of gradients
    final List<LinearGradient> gradients = [
      LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepPurpleAccent.withOpacity(0.0),
          Colors.deepPurpleAccent.withOpacity(0.3),
        ],
      ),
      LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.pinkAccent.withOpacity(0.0),
          Colors.pinkAccent.withOpacity(0.3),

        ],
      ),
      LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepOrangeAccent.withOpacity(0.0),
          Colors.deepOrangeAccent.withOpacity(0.3),
        ],
      ),
    ];

    // Determine the gradient based on the index
    final gradient = gradients[index % gradients.length];

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(
                title: project.title,
                imageUrls: project.imageUrls,
                amenities: project.amenities,
                amenitiesicon: project.amenitiesicon,
                description: project.description,
                flipCards: [
                  FlipCardModel(
                    frontText: 'Gym',
                    imageUrl: 'assets/amenities/gym.jpeg',
                  ),
                  FlipCardModel(
                    frontText: 'Garden',
                    imageUrl: 'assets/amenities/gar.jpeg',
                  ),
                  FlipCardModel(
                    frontText: 'Banquet Hall',
                    imageUrl: 'assets/amenities/hall.jpeg',
                  ),
                  FlipCardModel(
                    frontText: 'WFH',
                    imageUrl: 'assets/amenities/wfh.png',
                  ),
                  FlipCardModel(
                    frontText: 'Tennis',
                    imageUrl: 'assets/amenities/tennis.jpg',
                  ),
                  FlipCardModel(
                    frontText: 'Sports Area',
                    imageUrl: 'assets/amenities/sports.jpeg',
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          width: 180,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(project.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Translucent Overlay with Gradient
              Container(
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              // Text on top of the overlay
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      project.location,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Card Widgets
// class ProjectCard extends StatelessWidget {
//   final ProjectItem project;
//
//   const ProjectCard({required this.project, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DescriptionPage(
//                 title: project.title,
//                 imageUrls: project.imageUrls,
//                 amenities: project.amenities,
//                 amenitiesicon: project.amenitiesicon,
//                 description: project.description,
//                 flipCards: [
//                   FlipCardModel(
//                     frontText: 'Gym',
//                     imageUrl: 'assets/amenities/gym.jpeg',
//                   ),
//                   FlipCardModel(
//                     frontText: 'Garden',
//                     imageUrl: 'assets/amenities/gar.jpeg',
//                   ),
//                   FlipCardModel(
//                     frontText: 'Banquet Hall',
//                     imageUrl: 'assets/amenities/hall.jpeg',
//                   ),FlipCardModel(
//                     frontText: 'WFH',
//                     imageUrl: 'assets/amenities/wfh.png',
//                   ),FlipCardModel(
//                     frontText: 'Tennis',
//                     imageUrl: 'assets/amenities/tennis.jpg',
//                   ),FlipCardModel(
//                     frontText: 'Sports Area',
//                     imageUrl: 'assets/amenities/sports.jpeg',
//                   ),
//
//
//
//                 ],
//               ),
//             ),
//           );
//         },
//         child: Container(
//           width: 180,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             image: DecorationImage(
//               image: AssetImage(project.imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Stack(
//             children: [
//               // Translucent Overlay
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.deepOrangeAccent.withOpacity(0.0),
//                       Colors.deepPurple.withOpacity(0.5),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               // Text on top of the overlay
//               Positioned(
//                 bottom: 16,
//                 left: 16,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       project.title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       project.location,
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class WhatsNewCard extends StatelessWidget {
  final WhatsNewItem newItem;

  const WhatsNewCard({required this.newItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(
                title: newItem.title,
                imageUrls: newItem.imageUrls,
                amenities: newItem.amenities,
                amenitiesicon: newItem.amenitiesicon,
                description: newItem.description,
                flipCards: [
                  FlipCardModel(
                    frontText: '1 BHK',
                    imageUrl: 'assets/wn1.jpg',
                  ),
                  FlipCardModel(
                    frontText: '2 BHK',
                    imageUrl: 'assets/wn2.jpg',
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'locationImage_${newItem.title}',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    newItem.imageUrl,
                    height: 220,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Text(
                  newItem.title,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Manrope',
                        color: Colors.black87,
                      ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 4, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'View Now',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        color: Colors.black54,
                      ),
                    ),
                    Icon(
                      FluentIcons.chevron_right_24_regular,
                      color: Colors.black54,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarketplaceCard extends StatelessWidget {
  final MarketplaceItem item;

  const MarketplaceCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(
                title: item.title,
                imageUrls: item.imageUrls,
                amenities: item.amenities,
                amenitiesicon: item.amenitiesicon,
                description: item.description, flipCards: [
                FlipCardModel(
                  frontText: '1 BHK',
                  imageUrl: 'assets/wn1.jpg',
                ),
                FlipCardModel(
                  frontText: '2 BHK',
                  imageUrl: 'assets/wn2.jpg',
                ),
              ],
              ),
            ),
          );
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'locationImage_${item.title}',
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item.imageUrl,
                      height: 220,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.title,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Manrope',
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 4),
                const InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          color: Colors.black54,
                        ),
                      ),
                      Icon(
                        FluentIcons.chevron_right_24_regular,
                        color: Colors.black54,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const OfferSection(),
//           DraggableScrollableSheet(
//             initialChildSize: 0.7,
//             minChildSize: 0.7, // Allow full scrolling up to reveal OfferSection
//             maxChildSize: 1, // Allow MainSection to expand fully
//             builder: (BuildContext context, ScrollController scrollController) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24.0),
//                     topRight: Radius.circular(24.0),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     // Fixed AppBar at the top of MainSection
//                     const AppBar(),
//                     // Scrollable content below the AppBar
//                     Expanded(
//                       child: SingleChildScrollView(
//                         controller: scrollController,
//                         child: const Padding(
//                           padding: EdgeInsets.all(0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               OurProjectsSection(),
//                               SizedBox(height: 20),
//                               WhatsNewSection(),
//                               SizedBox(height: 20),
//                               MarketplaceSection(),
//                               SizedBox(height: 80),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class OfferSection extends StatelessWidget {
//   const OfferSection({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//         height: 300,
//         width: 600,
//         // Adjust height as needed
//         child: VideoPlayerWidget(videoPath: 'assets/offers.mp4'));
//   }
// }
//
// class MainSection extends StatelessWidget {
//   const MainSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//       ),
//       child: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20),
//             AppBar(),
//             SizedBox(height: 20),
//             OurProjectsSection(),
//             WhatsNewSection(),
//             MarketplaceSection(),
//             SizedBox(height: 100),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AppBar extends StatelessWidget {
//   const AppBar({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//             child: Image.asset(
//               'assets/logo.png', // Path to your logo image
//               height: 40, // Adjust the height as needed
//             )),
//         Row(
//           children: [
//             IconButton(
//                 padding: const EdgeInsetsDirectional.fromSTEB(30, 50, 30, 30),
//                 onPressed: () {
//                   final snackBar = SnackBar(
//                     /// need to set following properties for best effect of awesome_snackbar_content
//                     elevation: 0,
//                     behavior: SnackBarBehavior.floating,
//                     backgroundColor: Colors.transparent,
//                     content: AwesomeSnackbarContent(
//                       title: 'Hey There!',
//                       message: 'Welcome to EV Homes CRM ',
//
//                       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//                       contentType: ContentType.help,
//                     ),
//                   );
//
//                   ScaffoldMessenger.of(context)
//                     ..hideCurrentSnackBar()
//                     ..showSnackBar(snackBar);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const MyHomePage(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.search)),
//             IconButton(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 20, 30),
//                 onPressed: () {
//                   final snackBar = SnackBar(
//                     /// need to set following properties for best effect of awesome_snackbar_content
//                     elevation: 0,
//                     behavior: SnackBarBehavior.floating,
//                     backgroundColor: Colors.transparent,
//                     content: AwesomeSnackbarContent(
//                       title: 'Hey There!',
//                       message: 'Welcome to EV Homes CRM ',
//
//                       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//                       contentType: ContentType.help,
//                     ),
//                   );
//
//                   ScaffoldMessenger.of(context)
//                     ..hideCurrentSnackBar()
//                     ..showSnackBar(snackBar);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const MyHomePage(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.person_2_outlined)),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
//

// Sample Data Model for Project Items
// class OurProjectsSection extends StatelessWidget {
//   const OurProjectsSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//         child: Text(
//           'Our Project',
//           style: FlutterFlowTheme.of(context)
//               .title3
//               .override(fontFamily: 'Manrope'),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//         child: Container(
//           width: double.infinity,
//           height: 270,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               primary: false,
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               children: [
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 180, // Adjust the width as per your design
//                       height: 200, // Adjust the height as per your design
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                               'assets/ninesquare.jpg'), // Replace with your image asset
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           // Translucent Overlay
//                           Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.deepOrangeAccent.withOpacity(
//                                       0.0), // 0% opacity at the top
//                                   Colors.deepPurple.withOpacity(
//                                       1), // 100% opacity at the bottom
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                           ),
//                           // Text on top of the overlay
//                           Positioned(
//                             bottom: 16,
//                             left: 16,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Nine Square',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Vashi',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.8),
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 180, // Adjust the width as per your design
//                       height: 200, // Adjust the height as per your design
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                               'assets/marinabay.jpg'), // Replace with your image asset
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           // Translucent Overlay
//                           Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.deepOrangeAccent.withOpacity(
//                                       0.0), // 0% opacity at the top
//                                   Colors.pinkAccent.withOpacity(
//                                       1), // 100% opacity at the bottom
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                           ),
//                           // Text on top of the overlay
//                           Positioned(
//                             bottom: 16,
//                             left: 16,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Marina Bay',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Vashi',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.8),
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 180, // Adjust the width as per your design
//                       height: 200, // Adjust the height as per your design
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                               'assets/ninesquare.jpg'), // Replace with your image asset
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           // Translucent Overlay
//                           Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.deepOrangeAccent.withOpacity(
//                                       0.0), // 0% opacity at the top
//                                   Colors.deepPurple.withOpacity(
//                                       1), // 100% opacity at the bottom
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                           ),
//                           // Text on top of the overlay
//                           Positioned(
//                             bottom: 16,
//                             left: 16,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Nine Square',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Vashi',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.8),
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//     ]);
//   }
// }
//
// class WhatsNewSection extends StatelessWidget {
//   const WhatsNewSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//         child: Text(
//           'What\'s New',
//           style: FlutterFlowTheme.of(context)
//               .title3
//               .override(fontFamily: 'Manrope'),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//         child: Container(
//           width: double.infinity,
//           height: 290,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               primary: false,
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               children: [
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 180,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Updated background color
//
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: 'locationImage',
//                               transitionOnUserGestures: true,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.asset(
//                                   "assets/wn3.jpg",
//                                   height: 220,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   10, 10, 0, 0),
//                               child: Text(
//                                 'New York',
//                                 style: FlutterFlowTheme.of(context)
//                                     .subtitle2
//                                     .override(
//                                       fontFamily:
//                                           'Manrope', // Set the font family
//                                       color:
//                                           Colors.black87, // Updated font color
//                                     ),
//                               ),
//                             ),
//                             const InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         10, 4, 0, 0),
//                                     child: Text(
//                                       'View Now',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily:
//                                             'Manrope', // Set the font family
//                                         color: Colors
//                                             .black54, // Updated font color
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     FluentIcons.chevron_right_24_regular,
//                                     color: Colors.black54,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 180,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Updated background color
//
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: 'locationImage',
//                               transitionOnUserGestures: true,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.asset(
//                                   "assets/wn2.jpg",
//                                   height: 220,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   10, 10, 0, 0),
//                               child: Text(
//                                 'New York',
//                                 style: FlutterFlowTheme.of(context)
//                                     .subtitle2
//                                     .override(
//                                       fontFamily:
//                                           'Manrope', // Set the font family
//                                       color:
//                                           Colors.black87, // Updated font color
//                                     ),
//                               ),
//                             ),
//                             const InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         10, 4, 0, 0),
//                                     child: Text(
//                                       'View Now',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily:
//                                             'Manrope', // Set the font family
//                                         color: Colors
//                                             .black54, // Updated font color
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     FluentIcons.chevron_right_24_regular,
//                                     color: Colors.black54,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 180,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Updated background color
//
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: 'locationImage',
//                               transitionOnUserGestures: true,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.asset(
//                                   "assets/wn1.jpg",
//                                   height: 220,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   10, 10, 0, 0),
//                               child: Text(
//                                 'New York',
//                                 style: FlutterFlowTheme.of(context)
//                                     .subtitle2
//                                     .override(
//                                       fontFamily:
//                                           'Manrope', // Set the font family
//                                       color:
//                                           Colors.black87, // Updated font color
//                                     ),
//                               ),
//                             ),
//                             const InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         10, 4, 0, 0),
//                                     child: Text(
//                                       'View Now',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily:
//                                             'Manrope', // Set the font family
//                                         color: Colors
//                                             .black54, // Updated font color
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     FluentIcons.chevron_right_24_regular,
//                                     color: Colors.black54,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//     ]);
//   }
// }

// class MarketplaceSection extends StatelessWidget {
//   const MarketplaceSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//         child: Text(
//           'MarketPlace',
//           style: FlutterFlowTheme.of(context)
//               .title3
//               .override(fontFamily: 'Manrope'),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//         child: Container(
//           width: double.infinity,
//           height: 340,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 25),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               primary: false,
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               children: [
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 200,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Updated background color
//                         border: Border.all(color: Colors.black26, width: 0.5),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: 'locationImage',
//                               transitionOnUserGestures: true,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.asset(
//                                   "assets/mp3.jpg",
//                                   height: 220,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(4, 10, 0, 0),
//                               child: Text(
//                                 'Accacia Essence',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: 'Manrope', // Set the font family
//                                   color: Colors.black87, // Updated font color
//                                 ),
//                               ),
//                             ),
//                             const InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         4, 4, 0, 0),
//                                     child: Text(
//                                       'View Now',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily:
//                                             'Manrope', // Set the font family
//                                         color: Colors
//                                             .black54, // Updated font color
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     FluentIcons.chevron_right_24_regular,
//                                     color: Colors.black54,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 200,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Updated background color
//                         border: Border.all(color: Colors.black26, width: 0.5),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: 'locationImage',
//                               transitionOnUserGestures: true,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.asset(
//                                   "assets/mp1.jpg",
//                                   height: 220,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(4, 10, 0, 0),
//                               child: Text(
//                                 'Accacia Essence',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: 'Manrope', // Set the font family
//                                   color: Colors.black87, // Updated font color
//                                 ),
//                               ),
//                             ),
//                             const InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         4, 4, 0, 0),
//                                     child: Text(
//                                       'View Now',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily:
//                                             'Manrope', // Set the font family
//                                         color: Colors
//                                             .black54, // Updated font color
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     FluentIcons.chevron_right_24_regular,
//                                     color: Colors.black54,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const DescriptionPage(
//                             title: 'Description',
//                             imageUrls: [
//                               'assets/wn3.jpg',
//                               'assets/wn2.jpg',
//                               'assets/wn3.jpg',
//                             ],
//                             amenities: [
//                               'Swimming ',
//                               'Gym',
//                               '24/7 Security',
//                               'Parking',
//                             ],
//                             description:
//                                 'This is a detailed description of the property. It includes information about the location, features, and other important details that potential buyers or renters might be interested in.',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 200,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white, // Updated background color
//                         border: Border.all(color: Colors.black26, width: 0.5),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: 'locationImage',
//                               transitionOnUserGestures: true,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.asset(
//                                   "assets/mp2.jpg",
//                                   height: 220,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(4, 10, 0, 0),
//                               child: Text(
//                                 'Accacia Essence',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: 'Manrope', // Set the font family
//                                   color: Colors.black87, // Updated font color
//                                 ),
//                               ),
//                             ),
//                             const InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         4, 4, 0, 0),
//                                     child: Text(
//                                       'View Now',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily:
//                                             'Manrope', // Set the font family
//                                         color: Colors
//                                             .black54, // Updated font color
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     FluentIcons.chevron_right_24_regular,
//                                     color: Colors.black54,
//                                     size: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       const Text(
//         'MarketPlace',
//         style: TextStyle(
//             fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
//       ),
//       const Text(
//         'MarketPlace',
//         style: TextStyle(
//             fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
//       ),
//     ]);
//   }
// }

//outline card minimal
// Padding(
// padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 8),
// child: Container(
// width: 200,
// height: 100,
// decoration: BoxDecoration(
// color: Colors.white, // Updated background color
// border: Border.all(color: Colors.black26, width: 0.5),
// borderRadius: BorderRadius.circular(12),
// ),
// child: Padding(
// padding: const EdgeInsets.all(8),
// child: Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Hero(
// tag: 'locationImage',
// transitionOnUserGestures: true,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(8),
// child: Image.asset(
// "assets/marinabay.jpg",
// height: 220,
// fit: BoxFit.cover,
// ),
// ),
// ),
// const Padding(
// padding:
// EdgeInsetsDirectional.fromSTEB(4, 16, 0, 0),
// child: Text(
// 'Marina Bay',
// style: TextStyle(
// fontFamily: 'Manrope', // Set the font family
// color: Colors.black87, // Updated font color
// ),
// ),
// ),
// const InkWell(
// splashColor: Colors.transparent,
// focusColor: Colors.transparent,
// hoverColor: Colors.transparent,
// highlightColor: Colors.transparent,
// child: Row(
// mainAxisSize: MainAxisSize.max,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Padding(
// padding: EdgeInsetsDirectional.fromSTEB(
// 4, 4, 0, 0),
// child: Text(
// 'View Now',
// style: TextStyle(
// fontFamily:
// 'Manrope', // Set the font family
// color:
// Colors.black54, // Updated font color
// ),
// ),
// ),
// Icon(
// FluentIcons.chevron_right_24_regular,
// color: Colors.black54,
// size: 24,
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// ),

// class SearchBar extends StatefulWidget {
//   const SearchBar({super.key});
//
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }
//
//

// class _SearchBarState extends State<SearchBar> {
//   final List<String> _placeholders = [
//     'Search for CP name',
//     'Search for Client Phone number',
//     'Search for Tagging status',
//   ];
//
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _startPlaceholderLoop();
//   }
//
//   void _startPlaceholderLoop() {
//     Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       setState(() {
//         _currentIndex = (_currentIndex + 1) % _placeholders.length;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       transitionBuilder: (Widget child, Animation<double> animation) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//       child: TextField(
//         key: ValueKey<String>(_placeholders[_currentIndex]),
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           prefixIcon: const Icon(Icons.search),
//           labelText: _placeholders[_currentIndex],
//           labelStyle: const TextStyle(
//             color: Colors.grey,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//       ),
//     );
//   }
// }
