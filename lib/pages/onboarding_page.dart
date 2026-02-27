import 'package:flutter/material.dart';
import 'package:henoflix/pages/signin_page.dart';
import 'package:henoflix/widgets/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        leading: const Image(image: AssetImage("assets/images/symbol.png")),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Privacy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sing In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },

            children: const [
              Onboarding(
                title: 'Unlimited movies, TV shows, and more.',
                subTitle: 'Watch anywhere, Cancel anytime.',
                image: 'assets/images/ob1.jpg',
              ),
              Onboarding(
                title: 'There is a plan for every fan',
                subTitle: 'Plan starting at \$2.99 /month',
                image: 'assets/images/ob2.jpg',
              ),
              Onboarding(
                title: 'Cancel online anytime',
                subTitle: 'Join today, no reason to wait',
                image: 'assets/images/ob3.jpg',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 5),
                      height: 10,
                      width: _currentPage == index
                          ? 30
                          : 10, // pour dire si je suis sur la page soit à largeur 30 sinon soit à 10
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.red
                            : Colors
                                  .grey, // pour dire si je suis sur la page soit de couleur rouge sinon soit de couleur grise
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text("Get Started"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
