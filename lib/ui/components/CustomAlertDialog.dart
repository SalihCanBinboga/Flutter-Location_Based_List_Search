import 'package:flutter/material.dart';

enum DialogButtonType { SINGLE_BUTTON, MULTI_BUTTON }

/// if use single button mode no need button list
class CustomAlertDialog {
  final BuildContext context;
  final String title;
  Color titleTextColor;
  double titleTextSize;
  Widget description;
  final DialogButtonType buttonType;
  final List<Widget> buttonList;
  final Function onClose;
  String singleButtonTitle;
  Color singleButtonColor;
  Color singleButtonTextColor;
  double singleButtonFontSize;
  Alignment multiButtonAlignment;
  FontWeight titleTextFontWeight;

  CustomAlertDialog({
    @required this.context,
    @required this.title,
    this.titleTextColor,
    this.titleTextSize,
    this.description,
    @required this.buttonType,
    this.buttonList,
    this.onClose,
    this.singleButtonTitle,
    this.singleButtonColor,
    this.singleButtonTextColor,
    this.singleButtonFontSize,
    this.multiButtonAlignment,
    this.titleTextFontWeight,
  }) {
    if (titleTextColor == null) titleTextColor = Colors.black;
    if (titleTextSize == null) titleTextSize = 18.0;
    if (description == null) description = Container();
    if (singleButtonTitle == null) singleButtonTitle = "Tamam";
    if (singleButtonColor == null) singleButtonColor = Colors.deepOrange;
    if (singleButtonTextColor == null) singleButtonTextColor = Colors.white;
    if (singleButtonFontSize == null) singleButtonFontSize = 16;
    if (titleTextFontWeight == null) titleTextFontWeight = FontWeight.normal;
  }

  Widget _generateButtons() {
    if (buttonType == DialogButtonType.MULTI_BUTTON) {
      return Padding(
        padding: const EdgeInsets.only(right: 12,bottom: 8),
        child: Align(
          alignment: multiButtonAlignment == null ? Alignment.centerRight : multiButtonAlignment,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: buttonList,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8,bottom: 4),
        child: Container(
          width: double.infinity,
          child: RaisedButton(
            color: singleButtonColor,
            elevation: 3,
            child: Text(
              singleButtonTitle,
              style: TextStyle(color: singleButtonTextColor, fontSize: singleButtonFontSize),
            ),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
      );
    }
  }

  Widget createDialogContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(
                title,
                maxLines: 1,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: titleTextColor, fontSize: titleTextSize, fontWeight: titleTextFontWeight),
              ),
            ),
            Divider(),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8),
              child: description,
            ),
            SizedBox(
              height: 8,
            ),
            _generateButtons(),
          ],
        ),
      ),
    );
  }

  _createDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: createDialogContainer(),
    );
  }

  show() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return _createDialog();
        });
  }
}
