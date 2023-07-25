// ignore_for_file: use_build_context_synchronously

import 'package:el_red/model/screen1_model.dart';
import 'package:el_red/repo/data.dart';
import 'package:el_red/view/screen2.dart';
// import 'package:el_red/viewModel/screen1.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Screen1View extends StatefulWidget {
  const Screen1View({super.key});

  @override
  State<Screen1View> createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {
  Data data = Data();
  String? screenName;
  var screenData;
  bool loading = false;
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getScreen1Data();
    super.initState();
  }

  getScreen1Data() async {
    var dataReceived = await data.getData();
    screenName = dataReceived.screens[0].screenName;
    setState(() {
      screenName = screenName;
      screenData = dataReceived.screens[0];
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool focus = false;
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Gamification',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Visibility(
            visible: loading,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: SafeArea(
                child: Stack(
              children: [
                Container(
                  height: size.height * .89,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          screenData.heading,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const LinearProgressIndicator(
                          color: Colors.orange,
                          value: 0.2,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Container(
                    height: size.height * .78,
                    width: size.width * 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            screenData.question,
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: _nameController,

                                  onChanged: (value) {
                                    setState(() {
                                      focus = true;
                                    });
                                  },
                                  // onChanged: (value) {
                                  //   Provider.of<Screen1Provider>(context, listen: false)
                                  //       .focusChange(true);
                                  // },
                                  decoration: const InputDecoration(
                                    fillColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: 'Enter your name',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Screen2View(
                                            name: _nameController.text,
                                          )));
                            },
                            child: Container(
                              height: 50,
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color:
                                    focus ? Colors.orange : Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
            ))));
  }
}

// ignore: must_be_immutable
// class ScreenView1 extends StatelessWidget {
//   ScreenView1({
//     super.key,
//     required this.size,
//     required this.data,
//   });

//   final Size size;
//   final Screen data;
//   final TextEditingController _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // bool focus = Provider.of<Screen1Provider>(context).focusnext;
//     return SafeArea(
//         child: Stack(
//       children: [
//         Container(
//           height: size.height * .89,
//           decoration: const BoxDecoration(
//             color: Colors.black,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   data.heading,
//                   style: const TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const LinearProgressIndicator(
//                   color: Colors.orange,
//                   value: 0.2,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 100,
//           child: Container(
//             height: size.height * .78,
//             width: size.width * 1,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     data.question,
//                     style: const TextStyle(
//                         color: Colors.orange,
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 50,
//                     width: size.width * 0.8,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextField(
//                           controller: _nameController,

//                           onChanged: (value) {},
//                           // onChanged: (value) {
//                           //   Provider.of<Screen1Provider>(context, listen: false)
//                           //       .focusChange(true);
//                           // },
//                           decoration: const InputDecoration(
//                             fillColor: Colors.grey,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               ),
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             hintText: 'Enter your name',
//                             hintStyle: TextStyle(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Screen2View()));
//                     },
//                     child: Container(
//                       height: 50,
//                       width: size.width * 0.9,
//                       decoration: BoxDecoration(
//                         color: true ? Colors.blue : Colors.black,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Next',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }

// class ScreenView extends StatelessWidget {
//   ScreenView({
//     super.key,
//     required this.size,
//     required this.data,
//   });
//   final Screen data;
//   final Size size;
//   TextEditingController _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 100,
//       child: Container(
//         height: size.height * .78,
//         width: size.width * 1,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 data.question,
//                 style: const TextStyle(
//                     color: Colors.orange,
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 50,
//                 width: size.width * 0.8,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       controller: _nameController,
//                       onChanged: (value) {},
//                       decoration: const InputDecoration(
//                         fillColor: Colors.grey,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         hintText: 'Enter your name',
//                         hintStyle: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 height: 50,
//                 width: size.width * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Next',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
