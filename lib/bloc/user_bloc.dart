import 'package:aplikasi/api/api_reqres.dart';
import 'package:aplikasi/model/model_user.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<int, User> {
  @override
  User get initialState => UnitializedUser();

  @override
  Stream<User> mapEventToState(int event) async* {
    try{
      User user = await ApiReqres.getUser(event.toString());
      yield user;
    }catch(_){

    }
  }

}