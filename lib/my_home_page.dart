import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/internet_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connectivity"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetConnected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet Connected")),
                );
              }
              if (state is InternetDisconnected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet disconnected")),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetConnected) {
                return Column(
                  children: [
                    const Text("You are connected to Internet"),
                    Text(state.internetType),
                  ],
                );
              } else if (state is InternetDisconnected) {
                return const Text("You are not connected to Internet");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
