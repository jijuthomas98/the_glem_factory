import 'package:flutter/material.dart';
import 'package:the_glem_factory/components/appWidgets/OnBoardPage.dart';
import 'package:the_glem_factory/components/appWidgets/getIndicator.dart';

import 'LoginPage.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9ceb8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      OnBoardPage(
                        img: 'ChooseYourService',
                        title: 'Choose your Service',
                        txt:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam et sem viverra, finibus ipsum non, dapibus nulla. ',
                      ),
                      OnBoardPage(
                        img: 'ScheduleAppointment',
                        title: 'Schedule Appointment',
                        txt:
                            'Schedule your day and your address to continew our service of home salon and enjoy the perks ',
                      ),
                      OnBoardPage(
                        img: 'BestHomeSalon',
                        title: 'Best Home Salon',
                        txt:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam et sem viverra, finibus ipsum non, dapibus nulla.  ',
                      ),
                      OnBoardPage(
                        img: 'ProfessionalAtHome',
                        title: 'Professional at Home',
                        txt:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam et sem viverra, finibus ipsum non, dapibus nulla. ',
                      ),
                      OnBoardPage(
                        img: 'PayLater',
                        title: 'Pay Later',
                        txt:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam et sem viverra, finibus ipsum non, dapibus nulla. ',
                      ),
                    ],
                    onPageChanged: (value) => {setCurrentPage(value)},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => GetIndicator(
                      pageNo: index,
                      cPageNo: currentPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: changePage,
            child: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffff7d85),
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  void changePage() {
    if (currentPage == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }
}
