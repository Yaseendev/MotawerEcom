import 'package:flutter/material.dart';

enum ButtonState { idle, loading }

class LoginButton extends StatefulWidget {
  final VoidCallback onPress;
  const LoginButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  ButtonState buttonState = ButtonState.idle;
  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    final isStretched = isAnimating || buttonState == ButtonState.idle;
    return Container(
      alignment: Alignment.center,
      child: AnimatedContainer(
        width: buttonState == ButtonState.idle
            ? MediaQuery.of(context).size.width
            : 80,
        duration: Duration(milliseconds: 250),
        onEnd: () => setState(() => isAnimating = !isAnimating),
        curve: Curves.easeIn,
        child: isStretched
            ? ElevatedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    buttonState = ButtonState.loading;
                  });
                  await Future.delayed(Duration(seconds: 3));
                  setState(() {
                    buttonState = ButtonState.idle;
                  });
                  // if (widget._formKey.currentState!.validate()) {
                  // context.read<AccountBloc>().add(
                  //     LoginWithEmailEvent(email: email, password: password));

                  //}
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 35)),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(12),
                child: Center(
                    child: CircularProgressIndicator(color: Colors.white)),
              ),
      ),
    );
  }
}
