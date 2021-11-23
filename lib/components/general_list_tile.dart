import 'package:flutter/material.dart';
import 'package:currency_rates/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeneralListTile extends StatefulWidget {
  final String titleText;
  final String subtitleText;
  final String leadingIcon;
  final Color leadingIconBgColor;
  final Color leadingIconColor;
  final String trailingValue;
  final String trailingSubText;
  final bool? symbolsInsteadOfIcon;
  final Function()? onTapFunction;
  final Widget? currencyGraph;

  const GeneralListTile({
    Key? key,
    this.titleText = '',
    this.subtitleText = '',
    this.leadingIcon = '',
    this.leadingIconBgColor = CustomColors.paleGray,
    this.leadingIconColor = CustomColors.secondaryGray,
    this.trailingValue = '',
    this.trailingSubText = '',
    this.symbolsInsteadOfIcon = false,
    this.onTapFunction,
    this.currencyGraph,
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
            child: (() {
              if (widget.symbolsInsteadOfIcon == true) {
                return Center(
                    child: Text(widget.leadingIcon,
                        style: TextStyle(
                          color: widget.leadingIconColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )));
              } else {
                return Center(
                    child: SvgPicture.asset(
                  widget.leadingIcon,
                  height: 24,
                  color: widget.leadingIconColor,
                ));
              }
            })()),
        trailing: SizedBox(
          height: double.infinity,
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: widget.currencyGraph ?? const SizedBox.shrink(),
              ),
              const SizedBox(
                width: 5,
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
        onTap: () {
          if (widget.onTapFunction != null) {
            widget.onTapFunction!();
          }
        },
      ),
      const Divider(
        height: 20,
        color: CustomColors.primaryGray,
      ),
    ]);
  }
}
