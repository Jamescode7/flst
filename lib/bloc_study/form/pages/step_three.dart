import 'package:flst/bloc_study/form/widgets/flat_button.dart';
import 'package:flutter/material.dart';

class StepThree extends StatefulWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isButtonActive = false;
  void _checkValidity() {
    final isPasswordMatch = _passwordController.text == _confirmController.text;
    final isPasswordNotEmpty = _passwordController.text.isNotEmpty &&
        _confirmController.text.isNotEmpty;

    setState(() {
      _isButtonActive = isPasswordMatch && isPasswordNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkValidity);
    _confirmController.addListener(_checkValidity);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

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
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호를 다시 한번 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            FlatButton(
              onPress: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              isActive: _isButtonActive,
              text: 'Complete',
            )
          ],
        ),
      ),
    );
  }
}
