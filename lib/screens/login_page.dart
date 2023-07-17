import 'package:exam_m6/screens/register_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoginFailed = false;
  bool _isPasswordVisible = false;
  bool _isEmailInvalid = false;

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
      body: Center(
        child: ListView(
          children: [
            const Image(
              image: AssetImage("assets/images/city.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, bottom: 20),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Color(0xFF242B5C),
                    fontSize: 25,
                    letterSpacing: 0.75,
                    fontFamily: "Lato",
                  ),
                  children: [
                    TextSpan(text: "Let's"),
                    TextSpan(
                      text: " Sign In",
                      style: TextStyle(
                        fontFamily: "Lato-bold",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 35),
              child: Text(
                'quis nostrud exercitation ullamco laboris nisi ut',
                style: TextStyle(
                  color: Color(0xFF53577A),
                  fontSize: 12,
                  fontFamily: 'Lato-light',
                  letterSpacing: 0.36,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: _emailController,
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  errorText: _isEmailInvalid ? "Invalid email" : null, // Added error text
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.emailAddress,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 15, top: 15),
                  suffix: const Image(image: AssetImage("assets/images/lock.png"),),
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
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Forgot password?",
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
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 15),
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
                  onPressed: _login,
                  child: const Center(
                    child: Text(
                      "Login",
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                  width: 170,
                  child: Divider(
                    color: Color(0xFFA1A4C1),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA1A4C1),
                      fontSize: 10,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 170,
                  child: Divider(
                    color: Color(0xFFA1A4C1),
                    height: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 25, bottom: 130),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F4F7),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage("assets/images/google.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F4F7),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage("assets/images/facebook.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Color(0xFF53577A),
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.36,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.36,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}