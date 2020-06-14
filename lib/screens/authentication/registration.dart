import 'package:flutter/material.dart';
import 'package:getout/widgets/globalWidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _passwording = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  //Placeholders (TextField)

  PageController _controller;
  int _page = 0;
  int _numPage = 2;

  String _email, _password1, _firstName, _lastName, _password2, _phone;
  String gender;
  //Placeholders (Focus)
  final FocusNode focusLname = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPhone = FocusNode();
  final FocusNode focusPassword2 = FocusNode();
  //Placeholder (Form)
  final _formKey = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  //Placeholder (Obscurity)
  bool _isPasswordVisible = true;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPage; i++) {
      list.add(i == _page ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  //Page Indicator i.e Slider
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 24 : 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.black45,
      ),
    );
  }

  //Handle Text Field Inputs
  void _handleFirstNameInput(String value) {
    _firstName = value.trim();
    print(_firstName);
  }

  void _handleLastNameInput(String value) {
    _lastName = value.trim();
    print(_lastName);
  }

  void _handleEmailInput(String value) {
    _email = value.trim();
    print(_email);
  }

  void _handlePhoneInput(String value) {
    _phone = value.trim();
    print(_phone);
  }

  void _handlePassword1Input(String value) {
    _password1 = value.trim();
    print(_password1);
  }

  void _handlePassword2Input(String value) {
    _password2 = value.trim();
    print(_password2);
  }

  Widget _fnameTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusLname);
          },
          onSaved: _handleFirstNameInput,
          validator: (value) {
            //Check if fname exists
            if (value.isEmpty) {
              return 'Please provide your First Name';
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
            labelText: 'First Name',
          ),
        ));
  }

  Widget _lnameTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusEmail);
          },
          focusNode: focusLname,
          onSaved: _handleLastNameInput,
          validator: (value) {
            //Check if lname exists
            if (value.isEmpty) {
              return 'Please provide your Last Name';
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
            labelText: 'Last Name',
          ),
        ));
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
            FocusScope.of(context).requestFocus(focusPhone);
          },
          focusNode: focusEmail,
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
              labelText: 'Email'),
        ));
  }

  Widget _phoneTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          onSaved: _handlePhoneInput,
          autofocus: false,
          focusNode: focusPhone,
          validator: (value) {
            //Check if phone exists
            if (value.isEmpty) {
              return 'Please provide a phone number';
            }
            //Check if phone is not 10 digits
            if (value.length != 10) {
              return 'Your phone number should be 10 digits';
            }
            //Check if phone starts with '07'
            if (!value.startsWith('07')) {
              return 'Your phone number should start with 07';
            }
            return null;
          },
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            labelText: 'Phone Number',
          ),
        ));
  }

  void _signUpBtnPressed() {
    //Access form
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: 'male', child: Text('Male')),
    DropdownMenuItem(value: 'female', child: Text('Female'))
  ];

  Widget genderDropdown() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: DropdownButton(
        items: items,
        hint: Text(
          'Gender',
          style: GoogleFonts.muli(),
        ),
        isExpanded: true,
        value: gender,
        onChanged: (value) {
          setState(() {
            gender = value;
          });
        },
      ),
    );
  }

  Widget _password1TF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusPassword2);
            },
            validator: (value) {
              //Check if email exists
              if (value.isEmpty) {
                return 'Please provide a password';
              }
              //Check if @ sign exists
              if (value.length < 7) {
                return 'Password is too short';
              }
              return null;
            },
            controller: _passwording,
            obscureText: _isPasswordVisible,
            onSaved: _handlePassword1Input,
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ))));
  }

  Widget _password2TF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: TextFormField(
          focusNode: focusPassword2,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          controller: _confirmPass,
          autofocus: false,
          validator: (value) {
            if (value != _passwording.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          onSaved: _handlePassword2Input,
          autovalidate: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            labelText: 'Confirm Password',
          ),
        ));
  }

  Widget pageOne() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          _fnameTF(),
          SizedBox(
            height: 10,
          ),
          _lnameTF(),
          SizedBox(
            height: 10,
          ),
          _emailTF(),
          SizedBox(
            height: 10,
          ),
          _phoneTF(),
          SizedBox(
            height: 10,
          ),
          genderDropdown(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget pageTwo() {
    return Container(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          _password1TF(),
          SizedBox(
            height: 10,
          ),
          _password2TF(),
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
                'Sign Up',
                style: GoogleFonts.muli(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              onPressed: _signUpBtnPressed),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget registrationBody() {
    return Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 5),
        child: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              _page = value;
            });
          },
          children: [
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'GETOUT',
                      style: GoogleFonts.muli(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    pageOne(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        elevation: 5,
                        height: 55,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Next',
                              style: GoogleFonts.muli(
                                  textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                            )
                          ],
                        ),
                        onPressed: () {
                          if (_page == 0) {
                            final FormState formOne = _formKey.currentState;
                            if (formOne.validate()) {
                              formOne.save();

                               _controller.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.ease);
                            }
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _formKeyPass,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'GETOUT',
                      style: GoogleFonts.muli(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    pageTwo(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        elevation: 5,
                        height: 55,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Back',
                              style: GoogleFonts.muli(
                                  textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ],
                        ),
                        onPressed: () {
                          if (_page == 1) {
                            _controller.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.ease);
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            backGround(),
            registrationBody(),
          ],
        ),
      ),
    );
  }
}
