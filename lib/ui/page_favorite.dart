import 'dart:math';

import 'package:aplikasi/bloc/user_bloc.dart';
import 'package:aplikasi/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageFavorite extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: (Text("MVVM")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Tekan saya"),
            onPressed: () {
              bloc.dispatch(random.nextInt(4) + 2);
            },
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) =>
                (user is UnitializedUser) ? Container() : UserCard(user),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x55000000),
            offset: Offset(1, 1),
            blurRadius: 7,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(user.avatar),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  user.id,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
