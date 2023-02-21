import 'package:flutter/material.dart';
import 'package:nik_login/otp_value.dart';
import 'package:nik_login/otp_varification.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final value = Provider.of<otpValue>(context).value;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog box'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => otpValue(),
        child: Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.deepOrange[200],
              foregroundColor: Colors.green,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Verify OTP'),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            otpTextFormField(
                              index: 0, otp: value,
                            ),
                            otpTextFormField(
                              index: 1, otp: value,
                            ),
                            otpTextFormField(
                              index: 2, otp: value,
                            ),
                            otpTextFormField(
                              index: 3, otp: value,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                // print(value);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.deepPurple[200],
                                foregroundColor: Colors.white,
                              ),
                              child: Text('Verify'),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Text('Verify OTP'),
          ),
        ),
      ),
    );
  }
}
