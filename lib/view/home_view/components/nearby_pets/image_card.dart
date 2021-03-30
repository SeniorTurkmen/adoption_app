import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/util/extension/context_extensions.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: _clipRectangle(context),
    );
  }

  ClipRRect _clipRectangle(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(width: context.width * 30, child: _image()),
    );
  }

  Image _image() {
    return Image.asset(
      'image/cat4.png',
      fit: BoxFit.fitWidth,
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(
        color: ColorPalette.instance.blackcurrant.withOpacity(.1),
        blurRadius: 10,
        offset: Offset(0, 10),
      )
    ]);
  }
}
