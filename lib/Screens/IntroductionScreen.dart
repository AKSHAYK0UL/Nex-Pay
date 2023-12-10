import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Widgets/IntroductionWiget.dart';
import 'InternetScreen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _controller = PageController();
  bool onlastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) => setState(() {
              index == 3 ? onlastPage = true : onlastPage = false;
            }),
            controller: _controller,
            children: [
              IntoductionWidget('assets/image1.json'),
              IntoductionWidget('assets/image2.json'),
              IntoductionWidget('assets/image3.json'),
              IntoductionWidget('assets/image4.json'),
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: onlastPage == false
                      ? () => _controller.jumpToPage(3)
                      : null,
                  child: Text(
                    onlastPage == false ? 'Skip' : '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  effect: const SwapEffect(),
                  controller: _controller,
                  count: 4,
                ),
                onlastPage
                    ? TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(InternetScreen.routeName);
                          Hive.box('firsttime').add(1);
                          print(Hive.box('firsttime').length);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
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
