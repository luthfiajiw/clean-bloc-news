import 'package:clean_bloc_news/core/util/injection.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_bloc.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/bloc/remote/remote_news_event.dart';
import 'package:clean_bloc_news/features/daily_news/presentation/pages/daily_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteNewsBloc>(
          create: (context) => locator.get<RemoteNewsBloc>()..add(const RemoteGetNews()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DailyNewsPage(),
      ),
    );
  }
}