import 'package:flutter/material.dart';
import 'package:fpauth/local_auth.dart';
import 'package:fpauth/screens/home_page.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 36.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: 'Quick login with touch ID!',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n Use your ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Fingerprint ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                    TextSpan(
                      text: 'to LOGIN ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ]),
            ),
            const SizedBox(
              height: 40.0,
            ),

            const Icon(
              Icons.fingerprint_sharp,
              color: Colors.black,
              size: 84.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                final isAuthenticated = await LocalAuth.authenticate();

                if (isAuthenticated) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const HomePage();
                  }));
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logged in successfully!')));
                }
              },
              child: const Text(
                'Use Touch ID',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.question_answer_outlined),
      ),
    );
  }
}
