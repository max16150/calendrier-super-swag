import 'package:flutter/material.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions d\'utilisation'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article 1
            Text(
              'Article 1. DÉFINITIONS',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16.0, height: 1.5),
                  children: [
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 16.0),

            // Article 2
            Text(
              'Article 2. APPLICATION',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16.0, height: 1.5),
                  children: [
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    ),
                    //autres contenus
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 16.0),
            // autres contenus
          ],
        ),
      ),
    );
  }
}
