import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:intellivation/bloc_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellivation/screens/homeScreen.dart'; 
import 'package:intellivation/util/const.dart';
import 'package:intellivation/login/loginScreen.dart';
import 'package:intellivation/splashscreen.dart';
import 'package:intellivation/user_repository.dart';
import 'package:intellivation/authentication_bloc/authentication_bloc.dart';



void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
   BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}
class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
       
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized)
          {
            return LoginScreen(userRepository: _userRepository,);
          }
          if (state is Unauthenticated)
          {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated)
          {
            return HomeScreen(name: state.displayName,);
          }
        },
      ),
    );
  }
}
