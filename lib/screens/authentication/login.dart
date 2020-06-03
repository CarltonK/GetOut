import 'package:flutter/material.dart';
import 'package:getout/widgets/globalWidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Placeholders (TextField)
  String _email, _password;
  //Placeholders (Focus)
  final FocusNode focusPassword = FocusNode();
  //Placeholder (Form)
  final _formKey = GlobalKey<FormState>();
  //Placeholder (Obscurity)
  bool _isPasswordVisible = true;

  //Handle Text Field Inputs
  void _handleEmailInput(String value) {
    _email = value.trim();
    print(_email);
  }

  void _handlePasswordInput(String value) {
    _password = value.trim();
    print(_password);
  }

  Widget _emailTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusPassword);
          },
          onSaved: _handleEmailInput,
          validator: (value) {
            //Check if email exists
            if (value.isEmpty) {
              return 'Please provide an email';
            }
            //Check if @ sign exists
            if (!value.contains('@') || !value.contains('.')) {
              return 'Please provide a valid email';
            }
            return null;
          },
          decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              labelText: 'Email',
              prefixIcon: Icon(Icons.email)),
        ));
  }

  Widget _passwordTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
          focusNode: focusPassword,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          onSaved: _handlePasswordInput,
          autofocus: false,
          validator: (value) {
            //Check if password exists
            if (value.isEmpty) {
              return 'Please provide a password';
            }
            //Check if password is more that 7 characters
            if (value.length < 7) {
              return 'Password is too short';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: _isPasswordVisible,
          decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              labelText: 'Password',
              prefixIcon: Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )),
        ));
  }

  void _signInBtnPressed() {
    //Access form
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  Widget loginBody() {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 100, left: 20, right: 20),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'GETOUT',
                style: GoogleFonts.muli(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 40,
              ),
              _emailTF(),
              SizedBox(
                height: 20,
              ),
              _passwordTF(),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  elevation: 5,
                  height: 55,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Colors.red,
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.muli(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  onPressed: _signInBtnPressed),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () => print('I want to reset my password'),
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              socialSignUp()
            ],
          ),
        ),
      ),
    );
  }

  Widget socialSignUp() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'or Sign In with',
            style: GoogleFonts.muli(
                textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
          ),
          _buildSocialBtnRow()
        ],
      ),
    );
  }

  //Social Buttons
  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () {},
            AssetImage(
              'assets/logos/google.png',
            ),
          ),
          _buildSocialBtn(
            () {},
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () {},
            AssetImage(
              'assets/logos/twitter.png',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            backGround(),
            loginBody(),
          ],
        ),
      ),
    );
  }
}
