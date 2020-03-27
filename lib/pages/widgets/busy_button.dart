import 'package:heart_disease_prediction/pages/shared/shared_styles.dart';
import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  const BusyButton(
      {@required this.title,
        this.busy = false,
        @required this.onPressed,
        this.enabled = true});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(

          height: 40,
          width: 120,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: widget.busy ? 10 : 15,
              vertical: widget.busy ? 10 : 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.red,
                Colors.lightBlueAccent,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0),),
          ),
          child: !widget.busy
              ? Text(
            widget.title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          )
              : CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
        ),
      ),
    );
  }
}