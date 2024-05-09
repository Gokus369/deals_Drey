import 'dart:async';
import 'package:dealsdray/screens/homeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import '../../constants/paths.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _regKey = GlobalKey<FormState>();
  final _fieldOne = TextEditingController();
  final _fieldTwo = TextEditingController();
  final _fieldThree = TextEditingController();
  final _fieldFour = TextEditingController();
  final focus = FocusNode();

  int secondsRemaining = 80;
  bool enableResend = false;
  late Timer timer;

  int _minutes = 1;
  int _seconds = 30;
  late Timer _timer;

  @override
  initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_minutes == 0 && _seconds == 0) {
          _timer.cancel();
        } else if (_seconds == 0) {
          _minutes--;
          _seconds = 59;
        } else {
          _seconds--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size.width;
    String timerText = '0$_minutes : ${_seconds.toString().padLeft(2, '0')}';
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: s * .08, right: s * .18, top: s * .3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Paths.phIcon,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: s * .05),
                const Text(
                  'We have sent a unique OTP number \nto your mobile number ',
                  style: TextStyle(
                    height: 1.6,
                    fontSize: 18,
                    color: Color(0xff959595),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: s * .15),
                Form(
                  key: _regKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      otpInput(
                        autoFocus: true,
                        _fieldOne,
                        context: context,
                      ),
                      SizedBox(width: s * .07),
                      otpInput(
                        _fieldTwo,
                        autoFocus: true,
                        context: context,
                      ),
                      SizedBox(width: s * .07),
                      otpInput(
                        _fieldThree,
                        autoFocus: true,
                        context: context,
                      ),
                      SizedBox(width: s * .07),
                      otpInput(
                        _fieldFour,
                        autoFocus: true,
                        context: context,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: s * .07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' $timerText',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        resendCode();
                      },
                      child: const Text(
                        'SEND AGAIN',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SafeArea(
            child: IconButton(
              padding: EdgeInsets.only(left: s * .04, top: s * .02),
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> resendCode() async {
    setState(() {
      _minutes = 1;
      _seconds = 0;
      _startTimer();
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  Widget otpInput(
    TextEditingController controller, {
    required context,
    required bool autoFocus,
  }) {
    var size = MediaQuery.of(context).size.width;
    return SizedBox(
      height: size * .14,
      width: size * .13,
      child: TextFormField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 21,
        ),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          isDense: true,
          counterText: '',
          hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '';
          }
          return null;
        },
        onChanged: (value) {
          // if (value.length == 1) {
          //   FocusScope.of(context).nextFocus();
          // }

          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            if (_fieldOne.text.length == 1 &&
                _fieldTwo.text.length == 1 &&
                _fieldThree.text.length == 1 &&
                _fieldFour.text.length == 1) {
              String otp = _fieldOne.text +
                  _fieldTwo.text +
                  _fieldThree.text +
                  _fieldFour.text;
              Future.delayed(
                const Duration(milliseconds: 300),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
