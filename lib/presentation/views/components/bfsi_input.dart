import 'package:bfsi/core/consts/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BfsiInput extends StatefulWidget {
  static const keyPrefix = 'BfsiInput';
  final int? characterLimit;
  final TextInputAction? textInputAction;
  final ValueChanged<String?> onChanged;
  final VoidCallback? onRemove;
  final ValueChanged<String> onSubmitted;
  final String? placeholder;
  final String label;
  final int? maxLines;
  final bool obscureText;
  final bool withLabel;
  final TextInputType? keyboardType;
  final bool requiredField;
  final bool isValid;
  final String? initialValue;
  final bool? enabledField;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isViewOnly;
  final bool? txtFieldSmall;
  final int? maxCharacters;
  final bool? isSuffix;
  final int? minLines;
  final bool autoFocus;
  final String? formatPattern;
  final String? formatSeparator;
  final bool version;
  final String? versionLabel;
  final Color borderColor;

  const BfsiInput({
    super.key,
    this.characterLimit,
    required this.onChanged,
    this.onRemove,
    required this.onSubmitted,
    this.textInputAction,
    this.placeholder,
    this.obscureText = false,
    this.keyboardType,
    this.label = '',
    this.maxLines = 1,
    this.withLabel = false,
    this.requiredField = false,
    this.isValid = true,
    this.isSuffix = false,
    this.initialValue,
    this.enabledField = true,
    this.prefixIcon,
    this.suffixIcon,
    this.isViewOnly = false,
    this.maxCharacters,
    this.txtFieldSmall = false,
    this.minLines,
    this.autoFocus = false,
    this.formatPattern,
    this.formatSeparator,
    this.version = false,
    this.versionLabel,
    this.borderColor = Colors.white,
  });

  @override
  RadiusInputUpdatedState createState() => RadiusInputUpdatedState();
}

class RadiusInputUpdatedState extends State<BfsiInput> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController.fromValue(
      TextEditingValue(text: widget.initialValue ?? ''),
    );
    widget.onChanged.call(widget.initialValue);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BfsiInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      textEditingController.value = textEditingController.value.copyWith(
          text: widget.initialValue,
          selection: textEditingController.value.selection);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: (widget.enabledField == false || widget.isViewOnly == true)
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.basic,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.withLabel
              ? Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: widget.withLabel ? 9.0 : 0,
          ),
          //  UIHelper.verticalSpaceSmall(),
          SizedBox(
            width: widget.txtFieldSmall == true
                ? 50
                : MediaQuery.of(context).size.width,
            child: TextField(
              mouseCursor: widget.enabledField == false
                  ? SystemMouseCursors.forbidden
                  : SystemMouseCursors.basic,
              autofocus: widget.autoFocus,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.deny(
                    AppConsts.removeFirstSpaceRegX),
                if (widget.keyboardType == TextInputType.number)
                  FilteringTextInputFormatter.digitsOnly,
                if (widget.keyboardType ==
                    const TextInputType.numberWithOptions(decimal: true))
                  FilteringTextInputFormatter.allow(
                    AppConsts.budgetRegex,
                  ),
                if (widget.maxCharacters != null)
                  LengthLimitingTextInputFormatter(widget.maxCharacters),
                if (widget.formatPattern != null)
                  CardFormatter(
                    formatPattern: widget.formatPattern ?? '',
                    separator: widget.formatSeparator ?? '',
                  ),
              ],
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isSuffix == true
                    ? InkWell(
                        onTap: () {
                          // Clear the text when the suffixIcon is clicked.
                          textEditingController.clear();
                          widget.onChanged('');
                        },
                        child: widget.suffixIcon,
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                hintText: widget.placeholder,
                hintStyle: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.isValid ? 0.5 : 1.0,
                    color: widget.isValid ? widget.borderColor : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isValid ? widget.borderColor : Colors.red,
                    width: widget.isValid ? 0.5 : 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isValid ? widget.borderColor : Colors.red,
                    width: widget.isValid ? 0.5 : 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.2),
                ),
                counterStyle: const TextStyle(
                  color: Colors.grey, // Set your desired label color here
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0,
                ),
              ),
              key: const ValueKey('${BfsiInput.keyPrefix}-TextField'),
              cursorHeight: 15,
              minLines: widget.minLines ?? 1,
              maxLines: widget.maxLines,
              obscureText: widget.obscureText,
              controller: textEditingController,
              onChanged: (value) {
                if (value != '0') {
                  widget.onChanged(value);
                } else {
                  if (widget.keyboardType ==
                      const TextInputType.numberWithOptions(decimal: true)) {
                    if (value.isNotEmpty) {
                      final doubleValue = double.tryParse(value);
                      if (doubleValue != null &&
                          doubleValue > 0 &&
                          doubleValue < 100000) {
                        widget.onChanged(value);
                      }
                    }
                  } else {
                    textEditingController.text = '';
                  }
                }
              },
              maxLength: widget.characterLimit,
              maxLengthEnforcement: widget.characterLimit != null
                  ? MaxLengthEnforcement.enforced
                  : MaxLengthEnforcement.none,
              textInputAction: widget.textInputAction,
              onSubmitted: (value) {
                widget.onSubmitted(value);
              },
              keyboardType: widget.keyboardType,
              enabled: widget.enabledField,
              textAlign: widget.txtFieldSmall == true
                  ? TextAlign.center
                  : TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

class CardFormatter extends TextInputFormatter {
  final String formatPattern;
  final String separator;

  CardFormatter({
    required this.formatPattern,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final positionList = <int>[];
    var totalSeparatorCount = 0;
    for (var i = 0; i < formatPattern.length; i++) {
      if (formatPattern[i] == separator) {
        positionList.add(i - totalSeparatorCount);
        totalSeparatorCount = totalSeparatorCount + 1;
      }
    }

    if (newValue.text.isNotEmpty) {
      var changedValue = '';
      for (var i = 0; i < newValue.text.length; i++) {
        if (positionList.any((element) => element == i)) {
          changedValue = '$changedValue$separator${newValue.text[i]}'.trim();
        } else {
          changedValue = '$changedValue${newValue.text[i]}'.trim();
        }
      }
      return TextEditingValue(
        text: changedValue,
        selection: TextSelection.collapsed(
          offset: newValue.selection.baseOffset != newValue.text.length
              ? newValue.selection.baseOffset
              : changedValue.length,
        ),
      );
    }
    return newValue;
  }
}
