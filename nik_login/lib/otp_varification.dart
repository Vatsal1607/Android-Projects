import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class otpTextFormField extends StatelessWidget {
  otpTextFormField({required this.index, required this.otp});

  int index;
  String otp;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 50,
      child: TextFormField(
        autofocus: true,
        showCursor: false,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
        onChanged: (value){
          if(value.length == 1){
            if(index < 3){
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
            otp = value;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
      ),
    );
  }
}