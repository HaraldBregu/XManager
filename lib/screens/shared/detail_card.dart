import 'package:flutter/material.dart';

class DetailCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const DetailCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      padding: widget.margin,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
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
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
