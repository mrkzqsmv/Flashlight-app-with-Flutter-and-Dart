import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashLightPage extends StatefulWidget {
  const FlashLightPage({super.key});

  @override
  State<FlashLightPage> createState() => _FlashLightPageState();
}

class _FlashLightPageState extends State<FlashLightPage> {
  bool isOff = false;
  bool isAnimate = false;
  String isStatus = 'Turn on';
  var controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 19, 66, 1),
      appBar: buildAppbar(),
      body: buildCenter(context),
    );
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AvatarGlow(
              glowColor: const Color.fromRGBO(93, 32, 125, 0.4),
              endRadius: 170.0,
              animate: isAnimate,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isAnimate = !isAnimate;
                    isOff = !isOff;
                    controller.toggle(intensity: 1);
                    if (isOff == true) {
                      isStatus = 'Turn Off';
                    } else {
                      isStatus = 'Turn On';
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(161, 51, 208, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      isStatus,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text(
        'Flashlight App',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
      ),
      backgroundColor: const Color.fromRGBO(45, 19, 66, 1),
    );
  }
}
