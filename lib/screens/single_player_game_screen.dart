import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wordlr_mmultiplayer/widgets/text_box_field.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single player"),
      ),
      body: Container(
        child:SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.only(top:80, left: 10, right: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PinBoxField(textController: controller1),
                const SizedBox(height: 15,),
                PinBoxField(textController: controller2),
                const SizedBox(height: 15,),
                PinBoxField(textController: controller3),
                const SizedBox(height: 15,),
                PinBoxField(textController: controller4),
                const SizedBox(height: 15,),
                PinBoxField(textController: controller5),            
              ],
            ),
          ),
        )
      ),
      )
    );
  }
}