import 'package:bitlyca_app/data/repositories/user_repository.dart';
import 'package:bitlyca_app/presentation/home/bloc/users_cubit.dart';
import 'package:bitlyca_app/presentation/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //  i also use Get It for dependancy injection like for repositories..
      //but for now only one feature i used direct
      create: (context) => UserCubit(UserRepository()),
      child: const HomeView(),
    );
  }
}

// the method i use here i will add bloc listners etc
// for now i just add widget because no listner.. using consumer in body
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
