import 'package:exam_m6/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoginFailed = true;
  bool _isEmailInvalid = true;



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _login() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Email validation check
    if (!email.contains('@') || !email.contains('.')) {
      setState(() {
        _isEmailInvalid = true;
        _isLoginFailed = false;
      });
      return;
    }

    if (email == 'exam@modul6.com' && password == 'Modul6exam') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    } else {
      setState(() {
        _isLoginFailed = true;
        _isEmailInvalid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 50),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFFF5F4F7),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFF242B5C),
                  fontSize: 25,
                  fontFamily: "Lato-light",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.75,
                ),
                children: [
                  TextSpan(text: "Create your "),
                  TextSpan(
                    text: "account",
                    style: TextStyle(
                      fontFamily: "Lato-bold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'quis nostrud exercitation ullamco laboris nisi ut',
              style: TextStyle(
                color: Color(0xFF53577A),
                fontSize: 12,
                fontFamily: 'Lato-light',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.36,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 15, top: 15),
                suffix: const Image(
                  image: AssetImage("assets/images/person.png"),
                ),
                filled: true,
                fillColor: const Color(0xFFF5F4F7),
                labelText: "Full name",
                labelStyle: const TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 12,
                  letterSpacing: 0.36,
                ),
                hintText: "Enter your full name",
                hintStyle: const TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 12,
                  letterSpacing: 0.36,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFFF5F4F7),
                    width: 0.1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 0.1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 15, top: 15),
                suffix: const Image(
                  image: AssetImage("assets/images/email.png"),
                ),
                filled: true,
                fillColor: const Color(0xFFF5F4F7),
                labelText: "Email",
                labelStyle: const TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 12,
                  letterSpacing: 0.36,
                ),
                hintText: "Enter your email",
                hintStyle: const TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 12,
                  letterSpacing: 0.36,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFFF5F4F7),
                    width: 0.1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 0.1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 15, top: 15),
                suffix: const Image(
                  image: AssetImage("assets/images/lock.png"),
                ),
                filled: true,
                fillColor: const Color(0xFFF5F4F7),
                labelText: "Password",
                labelStyle: const TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 12,
                  letterSpacing: 0.36,
                ),
                hintText: "Enter your password",
                hintStyle: const TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 12,
                  letterSpacing: 0.36,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFFF5F4F7),
                    width: 0.1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 0.1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Terms of service",
                  style: TextStyle(
                    color: Color(0xFF1F4C6B),
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.36,
                  ),
                ),
                GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Text(
                    _isPasswordVisible ? 'Hide password' : 'Show password',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFF1F4C6B),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.36,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8BC83F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordPage(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Duration timerDuration = const Duration(seconds: 60);
    int timerValue = 60;

    Timer? timer;

    void _cancelTimer() {
      timer?.cancel();
    }

    void _startTimer() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        timerValue--;

        if (timerValue == 0) {
          _cancelTimer();
        }
      });
    }

    _startTimer();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 50),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFFF5F4F7),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Enter the ',
                    style: TextStyle(
                      color: Color(0xFF242B5C),
                      fontSize: 25,
                      fontFamily: 'Lato-bold',
                      letterSpacing: 0.75,
                    ),
                  ),
                  TextSpan(
                    text: 'code',
                    style: TextStyle(
                      color: Color(0xFF1F4C6B),
                      fontSize: 25,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 90),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFF53577A),
                  fontSize: 12,
                  fontFamily: 'Lato-bold',
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.36,
                ),
                children: [
                  TextSpan(
                    text: 'Enter the 4 digit code that we just sent to \n',
                  ),
                  TextSpan(
                    text: 'jonathan@email.com',
                    style: TextStyle(
                      color: Color(0xFF242B5C),
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
                width: 65,
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F4F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 65,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F4F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFF5F4F7),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 65,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F4F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 65,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F4F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 160, right: 160, top: 250),
            child: GestureDetector(
              onTap: _startTimer,
              child: SizedBox(
                height: 50,
                width: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F4F7),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '00:$timerValue', // Display timer value
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Color(0xFF53577A),
                  fontSize: 12,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.36,
                ),
                children: [
                  TextSpan(
                    text: 'Didn’t receive the OTP? ',
                  ),
                  TextSpan(
                    text: 'Resend OTP',
                    style: TextStyle(
                      color: Color(0xFF234F68),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.36,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
