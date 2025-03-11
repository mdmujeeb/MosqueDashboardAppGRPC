import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../util/function_util.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();

  String _masjidId = '1';
  String _password = '';
  bool _isLoading = false;

  Future<void> _validateAndSubmitForm(context) async {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      // final result = await APIUtil.authenticate(_masjidId, _password);
      final result = {
        'resultCode': 0,
        'description': 'Authentication Successful!'
      };
      if (result['resultCode'] == 0) {
        bool res = await Provider.of<Auth>(context, listen: false)
            .successfulAuthentication(_masjidId, _password);
        if (res) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result['description'].toString()),
          ));
          Navigator.of(context).pop(true);
        } else {
          FunctionUtil.showErrorSnackBar(context);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result['description'].toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ));
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          color: Colors.grey,
          child: Container(
            height: 300,
            child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Form(
                  key: _form,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'Masjid Id'),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Masjid Id';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => _masjidId = value.toString(),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the Password';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => _password = value.toString(),
                      ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) =>
                                            Theme.of(context).primaryColor),
                                elevation: MaterialStateProperty.resolveWith(
                                    (states) => 4),
                              ),
                              child: Text('Login',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary)),
                              onPressed: () => _validateAndSubmitForm(context),
                            ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
