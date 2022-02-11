import 'dart:async';

import 'package:final_eight_app/blocs/user_event.dart';
import 'package:final_eight_app/blocs/user_repository.dart';
import 'package:final_eight_app/models/shop.dart';
import 'package:final_eight_app/services/local_db.dart';
import 'package:final_eight_app/services/remote_db.dart';

class UserBloc {
  List<Data> _listOfUsersData = <Data>[];

  final _userStateController = StreamController<List<Data>>();
  StreamSink<List<Data>> get _inListOfUserData =>
      _userStateController.sink; // input
  Stream<List<Data>> get listOfUserData =>
      _userStateController.stream; // outPut

  final _userEventController = StreamController<UserEvent>();
  Sink<UserEvent> get listOfUserDataEventSink =>
      _userEventController.sink; // outPut

  UserBloc() {
    _userEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(UserEvent event) async {
    if (event is SetUserListFromLocadDB) {
      print("event -- -- - - -- - SetUserListFromLocadDB");

      _listOfUsersData =
          (await DBLocalHelper.dbProductHelper.getAllProductsFromDatabase())!;
    } else if (event is SetUserListFromRemotDB) {
      //  allproducts =await DBLocalHelper.dbProductHelper.getAllProductsFromDatabase();
      //allproducts = await DBRemoteHelper.dbRemoteHelper.getAllProducts();
      print("event -- -- - - -- - SetUserListFromRemotDB");
      _listOfUsersData =
          (await DBRemoteHelper.dbRemoteHelper.getAllProducts())!;
    } else if (event is CreateUser) {
      await DBRemoteHelper.dbRemoteHelper
          .createNewProduct(UserRepository.userRepository.newUser);
      await DBLocalHelper.dbProductHelper
          .insertInToDatabase(UserRepository.userRepository.newUser);
    } else if (event is DeleteUser) {
      int index = UserRepository.userRepository.curentIndex;
      await DBRemoteHelper.dbRemoteHelper
          .deleteProduct(_listOfUsersData[index].user!.id!);
      await DBLocalHelper.dbProductHelper
          .deleteOneUserFromDatabase(_listOfUsersData[index].user!.id!);
    }

    _inListOfUserData.add(_listOfUsersData);
  }

  void dispose() {
    _userStateController.close();
    _userEventController.close();
  }
}
