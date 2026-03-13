import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/login/model/login/login_firebase_utils.dart';
import 'package:movies_app/modules/login/model/login/login_handler.dart';
import 'package:movies_app/modules/login/view_model/events.dart';
import 'package:movies_app/modules/login/view_model/states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    
    final _loginHandler = LoginHandler(LoginFirebaseUtils(FirebaseFirestore.instance), FirebaseAuth.instance);

    LoginBloc() : super(LoginInitial()) {
      on<LoginWithEmailAndPassword>(_onLoginLoading);
    }

    Future<void> _onLoginLoading(LoginWithEmailAndPassword event, Emitter<LoginState> emit) async {
      emit(LoginLoading());
      try {
        final user = await _loginHandler.login(event.email, event.password);
        if (user != null) {
          emit(LoginSuccess());
        } else {
          emit(LoginError());
        }
      } catch (e) {
        emit(LoginError());
      }
    }
}