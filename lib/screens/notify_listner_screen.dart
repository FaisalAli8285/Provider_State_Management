import 'package:flutter/material.dart';

class NoyifyListnerScreen extends StatelessWidget {
  NoyifyListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Subscribe")),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                  ),
                );
              }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Center(
                  child: Text(
                    _counter.value.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
            print(_counter.value.toString());
          },
          child: Icon(Icons.add)),
    );
  }
}
