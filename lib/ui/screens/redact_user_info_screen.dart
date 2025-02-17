import 'package:flutter/material.dart';
import 'package:flutter_application_2/user_state.dart';
import 'package:flutter_gradient_button/flutter_gradient_button.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';

class RedactUserInfoScreen extends StatefulWidget {
  const RedactUserInfoScreen({super.key});

  @override
  _RedactUserInfoScreenState createState() => _RedactUserInfoScreenState();
}

class _RedactUserInfoScreenState extends State<RedactUserInfoScreen> {

  var _inputedFirstName = "";
  var _inputedLastName = "";

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: getBlueWhiteGradient(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _appbar(context),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: 144,
                    height: 144,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.5)),
                    child: Icon(Icons.photo_camera, size: 64),
                  )),
              _fields(context),
              const Spacer(),
              GradientButton(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  colors: getPurpleWhiteGradient(),
                  height: 45,
                  width: 300,
                  gradientDirection: GradientDirection.leftToRight,
                  text: "Сохранить",
                  onPressed: () {
                    userState.changeFirstName(_inputedFirstName);
                    userState.changeLastName(_inputedLastName);
                    Navigator.pop(context);
                  },
              ),
              Padding(padding: EdgeInsets.only(bottom: 16))
            ],
          ),
        ),
      ),
    );
  }

  Widget _fields(BuildContext context) {
    final userState = Provider.of<UserState>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        spacing: 20,
        children: [
          TextFormField(
            onChanged: (text) {
              _inputedFirstName = text;
            },
            initialValue: userState.firstName,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Имя",
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: "Введите имя...",
              hintStyle: TextStyle(color: Colors.white54),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              filled: false,
              isDense: true,
            ),
            cursorColor: Colors.white,
          ),
          TextFormField(
            onChanged: (text) {
              _inputedLastName = text;
            },
            initialValue: userState.lastName,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Фамилия",
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: "Введите фамилию...",
              hintStyle: TextStyle(color: Colors.white54),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              filled: false,
              isDense: true,
            ),
            cursorColor: Colors.white,
          )
        ],
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title: Text("Редактирование профиля",
            style: Theme.of(context).textTheme.bodyLarge));
  }
}
