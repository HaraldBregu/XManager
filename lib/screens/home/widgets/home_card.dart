import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const HomeCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.only(left: 15, right: 15, bottom: 10)
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(
            color: Color.fromRGBO(40, 40, 40, 1.0),
          ),
        ),
        color: const Color.fromRGBO(30, 30, 30, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: widget.child,
        ),
      ),
    );
  }
}
