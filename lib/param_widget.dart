import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolfram/main_data.dart';

class ParamWidget extends StatefulWidget {
  final String title;
  final String Function(MainData) getter;
  final void Function(MainData, String) setter;

  const ParamWidget({
    super.key,
    required this.title,
    required this.getter,
    required this.setter,
  });

  @override
  State<StatefulWidget> createState() => ParamWidgetState();
}

class ParamWidgetState extends State<ParamWidget> {
  final textController = TextEditingController(text: "0");
  // final data = Provider.of<MainData>(context).rule;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data = Provider.of<MainData>(context, listen: false);
    textController.text = widget.getter(data);
  }

  void increase() {
    int temp = int.tryParse(textController.text) ?? 0;
    temp++;
    textController.text = temp.toString();
    widget.setter(Provider.of<MainData>(context, listen: false), textController.text);
  }

  void decrease() {
    int temp = int.tryParse(textController.text) ?? 0;
    if (temp > 0) {
      temp--;
    }
    textController.text = temp.toString();
    widget.setter(Provider.of<MainData>(context, listen: false), textController.text);
  }

  void setter() {
    widget.setter(Provider.of<MainData>(context, listen: false), textController.text);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(width: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  onEditingComplete: setter,
                  controller: textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: increase,
                    child: const Icon(Icons.arrow_upward),
                  ),
                  const SizedBox(height: 5,),
                  ElevatedButton(
                    onPressed: decrease,
                    child: const Icon(Icons.arrow_downward),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(width: 9,),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          )
        ],
      ),
    );
  }
}