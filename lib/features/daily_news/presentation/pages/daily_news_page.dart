import 'package:clean_bloc_news/core/util/injection.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_bloc.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_event.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily News",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: BlocBuilder<RemoteNewsBloc, RemoteNewsState>(
        builder: (context, state) {
          if (state is RemoteNewsLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is RemoteNewsError) {
            return const Center(
              child: Text("ERROR"),
            );
          }
          if (state is RemoteNewsDone) {
            return const Center(
              child: Text("SUCCESS"),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}