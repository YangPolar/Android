import 'dart:convert';

import 'package:amazon_clone_tutorial/constants/error_handling.dart';
import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:amazon_clone_tutorial/features/home/screens/home_screen.dart';
import 'package:amazon_clone_tutorial/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amazon_clone_tutorial/providers/user_provider.dart';

class AuthService {
  void signUpUser ({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          //cart: [],
          token: ''
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account Created!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser ({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle (
          response: res,
          context: context,
          onSuccess: () async {
            // Save token data into app memory
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // Use provider to save login user data so it can pass to other app.
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}