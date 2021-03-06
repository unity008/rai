import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pigment/pigment.dart';


class ListTileDefault extends StatelessWidget {
  Widget leading;
  Widget child;
  Widget trailing;
  DateTime dateTime;
  double progressBarValue;
  bool isDefault;
  bool isSelected;
  int type;
  int exited;
  int lefts;
  GestureTapCallback onTap;

  ListTileDefault({Key key, this.leading, this.child, this.trailing, this.progressBarValue, this.isDefault = false, this.onTap, this.dateTime, this.exited, this.type = 1, this.isSelected = false, this.lefts = 0}):super(key:key);


  // Type
  // 1 = Best Rate
  // 2 = Default
  // 3 = Exit Early Count
  // 4 = Selected

  Widget labelDepositDefault(BuildContext context) {
    print(lefts);
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: (lefts != null)? 6:0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Pigment.fromString("FAFAFA")
            ),
            child: Text("Matures ${formatDate(dateTime, [dd, ' ', MM, ' ', yyyy]).toString()}", style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.6), fontSize: 11, fontWeight: FontWeight.w700))
          ),
          lefts != null ?Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Pigment.fromString("FAFAFA")
            ),
            child: Text("${lefts.toString()} Days Left", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12, fontWeight: FontWeight.w800))
          ):Container(
            height: 30,
            width: 100,
          )
          // Container(
          //   height: 30,
          //   width: 100,
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     borderRadius: BorderRadius.circular(5)
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       Icon(Icons.star, size: 20, color: Colors.white),
          //       Text("Best Rate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),)
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Widget labelDeposit() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Pigment.fromString("FAFAFA")
            ),
            child: Text("${DateFormat('EEEE').format(dateTime)} ${formatDate(dateTime, [dd, ' ', M, ' ', yyyy]).toString()}")
          ),
          Container(
            height: 30,
            width: 100,
          )
        ],
      ),
    );
  }

  Widget labelDefault(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.width / 1080) * 15,
      right: (MediaQuery.of(context).size.width / 1080) * 55,
      child: Container(
        height: 22,
        width: 80,
        decoration: BoxDecoration(
          color: Pigment.fromString("#69be28"),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Default", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11)),
            Icon(Icons.check, size: 15, color: Colors.white)
          ],
        ),
      ),
    );
  }

  Widget labelExitEarly(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Pigment.fromString("FAFAFA")
            ),
            child: Text("Matures ${formatDate(dateTime, [dd, ' ', M, ' ', yyyy]).toString()}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor.withOpacity(0.8)))
            // child: Text("Matures ${DateFormat('EEEE').format(dateTime)} ${formatDate(dateTime, [dd, ' ', M, ' ', yyyy]).toString()}")
          ),
          exited != null && exited > 0 ? Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Pigment.fromString("FAFAFA")
            ),
            child: Text("Switching Out (${exited})", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700, fontSize: 13))
          ):Container(
            height: 20,
            width: 100,
          ),
        ],
      ),
    );
  }

  Widget labelSelected(BuildContext context) {
    return Positioned(
      right: (MediaQuery.of(context).size.width / 1080) * 55,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(child: Icon(Icons.check, size: 20, color: Colors.white)),
      ),
    );
  }

  Widget label(BuildContext context, int i) {
    switch (i) {
      case 2:
        return labelDefault(context);
        break;
      case 3:
        return labelExitEarly(context);
        break;
      case 4:
        return labelSelected(context);
        break;
      case 5:
        return labelDeposit();
        break;
      default:
        return labelDepositDefault(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: progressBarValue != null ? 110:105,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 1,
                width: MediaQuery.of(context).size.width - 40,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: progressBarValue != null ? 100:90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: isSelected ? Border.all(width: 1.5, color: Theme.of(context).primaryColor) : Border.all(width: 2, color: Colors.black26.withOpacity(0.1))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        (leading == null || trailing == null) ? child : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            leading,
                            child,
                            trailing
                          ],
                        ),
                        progressBarValue != null ? FittedBox(
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width,
                            lineHeight: 18,
                            percent: progressBarValue,
                            progressColor: Pigment.fromString("#69be28"),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ):null,
                        // progressBarValue != null ? Text(progressBarValue.toString()):null
                      ].where((v) => v != null).toList(),
                    )
                  )
                ),
              ),

              isDefault == true ? label(context, type):Container()
            ],
          ),
        ),
      ],
    );
  }
}