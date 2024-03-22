import 'package:flst/bloc_study/form/bloc/name_bloc.dart';
import 'package:flst/bloc_study/form/pages/step_three.dart';
import 'package:flst/bloc_study/form/widgets/flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('step two'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<NameBloc, NameState>(
              builder: (BuildContext context, state) {
                return TextField(
                  onChanged: (name) =>
                      context.read<NameBloc>().add(NameChanged(name)),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: '이름',
                      hintText: '이름을 입력하세요',
                      border: OutlineInputBorder()),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<NameBloc, NameState>(
              buildWhen: (previous, current) =>
                  previous.isNotEmpty != current.isNotEmpty,
              builder: (BuildContext context, state) {
                return FlatButton(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StepThree()),
                    );
                  },
                  isActive: state.isNotEmpty,
                  text: 'NextStep',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
