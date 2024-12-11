import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var sz = Get.size;
    RxBool startClicked = false.obs;
    RxBool goClicked = false.obs;
    RxBool menuClicked = false.obs;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => goClicked.value
                ? Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: GestureDetector(
                        onTap: () => menuClicked.value = !menuClicked.value,
                        child:
                            Icon(menuClicked.value ? Icons.close : Icons.menu)),
                  )
                : const SizedBox()),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(35.0),
                child: SizedBox(
                  height: sz.height * 0.55,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      // Outer circle
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 555),
                        bottom: goClicked.value
                            ? 0
                            : (sz.height -
                                        (goClicked.value
                                            ? sz.width * 0.75
                                            : sz.width * 0.60)) /
                                    2 -
                                35 -
                                70 -
                                50,
                        right: goClicked.value
                            ? 0
                            : (sz.width -
                                        (goClicked.value
                                            ? sz.width * 0.75
                                            : sz.width * 0.495)) /
                                    2 -
                                35,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 555),
                          width: startClicked.value
                              ? (goClicked.value
                                  ? (menuClicked.value
                                      ? sz.width * 0.8
                                      : sz.width * 0.375)
                                  : sz.width * 0.5)
                              : 0,
                          height: startClicked.value
                              ? (menuClicked.value
                                  ? sz.height * 0.55
                                  : sz.width * 0.5)
                              : 0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 181, 178, 188),
                            borderRadius: BorderRadius.circular(
                                menuClicked.value
                                    ? sz.width * 0.125
                                    : sz.width * 0.25),
                          ),
                        ),
                      ),
                      // Middle circle
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 555),
                        top: goClicked.value
                            ? (menuClicked.value ? sz.width * 0.125 : 0)
                            : (sz.height -
                                        (goClicked.value
                                            ? sz.width * 0.75
                                            : sz.width * 0.475)) /
                                    2 -
                                35 -
                                120,
                        right: goClicked.value
                            ? (menuClicked.value ? sz.width * 0.035 : 0)
                            : (sz.width -
                                        (goClicked.value
                                            ? sz.width * 0.75
                                            : sz.width * 0.37)) /
                                    2 -
                                35,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 555),
                          width: startClicked.value
                              ? (menuClicked.value
                                  ? sz.width * 0.8 - sz.width * 0.07
                                  : sz.width * 0.375)
                              : 0,
                          height: startClicked.value
                              ? (goClicked.value
                                  ? (menuClicked.value
                                      ? sz.height * 0.475
                                      : sz.width * 0.65)
                                  : sz.width * 0.375)
                              : 0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 121, 121, 136),
                            borderRadius: BorderRadius.circular(
                                menuClicked.value
                                    ? sz.width * 0.125
                                    : sz.width * 0.25),
                          ),
                        ),
                      ),
                      // Inner circle
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 555),
                        top: goClicked.value
                            ? (menuClicked.value ? sz.width * 0.025 : 0)
                            : (sz.height -
                                        (goClicked.value
                                            ? sz.width * 0.75
                                            : sz.width * 0.35)) /
                                    2 -
                                35 -
                                120,
                        left: goClicked.value
                            ? (menuClicked.value ? sz.width * 0.675 : 0)
                            : (sz.width -
                                        (goClicked.value
                                            ? sz.width * 0.75
                                            : sz.width * 0.25)) /
                                    2 -
                                35,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 555),
                          width: goClicked.value
                              ? (menuClicked.value
                                  ? sz.width * 0.075
                                  : sz.width * 0.375)
                              : sz.width * 0.25,
                          height: startClicked.value
                              ? (goClicked.value
                                  ? (menuClicked.value
                                      ? sz.width * 0.075
                                      : sz.height * 0.55)
                                  : sz.width * 0.255)
                              : sz.width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.circular(sz.width * 0.25),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () => {
                                if (!startClicked.value)
                                  {
                                    // If "Start" is tapped
                                    startClicked.value = !startClicked.value
                                  }
                                else
                                  {
                                    // If "Go" is tapped
                                    goClicked.value = !goClicked.value
                                  }
                              },
                              child: Text(
                                startClicked.value
                                    ? (goClicked.value ? "" : "Go")
                                    : "Start",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sz.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
