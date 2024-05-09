import 'package:carousel_slider/carousel_slider.dart';
import 'package:dealsdray/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/paths.dart';
import '../../models/home_models.dart';
import 'components/home_listitems.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = CarouselController();
  int firstCurrentPos = 0;
  int bottomCurrentPos = 0;
  List bottomBanner = [
    "assets/images/cara2.png",
    "assets/images/cara3.png",
  ];

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(s),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            carouselSlider(s, context),
            SizedBox(height: s * .02),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xff8286f1),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const Text(
                    "KYC Pending",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsData.whiteColor,
                    ),
                  ),
                  SizedBox(height: s * .04),
                  const Text(
                    "You need to provide the required \ndocuments for your account activation",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ColorsData.whiteColor,
                    ),
                  ),
                  SizedBox(height: s * .04),
                  const Text(
                    "Click Here",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsData.whiteColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(height: s * .02),
            categories(),
            SizedBox(height: s * .06),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff5fafca),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  exclusive(),
                  homeProductGrid(context: context),
                  SizedBox(height: s * .06),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget exclusive() {
    return const Padding(
      padding: EdgeInsets.all(14.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "EXCLUSIVE FOR YOU",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsData.whiteColor,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: ColorsData.whiteColor,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget categories() {
    return SizedBox(
        height: 118,
        child: ListView.builder(
          itemCount: category.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemExtent: 100,
          itemBuilder: ((context, index) => Column(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          '${category[index].imageUrl}',
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${category[index].catgryNme}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ));
  }

  Widget carouselSlider(double s, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: s * .03, top: s * .03),
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          autoPlay: false,
          height: MediaQuery.of(context).size.width * .49,
          viewportFraction: 0.90,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          onPageChanged: (index, reason) {
            setState(() {
              bottomCurrentPos = index;
            });
          },
        ),
        items: bottomBanner
            .map(
              (item) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  AppBar appBar(double s) {
    return AppBar(
      toolbarHeight: 75,
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        SizedBox(width: s * .14),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, s * .03, 0, s * .02),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here',
                contentPadding: const EdgeInsets.only(top: 8, left: 10),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                isDense: true,
                fillColor: const Color(0xffEFEFEF),
                filled: true,
                suffixIcon: const Icon(
                  Icons.search,
                  size: 23,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Paths.appLogo,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: ColorsData.blackColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  int index = 0;
  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 28,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            size: 28,
          ),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.ac_unit,
            size: 28,
          ),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: 28,
          ),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2,
            size: 28,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: index,
      unselectedItemColor: Colors.grey,
      // selectedItemColor: primaryColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      selectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
    );
  }
}
