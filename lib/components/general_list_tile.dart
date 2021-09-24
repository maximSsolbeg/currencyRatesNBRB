import 'package:flutter/material.dart';
import 'package:currency_rates/colors.dart';

class GeneralListTile extends StatefulWidget {
  final String titleText;
  final String subtitleText;
  final String leadingIcon;
  final Color leadingIconBgColor;
  final Color leadingIconColor;
  final String trailingValue;
  final String trailingSubText;
  final bool? symbolsInsteadOfNumbers;
  final Function(void)? onTapFunction;

  const GeneralListTile({
    Key? key,
    this.titleText = '',
    this.subtitleText = '',
    this.leadingIcon = '',
    this.leadingIconBgColor = CustomColors.paleGray,
    this.leadingIconColor = CustomColors.secondaryGray,
    this.trailingValue = '',
    this.trailingSubText = '',
    this.symbolsInsteadOfNumbers = false,
    this.onTapFunction,
  }) : super(key: key);

  @override
  _GeneralListTileState createState() => _GeneralListTileState();
}

class _GeneralListTileState extends State<GeneralListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(widget.titleText),
        subtitle: Text(widget.subtitleText),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.leadingIconBgColor,
          ),
          child: Center(
            child: Text(widget.leadingIcon,
                style: TextStyle(
                  color: widget.leadingIconColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )
        ),
        trailing: SizedBox(
          height: double.infinity,
          width: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/graph.png',
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.trailingValue,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.trailingSubText,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ]),
            ],
          ),
        ),
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => UsdPage(),
        //     ),
        //   );
        // },
      ),
      const Divider(
        height: 10,
        color: CustomColors.primaryGray,
      ),
    ]);
  }
}

// class SymbolsOrIcon extends StatelessWidget {
//   final Widget widget;
//   final bool symbolsInsteadOfNumbers;
//
//   const SymbolsOrIcon({Key? key, this.widget, this.symbolsInsteadOfNumbers })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (symbolsInsteadOfNumbers == true) {
//       return Center(
//           child: Text(widget.leadingIcon,
//               style: TextStyle(
//                 color: widget.leadingIconColor,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )));
//     } else {
//       return Center(
//           child: Text(widget.leadingIcon,
//               style: TextStyle(
//                 color: widget.leadingIconColor,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )));
//     }
//   }
// }
