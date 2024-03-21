import 'package:flst/bloc_study/form/bloc/email_bloc.dart';
import 'package:flst/bloc_study/form/pages/step_two.dart';
import 'package:flst/bloc_study/form/widgets/flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('step one'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<EmailBloc, EmailState>(
              builder: (BuildContext context, state) {
                return TextField(
                  onChanged: (email) =>
                      context.read<EmailBloc>().add(EmailChanged(email)),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요',
                    border: const OutlineInputBorder(),
                    errorText: !state.isValid ? '유효하지 않은 이메일 입니다.' : null,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<EmailBloc, EmailState>(
              buildWhen: (previous, current) =>
                  previous.isValid != current.isValid,
              builder: (context, state) {
                return FlatButton(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StepTwo()),
                    );
                  },
                  isActive: state.isValid,
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
