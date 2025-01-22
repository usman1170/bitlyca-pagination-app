import 'package:bitlyca_app/core/colors.dart';
import 'package:bitlyca_app/core/components/snakbars.dart';
import 'package:bitlyca_app/data/models/user_model.dart';
import 'package:bitlyca_app/presentation/home/bloc/users_cubit.dart';
import 'package:bitlyca_app/presentation/home/bloc/users_state.dart';
import 'package:bitlyca_app/presentation/widgets/event_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    context.read<UserCubit>().fetchUsers(loadMore: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: mq.height * .04),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dating List",
                        style: TextStyle(color: white, fontSize: 22)),
                    const SizedBox(height: 18),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          fillColor: white,
                          filled: true,
                          hintText: "Search",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(top: 12, left: 12, right: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UserError) {
                    Snakbars.redSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  if (state is UserLoading && state is UserInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is UserError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  if (state is UserLoaded) {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollEndNotification &&
                            scrollNotification.metrics.pixels ==
                                scrollNotification.metrics.maxScrollExtent) {
                          context.read<UserCubit>().fetchUsers(loadMore: true);
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount: state.users.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.users.length) {
                            return state is UserLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const SizedBox();
                          }
                          final UserModel user = state.users[index];
                          return Column(
                            children: [
                              CardWidget(user: user),
                              const SizedBox(height: 14),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
