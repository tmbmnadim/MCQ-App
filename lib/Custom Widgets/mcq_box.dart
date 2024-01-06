import 'package:flutter/material.dart';

class MCQBox extends StatefulWidget {
  const MCQBox({
    super.key,
    required this.checkBoxValues,
    required this.onChanged,
    required this.answers,
    required this.question,
    this.questionPoint,
    this.correctAnswer,
  });

  final String question;
  final String? questionPoint;
  final List<String> answers;
  final int? correctAnswer;
  final List<bool> checkBoxValues;
  final Function(bool?, int) onChanged;

  @override
  State<MCQBox> createState() => _MCQBoxState();
}

class _MCQBoxState extends State<MCQBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: IgnorePointer(
          ignoring: widget.correctAnswer == null ? false : true,
          child: ExpansionTile(
            title: Text(
              widget.question,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            shape: Border.all(color: Colors.transparent),
            backgroundColor: Colors.green,
            initiallyExpanded: true,
            trailing: pointCheck(widget.correctAnswer),
            children: List.generate(
              widget.checkBoxValues.length,
              (index) => Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: cardColor(widget.correctAnswer, index),
                child: CheckboxListTile(
                    value: widget.checkBoxValues[index],
                    selected: widget.checkBoxValues[index],
                    selectedTileColor: cardColor(
                      widget.correctAnswer,
                      index,
                    ),
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      "(${index + 1}) ${widget.answers[index]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    checkColor: Colors.transparent,
                    fillColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    side: const BorderSide(color: Colors.transparent),
                    dense: true,
                    onChanged: (value) {
                      widget.onChanged(value, index);
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color cardColor(int? correct, int index) {
    if (correct != null) {
      if (correct == index + 1) {
        return Colors.greenAccent;
      } else if (correct != index + 1 && widget.checkBoxValues[index]) {
        return Colors.red;
      }
    } else if (correct == null && widget.checkBoxValues[index]) {
      return Colors.yellowAccent;
    }
    return Colors.white;
  }

  Widget pointCheck(int? correct) {
    if (widget.correctAnswer != null) {
      if (widget.checkBoxValues[correct! - 1]) {
        return const Text(
          "+1",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        );
      } else if (widget.checkBoxValues.every((element) => element == false)) {
        return const Text(
          "0",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        );
      } else {
        return const Text(
          "-0.5",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        );
      }
    } else {
      return const Text(
        "?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    }
  }
}
