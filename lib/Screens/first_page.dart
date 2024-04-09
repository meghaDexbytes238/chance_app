
import 'package:chance_game_app/Config/app_strings.dart';
import 'package:chance_game_app/Screens/widget_file.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';


class FirstScreenGame extends StatefulWidget {
  const FirstScreenGame({super.key});
  @override
  State<FirstScreenGame> createState() => _FirstScreenGameState();
}

class _FirstScreenGameState extends State<FirstScreenGame> {
  int number = 0;
  bool valid = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: WidgetFile.customTextField(
                hintText: AppStrings.errorMsgNumber , control: textFieldController ,valid: valid ,onChanged: (value){
                number = int.parse(value);
              },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            WidgetFile.nextButton(
              text: AppStrings.next ,fontSize: 10,
              onPressed: () {
                formKey.currentState!.validate();
                setState(() {
                  if (textFieldController.text.isEmpty) {
                    valid = true;
                  }
                  else if (number % 2 == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen_StartGame(boxCount: number),
                        )
                    );
                  }
                  else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:  Text(AppStrings.errorMsgNumber),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child:  Text(
                                AppStrings.ok ,
                              )
                          )
                        ],
                      ),
                    );
                  }
                });
              },),
          ],
        ),
      ),
    );
  }
}
