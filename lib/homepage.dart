import 'package:api_app/model/model.dart';
import 'package:api_app/repo/repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/homebloc/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list))],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          List<UserModel> userlist = state.userdata;
          return ListView.builder(
              itemCount: userlist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print(userlist);
                  },
                  child: ListTile(
                    title: Text(
                        "${userlist[index].firstName} ${userlist[index].lastName}"),
                    subtitle: Text("${userlist[index].email}"),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(userlist[index].avatar.toString()),
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }
}
