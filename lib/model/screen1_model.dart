import 'dart:convert';

Screen1 screen1FromJson(String str) => Screen1.fromJson(json.decode(str));

String screen1ToJson(Screen1 data) => json.encode(data.toJson());

class Screen1 {
  List<Screen> screens;

  Screen1({
    required this.screens,
  });

  factory Screen1.fromJson(Map<String, dynamic> json) => Screen1(
        screens:
            List<Screen>.from(json["screens"].map((x) => Screen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "screens": List<dynamic>.from(screens.map((x) => x.toJson())),
      };
}

class ChildScreen {
  List<Screen> frontend;
  List<Screen> backend;
  List<Screen> designer;

  ChildScreen({
    required this.frontend,
    required this.backend,
    required this.designer,
  });

  factory ChildScreen.fromJson(Map<String, dynamic> json) => ChildScreen(
        frontend:
            List<Screen>.from(json["frontend"].map((x) => Screen.fromJson(x))),
        backend:
            List<Screen>.from(json["backend"].map((x) => Screen.fromJson(x))),
        designer:
            List<Screen>.from(json["designer"].map((x) => Screen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "frontend": List<dynamic>.from(frontend.map((x) => x.toJson())),
        "backend": List<dynamic>.from(backend.map((x) => x.toJson())),
        "designer": List<dynamic>.from(designer.map((x) => x.toJson())),
      };
}

class Screen {
  String screenName;
  String heading;
  String question;
  String? hintText;
  List<String> fields;
  List<Option>? options;
  dynamic ans;
  ChildScreen? childScreen;

  Screen({
    required this.screenName,
    required this.heading,
    required this.question,
    this.hintText,
    required this.fields,
    this.options,
    this.ans,
    this.childScreen,
  });

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
        screenName: json["screen_name"],
        heading: json["heading"],
        question: json["question"],
        hintText: json["hint_text"],
        fields: List<String>.from(json["fields"].map((x) => x)),
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        ans: json["ans"],
        childScreen: json["child_screen"] == null
            ? null
            : ChildScreen.fromJson(json["child_screen"]),
      );

  Map<String, dynamic> toJson() => {
        "screen_name": screenName,
        "heading": heading,
        "question": question,
        "hint_text": hintText,
        "fields": List<dynamic>.from(fields.map((x) => x)),
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "ans": ans,
        "child_screen": childScreen?.toJson(),
      };
}

class Option {
  String text;
  String value;
  String? key;

  Option({
    required this.text,
    required this.value,
    this.key,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        value: json["value"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
        "key": key,
      };
}
