import 'package:flutter/material.dart';
import 'package:currency_rates/colors.dart';

class TitleSection extends StatefulWidget {
  final String title;
  final bool? withButton;
  final String? buttonText;
  final Function? goToPageCallback;

  const TitleSection({
    Key? key,
    required this.title,
    this.withButton = false,
    this.buttonText,
    this.goToPageCallback,
  }) : super(key: key);

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(widget.title,
              style: const TextStyle(
                color: CustomColors.primaryGray,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          // height: 20,
          child: widget.withButton!
              ? TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size.fromHeight(5.0),
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(60, 20),
                  ),
                  onPressed: () {
                    if (widget.goToPageCallback != null) {
                      widget.goToPageCallback!();
                    }
                  },
                  child: Text(widget.buttonText ?? '',
                      style: const TextStyle(
                        color: CustomColors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
