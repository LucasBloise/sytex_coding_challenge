import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/form_module.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SytexColors.scaffoldBackgroundColor,
      body: Column(
        children: const [LandingHeader(), LandingTitle(), LandingSubtitle(), LandingStartButton()],
      ),
    );
  }
}

class LandingStartButton extends StatelessWidget {
  const LandingStartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 26,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: SytexColors.sytexBlue,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          minimumSize: const Size(200, 60),
        ),
        onPressed: () {
          FormModule.navigateToFormPage(context);
        },
        child: const Text(
          'Get Started',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class LandingSubtitle extends StatelessWidget {
  const LandingSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        child: const Text(
          'A form with style by Lucas Bloise',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class LandingTitle extends StatelessWidget {
  const LandingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        'Sytex Coding Challenge',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class LandingHeader extends StatelessWidget {
  const LandingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: Stack(
        children: [
          Container(
            height: 550,
            decoration: const BoxDecoration(
              color: SytexColors.sytexBlueAcent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(130.0),
                bottomRight: Radius.circular(130.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: Image.asset('assets/images/sytexLogo.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
