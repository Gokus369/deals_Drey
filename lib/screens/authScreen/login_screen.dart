import 'package:dealsdray/constants/colors.dart';
import 'package:dealsdray/screens/authScreen/otp_screen.dart';
import 'package:dealsdray/screens/homeScreen/homescreen.dart';
import 'package:flutter/material.dart';

import '../../constants/paths.dart';
import '../widgets/route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  final referal = TextEditingController();
  final passCntrl = TextEditingController();
  final emailCntrl = TextEditingController();
  final phNoCntrl = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8, top: s * .08),
            child: Column(
              children: [
                Image.asset(
                  Paths.logo,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: s * .50,
                  height: s * .11,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TabBar(
                    controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: ColorsData.primaryColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'Phone'),
                      Tab(text: 'Email'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      phoneSec(s),
                      emailSec(s),
                    ],
                  ),
                ),
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

  Widget phoneSec(double s) {
    return Padding(
      padding: EdgeInsets.fromLTRB(s * .08, s * .10, s * .10, 0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Form(
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Glad to see you!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: s * .05),
                const Text(
                  'Please provide your phone number',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff959595),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: s * .15),
                fields(
                  labelText: 'Phone',
                  controller: phNoCntrl,
                  digit: true,
                  regExpCondition: RegExp('[0-9]'),
                  errorText: 'This field is required',
                  passwordField: false,
                ),
                SizedBox(height: s * .07),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    s * .04,
                    s * .04,
                    s * .04,
                    s * .04,
                  ),
                  height: s * .12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: ColorsData.primaryColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      final isValid = _formKey1.currentState!.validate();
                      if (isValid) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OtpScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Send Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsData.whiteColor,
                        fontSize: 17,
                      ),
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

  Widget emailSec(double s) {
    return Padding(
      padding: EdgeInsets.fromLTRB(s * .08, s * .10, s * .10, 0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Let\'s Begin!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: s * .05),
                const Text(
                  'Please enter your credentials to proceed',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff959595),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: s * .15),
                fields(
                  labelText: 'Your Email',
                  controller: emailCntrl,
                  digit: false,
                  regExpCondition: RegExp(r'\S+@\S+\.\S+'),
                  errorText: 'This field is required',
                  passwordField: false,
                ),
                fields(
                  labelText: 'Create Password',
                  controller: passCntrl,
                  errorText: 'This field is required',
                  digit: false,
                  regExpCondition: RegExp(r'[a-zA-Z]+\S'),
                  passwordField: true,
                ),
                fields(
                  errorText: 'This field is required',
                  labelText: 'Referral Code (Optional)',
                  controller: referal,
                  digit: false,
                  regExpCondition: RegExp(r'[a-zA-Z]+\S'),
                  passwordField: false,
                ),
                SizedBox(height: s * .18),
                GestureDetector(
                  onTap: () {
                    final isValid = _formKey2.currentState!.validate();
                    if (isValid) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          FadeRoute(
                            page: const MyHomePage(),
                          ),
                          (route) => false);
                    }
                  },
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          s * .04,
                          s * .03,
                          s * .04,
                          s * .03,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: ColorsData.primaryColor,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 27,
                          color: ColorsData.whiteColor,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fields({
    String? errorText,
    required String labelText,
    RegExp? regExpCondition,
    String? regErrorText,
    required TextEditingController controller,
    required bool digit,
    required bool passwordField,
  }) {
    return TextFormField(
      keyboardType: digit ? TextInputType.number : null,
      controller: controller,
      style: const TextStyle(
        color: Color(0xff5B5B5B),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      obscureText: passwordField ? showPassword : false,
      decoration: InputDecoration(
        helperText: "",
        helperMaxLines: 2,
        isDense: false,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(.5),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffafafaf), width: 1.0),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffafafaf), width: 1.2),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffafafaf)),
          borderRadius: BorderRadius.circular(9),
        ),
        suffixIcon: passwordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    if (controller == passCntrl) {
                      showPassword = !showPassword;
                    }
                  });
                },
                icon: controller == passCntrl
                    ? Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: ColorsData.blackColor,
                      )
                    : Icon(
                        showConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                      ),
              )
            : null,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return errorText;
        }
        if (!regExpCondition!.hasMatch(value)) {
          return regErrorText;
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }
}
