import 'package:flutter/material.dart';
import 'package:wolfram/param_widget.dart';
import 'package:wolfram/utils.dart';

class CustomSideMenu extends StatelessWidget {
  CustomSideMenu({super.key});
  // static const textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Parameters',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            const SizedBox(height: 30,),
            ParamWidget(
              title: 'Rule',
              getter: (data) => data.rule.toString(),
              setter: (data, value) => data.setRule(value),
            ),
            const SizedBox(height: 30),
            ParamWidget(
              title: 'Line(s)',
              getter: (data) => data.line.toString(),
              setter: (data, value) => data.setLine(value),
            ),
            const SizedBox(height: 30),
            ParamWidget(
              title: 'Start generation',
              getter: (data) => data.start.toString(),
              setter: (data, value) => data.setStart(value),
            ),
            const SizedBox(height: 30),
            ParamWidget(
              title: 'Window',
              getter: (data) => data.window.toString(),
              setter: (data, value) => data.setWindow(value),
            ),
            const SizedBox(height: 30),
            ParamWidget(
              title: 'Move',
              getter: (data) => data.move.toString(),
              setter: (data, value) => data.setMove(value),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

class SelectRule extends StatefulWidget {
  const SelectRule({super.key});

  @override
  State<StatefulWidget> createState() => SelectRuleState();
}

class SelectRuleState extends State<SelectRule> {
  String? selectedRule;
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        hint: Text(selectedRule ?? "Select an item"),
        isExpanded: true,
        value: selectedRule,
        items: WUtils.rulesName.map((String rule) {
          return DropdownMenuItem(
            value: rule,
            child: Text(rule),
          );
        }).toList(),
        onChanged: (newValue) {
          selectedRule = newValue;

        }
    );
  }
}

// Custom app bar
class CustomAppBar extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const CustomAppBar({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: onMenuPressed,
          ),
          const Expanded(
              child: Center(
                child: Text(
                    "Wolfram",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )
                ),
              )
          ),
        ],
      ),
    );
  }
}
