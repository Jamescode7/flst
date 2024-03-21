import 'package:flst/bloc_study/form/pages/step_three.dart';
import 'package:flst/bloc_study/form/widgets/flat_button.dart';
import 'package:flutter/material.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonActive = false;
  void _checkValidity() {
    setState(() {
      _isButtonActive = _nameController.text.length > 2;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkValidity);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: '이름',
                  hintText: '이름을 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            FlatButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StepThree()),
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
