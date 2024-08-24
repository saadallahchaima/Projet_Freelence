import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appBar.dart';
import '../../components/navbara.dart';

import '../../theme/AppTheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Metier> metierList = [
    Metier('assets/images/img_6.png', 'Design Graphique', 4.9, 'A distance', 'Expert', 'Nourhene Bakalti', true),
    Metier('assets/images/menage.jpeg', 'Menage', 4.9, 'Paris', 'Professionnel', 'Mark Marker', false),
    Metier('assets/images/img_5.png', 'Plombier', 4.9, 'Paris', 'Professionnel', 'Mark Marker', false),
    Metier('assets/images/img_11.png', 'Menage', 4.9, 'Paris', 'Professionnel', 'Mark Marker', false),

  ];

// List of Demande objects
  final List<Demande> demandeList = [
    Demande(
      'assets/images/img_6.png',
      'Design Graphique',
      '4 Rue de l\'Abbé Groult, 75015 Paris',
      '20€ - 40€',
      'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      Metier('assets/images/img_6.png', 'Design Graphique', 4.9, 'A distance', 'Expert', 'Nourhene Bakalti', true),
    ),
    Demande(
      'assets/images/menage.jpeg',
      'Menage',
      '4 Rue de l\'Abbé Groult, 75015 Paris',
      '20€ - 40€',
      'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      Metier('assets/images/menage.jpeg', 'Menage', 4.9, 'Paris', 'Professionnel', 'Nourhene Bakalti', false),
    ),
    Demande(
      'assets/images/img_5.png',
      'Plombier',
      '4 Rue de l\'Abbé Groult, 75015 Paris',
      '20€ - 40€',
      'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      Metier('assets/images/img_5.png', 'Plombier', 4.9, 'Paris', 'Professionnel', 'Nourhene Bakalti', false),
    ),
  ];
  final List<Offre> offreList = [
    Offre(
      'assets/images/img_9.png',
      'Table de mixage',
      '4 Rue de l\'Abbé Groult, 75015 Paris',
      '250€/heure',
      'VTable de mixage à louer + jeux de lumière',
      Metier('assets/images/img_6.png', 'Design Graphique', 4.9, 'A distance', 'Expert', 'Nourhene Bakalti', true),
    ),
    Offre(
      'assets/images/img_9.png',
      'Table de mixage',
      '4 Rue de l\'Abbé Groult, 75015 Paris',
      '250€/heure',
      'VTable de mixage à louer + jeux de lumière',
      Metier('assets/images/menage.jpeg', 'Menage', 4.9, 'Paris', 'Professionnel', 'Nourhene Bakalti', false),
    ),
    Offre(
      'assets/images/img_9.png',
      'Table de mixage',
      '4 Rue de l\'Abbé Groult, 75015 Paris',
      '250€/heure',
      'VTable de mixage à louer + jeux de lumière',
      Metier('assets/images/img_5.png', 'Plombier', 4.9, 'Paris', 'Professionnel', 'Nourhene Bakalti', false),
    ),
  ];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        notificationIcon: Image.asset(
          "assets/icons/notification.png",  // Icône personnalisée
          width: 20.w,
          height: 20.h,
        ),
        title: 'Acceuil',  // Titre personnalisé
      ), // Use the new CustomAppBar

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Verified Pros',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Stack(
              children: [
                Container(
                  height: 250.h,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: metierList.length,
                    itemBuilder: (context, index) {
                      return _buildListItem(context, index);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Best Offers',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: metierList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return _buildListItem(context, index);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Demandes recentes',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF0099D6),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                constraints: BoxConstraints(
                  maxWidth: 330.w,
                  maxHeight: 278.h,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(16.0),
                  itemCount: demandeList.length,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(), // Ensure it scrolls
                  itemBuilder: (context, index) {
                    return _buildListItem2(context, index);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Offres de location',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7AA1E),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                constraints: BoxConstraints(
                  maxWidth: 330.w,
                  maxHeight: 278.h,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(16.0),
                  itemCount: offreList.length,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(), // Ensure it scrolls
                  itemBuilder: (context, index) {
                    return _buildListItem3(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }


  Widget _buildListItem(BuildContext context, int index) {
    Metier metier = metierList[index];

    Color borderColor = metier.verified ? Colors.green : Colors.orange;

    return Container(
      width: 200.w,
      height: 250.h,
      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          child: Stack(
            children: [
              Image.asset(
                metier.imagePath,
                fit: BoxFit.cover,
                width: 200.w,
                height: 250.h,
              ),
              Container(
                width: 200.w,
                height: 250.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  width: 30.sp,
                  height: 30.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 17.83.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  width: 30.sp,
                  height: 30.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.white,
                      size: 17.83.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.h,
                left: 8.w,
                right: 8.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metier.name,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      metier.name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: metier.expertise == 'Expert' ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(7.51.w),
                      ),
                      child: Text(
                        metier.expertise,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_border_outlined, color: Colors.white, size: 16.sp),
                            SizedBox(width: 2.w),
                            Text(
                              metier.rating.toString(),
                              style: TextStyle(
                                fontSize: 7.96.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.white),
                            SizedBox(width: 2.w),
                            Text(
                              metier.location,
                              style: TextStyle(
                                fontSize: 7.96.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
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
  Widget _buildListItem2(BuildContext context, int index) {
    Demande demande = demandeList[index];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF0099D6).withOpacity(1),
            spreadRadius: 10,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjust the size of the image
              ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.asset(
                  demande.imagePath,
                  width: 137.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      demande.serviceName,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      demande.date,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Row(
                 children: [   ClipOval(
                      child: Image.asset(
                       metierList[0].imagePath,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Text(
                      demande.metier.professionalName,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey,
                      ),
                    ),
                      ],
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "Budget: ${demande.priceRange}",
                      style: TextStyle(
                        fontSize: 10.43.sp,
                        color: Color(0xFF525252),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.blue, size: 16.sp),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  demande.location,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListItem3(BuildContext context, int index) {
    Offre offre = offreList[index];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF7AA1E).withOpacity(1),
            spreadRadius: 10,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjust the size of the image
              ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.asset(
                  offre.imagePath,
                  width: 137.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offre.offreName,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      offre.desc,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Row(
                      children: [   ClipOval(
                        child: Image.asset(
                          metierList[0].imagePath,
                          width: 20.w, // Diameter of the circle
                          height: 20.h, // Diameter of the circle
                          fit: BoxFit.cover,
                        ),
                      ),

                        Text(
                          offre.metier.professionalName,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "Budget: ${offre.prix}",
                      style: TextStyle(
                        fontSize: 10.43.sp,
                        color: Color(0xFF525252),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h), // Add space between the rows
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.blue, size: 16.sp),
              SizedBox(width: 4.w),
              Expanded( // Ensure the text wraps within the container
                child: Text(
                  offre.location,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}

// Classe Metier
class Metier {
  final String imagePath;
  final String name;
  final double rating;
  final String location;
  final String expertise;
  final String professionalName;
  final bool verified;

  Metier(this.imagePath, this.name, this.rating, this.location, this.expertise, this.professionalName, this.verified);
}

// Classe Demande
class Demande {
  final String imagePath;
  final String serviceName;
  final String location;
  final String priceRange;
  final String date;
  final Metier metier;

  Demande(this.imagePath, this.serviceName, this.location, this.priceRange, this.date, this.metier);
}
class Offre {
  final String imagePath;
  final String offreName;
  final String location;
  final String prix;
  final String desc;
  final Metier metier;

  Offre(this.imagePath, this.offreName, this.location, this.prix, this.desc, this.metier);
}
