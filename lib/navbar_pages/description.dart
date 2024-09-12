import 'package:carousel_slider/carousel_slider.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class FlipCardModel {
  final String frontText;
  final String imageUrl;

  FlipCardModel({
    required this.frontText,
    required this.imageUrl,
  });
}

final Map<String, IconData> fluentIconMap = {
  'swimming_pool_24_regular': FluentIcons.swimming_pool_24_regular,
  'dumbbell_24_regular': FluentIcons.dumbbell_24_regular,
  'leaf_one_24_regular': FluentIcons.leaf_one_24_regular,
  'desktop_24_regular': FluentIcons.desktop_24_regular,
  'sparkle_24_regular': FluentIcons.sparkle_24_regular,
  'premium_24_filled': FluentIcons.premium_24_regular,
};

class DescriptionPage extends StatefulWidget {
  final String title;
  final List<String> imageUrls;
  final List<String> amenities;
  final List<String> amenitiesicon;
  final String description;
  final List<FlipCardModel> flipCards;

  DescriptionPage({
    super.key,
    required this.title,
    required this.imageUrls,
    required this.amenities,
    required this.amenitiesicon,
    required this.description,
    required this.flipCards,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class HorizontalStaggeredGallery extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/amenities/hall.jpeg',
    'assets/amenities/wfh.png',
    'assets/amenities/hall2.jpeg',
    'assets/amenities/pool.jpg',
    'assets/amenities/med2.jpeg',
    'assets/amenities/gym.jpeg',
    'assets/amenities/med.png',
    'assets/amenities/gar2.jpeg',
    'assets/amenities/sports.jpeg',
    'assets/amenities/play.jpeg',
    'assets/amenities/gar.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300,
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: List.generate(imageUrls.length, (index) {
            return StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: Card.filled(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrls[index],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}

class _DescriptionPageState extends State<DescriptionPage>
    with SingleTickerProviderStateMixin {
  final String appLink =
      'https://play.google.com/store/apps/details?id=com.instagram.android&pcampaignid=web_share';

  Future<void> _shareViaWhatsApp(BuildContext context) async {
    final Uri whatsappUri =
        Uri.parse("whatsapp://send?text=Check out this app: $appLink");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("WhatsApp is not installed on this device")),
      );
    }
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Share App"),
          content: Text(
              "Do you want to share this app with your friends via WhatsApp?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _shareViaWhatsApp(context); // Proceed to share
              },
              child: Text("Share"),
            ),
          ],
        );
      },
    );
  }

  int _currentIndex = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  late TabController _tabController;
  final List<String> _tabNames = ['2BHK', '3BHK']; // Initial tabs
  final List<PropertyDetails> _properties = [
    PropertyDetails(
      imageAsset: 'assets/vt.jpeg',
      reraId: 'R654321BJU6',
      carpetArea: '890 sq.ft',
      price: '₹ 2 CR',
      possessionDate: 'Jan 2025',
    ),
    PropertyDetails(
      imageAsset: 'assets/vt.jpeg',
      reraId: 'R6543214DG7HK',
      carpetArea: '970 sq.ft',
      price: '₹ 3 CR',
      possessionDate: 'Jan 2025',
    ),
    // Add more PropertyDetails as needed
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _downloadPdf(BuildContext context) async {
    try {
      // Load the PDF from assets
      final ByteData data = await rootBundle.load('assets/Layout.pdf');
      final List<int> bytes = data.buffer.asUint8List();

      // Get the directory for storing the PDF
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory!.path}/Layout.pdf';

      // Write the PDF to the file
      final File file = File(filePath);
      await file.writeAsBytes(bytes, flush: true);

      // Show a snackbar with the file path
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF downloaded to $filePath')),
      );

      // Open the downloaded PDF
      await OpenFile.open(filePath);
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download PDF: $e')),
      );
    }
  }

  Future<void> _makePhoneCall(BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '8766037284',
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch phone dialer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(0),
            children: [
              _buildCarouselSection(),
              SizedBox(height: 16),
              _buildDescriptionSection(),
              SizedBox(height: 16),
              _buildAmenitiesSection(),
              // SizedBox(height: 16),
              // _buildAmenitiesFlipCardSection(),

              HorizontalStaggeredGallery(),
              // SizedBox(height: 16),
              // _buildActionButtonsSection(context),
              // SizedBox(height: 16),

              // PropertyList(
              //   properties: [
              //     Property(
              //       imageUrl: 'assets/vt.jpeg',
              //       price: '₹ 1.5 CR',
              //       type: '1BHK',
              //     ),
              //     Property(
              //       imageUrl: 'assets/vt.jpeg',
              //       price: '₹ 3.5 CR',
              //       type: '2BHK',
              //     ),
              //     Property(
              //       imageUrl: 'assets/vt.jpeg',
              //       price: '₹ 5 CR',
              //       type: '3BHK',
              //     ),
              //   ],
              // ),

              _buildRequirementSection(),
              SizedBox(height: 230),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () => _downloadPdf(context),
                        text: 'Brochure',
                        icon: Icon(
                          FluentIcons.arrow_download_24_regular,
                          size: 12,
                          color: Colors.deepPurpleAccent,
                        ),
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                    color: Colors.deepPurpleAccent,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: FFButtonWidget(
                      onPressed: () => _makePhoneCall(context),
                      text: 'Contact Us',
                      icon: Icon(
                        FluentIcons.call_24_regular,
                        size: 12,
                        color: Colors.white,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        elevation: 0,
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.deepPurpleAccent,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 10,
            child: FloatingActionButton.small(
              mouseCursor: MouseCursor.defer,
              focusElevation: 4,
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                _openMap();
              },
              child: Icon(
                FluentIcons.compass_northwest_20_regular,
                size: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            right: 10,
            child: FloatingActionButton.small(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                _showShareDialog(context);
              },
              child: Icon(FluentIcons.share_20_regular, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _openMap() async {
    const url = 'https://maps.app.goo.gl/VywyURbZko3YtRqw7';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }

  Widget _buildCarouselSection() {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselSliderController,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 350,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselSliderController.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAmenitiesSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
              'Amenities',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Row(
                  children: List.generate(widget.amenities.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8.0),
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(25, 98, 0, 234),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            fluentIconMap[widget.amenitiesicon[index]] ??
                                FluentIcons
                                    .question_circle_24_regular, // Fallback icon
                            color: Colors.deepPurpleAccent,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            widget.amenities[index],
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.deepPurpleAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),


                ),
              )),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
              'Description',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Text(
            widget.description,
            style: TextStyle(
                fontFamily: 'Manrope', fontSize: 12, color: Colors.black45),
          ),
        )
      ],
    );
  }

  Widget _buildActionButtonsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Brochure button pressed');
              },
              text: 'Brochure',
              icon: Icon(
                FluentIcons.arrow_download_24_regular,
                size: 15.0,
                color: Colors.deepPurpleAccent,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                      color: Colors.deepPurpleAccent,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.deepPurpleAccent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
              child: FFButtonWidget(
            onPressed: () {
              print('Contact Us button pressed');
            },
            text: 'Contact Us',
            icon: Icon(
              FluentIcons.call_24_regular,
              size: 15.0,
              color: Colors.white,
            ),
            options: FFButtonOptions(
              elevation: 0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Colors.deepPurpleAccent,
              textStyle: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildAmenitiesFlipCardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Text(
            'Amenities View',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.flipCards.map((card) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: FlipCard(
                    autoFlipDuration: Duration(seconds: 3),
                    fill: Fill.fillBack,
                    direction: FlipDirection.HORIZONTAL,
                    speed: 400,
                    front: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          card.frontText,
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Manrope',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    back: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          card.imageUrl,
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }



  Widget _buildRequirementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Text(
            'Configurations',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.deepPurpleAccent,
                dividerColor: Colors.white,
                controller: _tabController,
                labelStyle: TextStyle(fontFamily: 'Manrope', fontSize: 12),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: Colors.deepPurpleAccent,
                tabs: _tabNames.map((tabName) => Tab(text: tabName)).toList(),
              ),
              SizedBox(
                height: 170, // Set a fixed height for TabBarView
                child: TabBarView(
                  dragStartBehavior: DragStartBehavior.start,
                  controller: _tabController,
                  children: _properties.map((property) {
                    return PropertyDetailsCard(
                      imageAsset: property.imageAsset,
                      reraId: property.reraId,
                      carpetArea: property.carpetArea,
                      price: property.price,
                      possessionDate: property.possessionDate,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PropertyDetailsCard extends StatelessWidget {
  final String imageAsset;
  final String reraId;
  final String carpetArea;
  final String price;
  final String possessionDate;

  const PropertyDetailsCard({
    Key? key,
    required this.imageAsset,
    required this.reraId,
    required this.carpetArea,
    required this.price,
    required this.possessionDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(width: 0.3, color: Colors.grey.withOpacity(0.4))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageAsset,
              width: 150,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 40, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPropertyDetailRow(
                    icon: FluentIcons.qr_code_24_regular,
                    label: 'Rera ID',
                    value: reraId,
                  ),
                  SizedBox(height: 8.0),
                  _buildPropertyDetailRow(
                    icon: FluentIcons.scale_fill_24_regular,
                    label: 'Carpet Area',
                    value: carpetArea,
                  ),
                  SizedBox(height: 8.0),
                  _buildPropertyDetailRow(
                    icon: FluentIcons.wallet_credit_card_24_regular,
                    label: 'Price',
                    value: price,
                  ),
                  SizedBox(height: 8.0),
                  _buildPropertyDetailRow(
                    icon: FluentIcons.calendar_24_regular,
                    label: 'Possession',
                    value: possessionDate,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 12,
          color: Colors.black87,
          weight: 0.2,
        ),
        SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: 20),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class PropertyDetails {
  final String imageAsset;
  final String reraId;
  final String carpetArea;
  final String price;
  final String possessionDate;

  PropertyDetails({
    required this.imageAsset,
    required this.reraId,
    required this.carpetArea,
    required this.price,
    required this.possessionDate,
  });
}

