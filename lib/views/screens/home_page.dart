import 'dart:async';

import 'package:final_eight_app/blocs/user_bloc.dart';
import 'package:final_eight_app/blocs/user_event.dart';
import 'package:final_eight_app/blocs/user_repository.dart';
import 'package:final_eight_app/models/shop.dart';
import 'package:final_eight_app/services/local_db.dart';
import 'package:final_eight_app/services/remote_db.dart';
import 'package:final_eight_app/views/widget/custom_dialoge.dart';
import 'package:final_eight_app/views/widget/custom_material_button.dart';
import 'package:final_eight_app/views/widget/product_card.dart';
import 'package:flutter/material.dart';

// dddd
// dddd
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data>? allproducts = [];
  final _bloc = UserBloc();

  fetchData() async {
    ButtonFetchData = false;
    setState(() {});
     Timer(Duration(seconds: 2), () async {
     _bloc.listOfUserDataEventSink.add(SetUserListFromRemotDB());
      });
  }

  bool ButtonFetchData = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
          centerTitle: true,
          backgroundColor: Colors.green[300],
        ),
        body: ButtonFetchData == true
            ? Center(
              child: CustomMaterialButton(
                  title: "FetchData",
                  buttonColor: Colors.green,
                  textColor: Colors.white,
                  onClick: () {
                    print("fetchData");
                    fetchData();
                    setState(() {});
                  },
                ),
            )
            :
             StreamBuilder<List<Data>>(
                stream: _bloc.listOfUserData,
                initialData: [],
                builder: (BuildContext context,
                        AsyncSnapshot<List<Data>> snapshot) =>
                    snapshot.data!.isNotEmpty
                        ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return UserItemCard(
                                imageUrl: 'assets/images/mentalhealth.jpeg',
                                productName:
                                    snapshot.data![index].user!.fullName,
                                price: snapshot.data![index].user!.phone,
                                delete: () async {
                                  UserRepository.userRepository.curentIndex = index;
                                  _bloc.listOfUserDataEventSink.add(DeleteUser());
                                   fetchData();
                                },
                              );
                            })
                        : const Center(child: CircularProgressIndicator()),
              ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: const Icon(Icons.add),
            backgroundColor: Colors.green[600],
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AddProductDialoge(
                        id: "${allproducts!.length += 1}",
                      )).then((value) => fetchData());
            }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
