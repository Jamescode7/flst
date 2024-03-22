import 'package:flst/bloc_study/form/bloc/email_bloc.dart';
import 'package:flst/bloc_study/form/bloc/name_bloc.dart';
import 'package:flst/bloc_study/form/pages/step_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => EmailBloc()),
      BlocProvider(create: (context) => NameBloc()),
    ],
    child: MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainHome(),
    ),
  ));
}

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC FORM')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const StepOne();
            }));
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}
