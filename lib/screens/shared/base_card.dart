import 'package:flutter/material.dart';

class BaseCard extends StatefulWidget {
  final Widget header;
  final Widget body;
  final Widget footer;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const BaseCard({
    Key? key,
    required this.header,
    required this.body,
    required this.footer,
    this.margin = const EdgeInsets.only(left: 15, right: 15, bottom: 8),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.margin,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Color.fromRGBO(70, 70, 70, 1.0),
          ),
        ),
        //color: const Color.fromRGBO(32, 33, 36, 1.0),
        color: const Color.fromRGBO(29, 29, 29, 1.0),
        child: Padding(
          padding: widget.padding,
          child: Column(
            children: [
              widget.header,
              const SizedBox(height: 20),
              widget.body,
              const SizedBox(height: 10),
              widget.footer,
            ],
          ),
        ),
      ),
    );
  }
}
