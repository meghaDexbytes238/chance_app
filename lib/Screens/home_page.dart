import 'dart:math';
import 'package:chance_game_app/Config/app_color.dart';
import 'package:chance_game_app/Screens/widget_file.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Config/app_strings.dart';
import 'first_page.dart';



class HomeScreen_StartGame extends StatefulWidget {
  int boxCount;
  HomeScreen_StartGame({super.key, required this.boxCount});

  @override
  State<HomeScreen_StartGame> createState() => _HomeScreen_StartGameState();
}

class _HomeScreen_StartGameState extends State<HomeScreen_StartGame> {

  List<double> opecityForColor = [
    0.0,
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    0.9,
    1.0
  ];
  Random random = Random();
  var element = 1.0;
  var selectedCard = -1;
  int selectedIndex = 0;
  double? elevationVar;
  late Color color;
  var borderWidth = 5.0;
  int getIndex = 0;
  var tapTime = 0;
  int count = 0;
  bool buttonIs = true;
  List newList = [];
  var elementForCheck =1;
  var forBorder = true;
  @override
  void initState() {
    super.initState();
    print(widget.boxCount);
    newList = List<int>.generate(
      widget.boxCount,
          (index) {
        if ((index)< 1) {

          return (index ) + 1;
        } else if (widget.boxCount / 2 == (index ) || (index ) < widget.boxCount / 2) {

          return (index) * 2;
        } else if ((index) == widget.boxCount - 1 || widget.boxCount > (index )) {

          if (widget.boxCount / 2 == ((index) - 1)) {
            return widget.boxCount - 1;
          }
          return ((widget.boxCount  - (index )) * 2 ) + 1;
        }
        return widget.boxCount - 1;
      },
    );
    tapTime = widget.boxCount ~/ 2;
    tapTime = tapTime *10;
    getindexMethod(0);
    print(newList);
  }
  int getindexMethod(int index){
    index == newList.indexOf(elementForCheck);
    return index;
  }
  void buttonFunc(int index)
  {
    print('click');
    setState(() {
      // print(index);
      selectedCard = index;
      element = opecityForColor[random.nextInt(opecityForColor.length)];
      elevationVar = 30.0;
      color = AppColor.greenColor;
      print("index $index");
      print("elementcehck $elementForCheck");
      print("index of new  ${newList.indexOf(elementForCheck)}");
      print("index ${index}");
      if((index == newList.indexOf(elementForCheck) && (newList[index] ==  elementForCheck)) || count <= tapTime ){
        print('true');
        forBorder = true;
        borderWidth = 5.0;
        index = index + 1;
        elementForCheck = elementForCheck + 1;
        print(' eleme $elementForCheck');
        print("index of new  ${newList.indexOf(elementForCheck)}");
        print("index ${index}");
        if(elementForCheck > newList.length ){
          index = 0;
          elementForCheck = 1;
        }
        count = count + 1;
      }
      if(count == tapTime){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: WidgetFile.customText(data: AppStrings.gameOver) ,
            actions: [
              WidgetFile.customTextButton(
                data: AppStrings.restart,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstScreenGame(),
                      ));
                },

              ),

              WidgetFile.customTextButton(
                  data: AppStrings.cancel,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fgdColor: MaterialStatePropertyAll(AppColor.redColor)
              ),
            ],
          ),
        );
      }
    });
    if (element == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          actionsPadding: const EdgeInsets.all(0),
          titlePadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network('https://lottie.host/00ebae14-bf30-45f1-97de-1e65098e6d38/FegyoBqSaH.json',
                  alignment: const Alignment(0, 100),
                  height: MediaQuery.of(context).size.height/2.5
              ),
              WidgetFile.customText(data: AppStrings.congrats,fontSize: 20, fontWeight: FontWeight.w800 , textAlign: TextAlign.center),
              const SizedBox(height: 5,),
              WidgetFile.customText(data: AppStrings.winner, fontSize: 12),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WidgetFile.customTextButton(data: AppStrings.restart, onPressed:  () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstScreenGame(),
                          ));
                    },),
                    WidgetFile.customTextButton(onPressed:  () {
                      Navigator.pop(context);
                    },data: AppStrings.cancel,fgdColor: const MaterialStatePropertyAll(Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
        margin: const EdgeInsets.all(20),
        child: GridView.builder(
          itemBuilder: (context, index) {
            return Opacity(
                opacity: selectedCard == index ? element : 1.0,
                child: WidgetFile.gridviewBoxButton(
                  onPressed: () {
                    print("button is : $buttonIs");
                    (buttonIs == true) ?
                    buttonFunc(index)
                        : null;
                    print(buttonIs);
                  },
                  text: "${newList[index]}",
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(
                            width: ((index == newList.indexOf(elementForCheck) && (newList[index] ==  elementForCheck)))? borderWidth : 0.0,
                            color: Colors.blueAccent,
                            strokeAlign: 3,
                            style: BorderStyle.solid)),
                    backgroundColor: MaterialStatePropertyAll(
                      AppColor.colorsMy[random.nextInt(AppColor.colorsMy.length)],
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    shadowColor: selectedCard == index ? MaterialStatePropertyAll(color) : const MaterialStatePropertyAll(Colors.transparent),
                    elevation: selectedCard == index ? MaterialStatePropertyAll(elevationVar) : const MaterialStatePropertyAll(0.0),
                  ),
                )

            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 30, mainAxisSpacing: 30),
          itemCount: newList.length,
        ),
      ),
    );
  }
}
