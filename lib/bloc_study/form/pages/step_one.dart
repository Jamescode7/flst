import 'package:flst/bloc_study/form/pages/step_two.dart';
import 'package:flst/bloc_study/form/regx.dart';
import 'package:flst/bloc_study/form/widgets/flat_button.dart';
import 'package:flutter/material.dart';

class StepOne extends StatefulWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final TextEditingController _emailController = TextEditingController();
  bool _isButtonActive = false;
  void _checkValidity() {
    final _email = _emailController.text;
    final _isEmailValidity = emailRegExp.hasMatch(_email);
    setState(() {
      _isButtonActive = _isEmailValidity;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkValidity);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: '이메일',
                  hintText: '이메일을 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            FlatButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StepTwo()),
                );
              },
              isActive: _isButtonActive,
              text: 'NextStep',
            )
          ],
        ),
      ),
    );
  }
}
