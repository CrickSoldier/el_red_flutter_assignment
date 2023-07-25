// ignore_for_file: use_build_context_synchronously

import 'package:el_red/model/screen1_model.dart';
import 'package:el_red/repo/data.dart';
import 'package:el_red/view/screen2.dart';
// import 'package:el_red/viewModel/screen1.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Screen2View extends StatefulWidget {
  const Screen2View({super.key, required this.name});
  final String name;

  @override
  State<Screen2View> createState() => _Screen2ViewState();
}

class _Screen2ViewState extends State<Screen2View> {
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
    Screen1 dataReceived = await data.getData();
    screenName = dataReceived.screens[1].screenName;
    // dataReceived.screens[1].options![0].text;
    setState(() {
      screenName = screenName;
      screenData = dataReceived.screens[1];
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _selectedGender = "";
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
                          value: 0.4,
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
                            "My name is ${widget.name}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${screenData.question}",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Text("Male"),
                            leading: Radio<String>(
                              value: "Male",
                              groupValue: "male",
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Female"),
                            leading: Radio<String>(
                              value: screenData.options[0].text,
                              groupValue: screenData.options[0].value,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Screen2View()));
                            },
                            child: Container(
                              height: 50,
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color: true ? Colors.blue : Colors.black,
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
