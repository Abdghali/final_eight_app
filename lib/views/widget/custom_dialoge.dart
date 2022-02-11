import 'package:bloc/bloc.dart';
import 'package:final_eight_app/blocs/user_bloc.dart';
import 'package:final_eight_app/blocs/user_event.dart';
import 'package:final_eight_app/blocs/user_repository.dart';
import 'package:final_eight_app/models/shop.dart';
import 'package:final_eight_app/services/local_db.dart';
import 'package:final_eight_app/services/remote_db.dart';
import 'package:final_eight_app/views/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProductDialoge extends StatefulWidget {
  String? id;
  AddProductDialoge({Key? key, this.id}) : super(key: key);

  @override
  State<AddProductDialoge> createState() => _AddProductDialogeState();
}

class _AddProductDialogeState extends State<AddProductDialoge> {
  TextEditingController _fullNameTextEditingController =
      TextEditingController();
  TextEditingController _loginNameTextEditingController =
      TextEditingController();
  TextEditingController _phoneTextEditingController = TextEditingController();

  toastMessage(String text, Color color) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  createNew(UserBloc _bloc) {
    if (_fullNameTextEditingController.text.isEmpty ||
        _loginNameTextEditingController.text.isEmpty ||
        _phoneTextEditingController.text.isEmpty) {
      toastMessage("please Fill all feaild", Colors.red);
    } else {
      User user = User(
        fullName: _fullNameTextEditingController.text,
        loginName: _loginNameTextEditingController.text,
        phone: _phoneTextEditingController.text,
        commission: "1",
        password: "123456",
        image: null,
        dateWork: "2222-10-10",
        address: "Rafah",
        card: "1111111111444",
        accountNumber: "566",
        purchaseCommission: "22",
        accountType: "1",
      );
      UserRepository.userRepository.newUser = user;
      _bloc.listOfUserDataEventSink.add(CreateUser());
      _bloc.listOfUserDataEventSink.add(SetUserListFromRemotDB());
      Navigator.pop(context);
      toastMessage(
          "User Added successfully", Color.fromARGB(255, 194, 216, 195));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = UserBloc();

    return AlertDialog(
      backgroundColor: Colors.green[200],
      title: Text("Create New User"),
      content: Container(
        height: 300,
        child: Column(
          children: [
            CustomTextFormField(
              onchange: (_) {},
              textEditingController: _fullNameTextEditingController,
              key: Key('full_name'),
              labelText: "Full Name",
            ),
            CustomTextFormField(
              textEditingController: _loginNameTextEditingController,
              onchange: (_) {},
              key: Key('login_name'),
              labelText: "Login Name",
            ),
            CustomTextFormField(
              textEditingController: _phoneTextEditingController,
              onchange: (_) {},
              key: Key('phone'),
              labelText: "Phone Number",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: FloatingActionButton(
                  elevation: 0.0,
                  child: new Icon(Icons.done),
                  backgroundColor: Colors.green[600],
                  onPressed: () async {
                    createNew(_bloc);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
