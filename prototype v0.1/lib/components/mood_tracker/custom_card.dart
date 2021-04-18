import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color colorOfCard;
  final Widget cardChild;
  final Function buttonAction;

  CustomCard({
    Key key,
    @required this.colorOfCard,
    this.cardChild,
    this.buttonAction,
  })  : assert(colorOfCard != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colorOfCard,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

// GestureDetector(
// onTap: () {
// setState(() {
// selectedGender = Gender.male;
// });
// },
// child: CustomCard(
// selectedGender == Gender.male
// ? activeCardColor
//     : inactiveCardColor,
// IconContent(FontAwesomeIcons.mars, "MALE"),
// ),
// ),
