import 'package:flst/bloc_study/form/bloc/password_bloc.dart';
import 'package:flst/bloc_study/form/widgets/flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepThree extends StatelessWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('step three'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<PasswordBloc, PasswordState>(
              builder: (BuildContext context, state) {
                return TextField(
                  onChanged: (password) => context
                      .read<PasswordBloc>()
                      .add(PasswordChanged(password)),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '비밀번호',
                      hintText: '비밀번호를 입력하세요',
                      errorText:
                          !state.isPasswordValid ? '비밀번호는 8자 이상이어야 합니다.' : null,
                      border: const OutlineInputBorder()),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<PasswordBloc, PasswordState>(
              builder: (BuildContext context, state) {
                return TextField(
                  onChanged: (confirmPassword) => context
                      .read<PasswordBloc>()
                      .add(ConfirmPasswordChanged(confirmPassword)),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '비밀번호 확인',
                      hintText: '비밀번호를 다시 한번 입력하세요',
                      errorText: !state.isConfirmPasswordValid
                          ? '비밀번호가 일치하지 않습니다'
                          : null,
                      border: const OutlineInputBorder()),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<PasswordBloc, PasswordState>(
              buildWhen: (previous, current) =>
                  previous.isPasswordValid != current.isPasswordValid ||
                  previous.isConfirmPasswordValid !=
                      current.isConfirmPasswordValid,
              builder: (context, state) {
                return FlatButton(
                  onPress: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  isActive:
                      state.isPasswordValid && state.isConfirmPasswordValid,
                  text: 'Complete',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
