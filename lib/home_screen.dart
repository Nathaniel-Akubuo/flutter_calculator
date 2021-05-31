import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/button_layout.dart';
import 'package:flutter_calculator/widgets/result_layout.dart';
import 'package:provider/provider.dart';
import 'util/themes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => Themes(),
      child: Consumer<Themes>(
        builder: (context, themes, child) {
          var themes = Provider.of<Themes>(context, listen: true);
          return Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              elevation: 0,
              backgroundColor: kDarkBackgroundColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: kLightBackgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: themes.kLightModeIcon,
                            color: kLightIconColor,
                            onPressed: () => themes.toggleTheme()),
                        IconButton(
                            icon: themes.kDarkModeIcon,
                            color: kDarkIconColor,
                            onPressed: () => themes.toggleTheme()),
                      ],
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            backgroundColor: kDarkBackgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ResultLayout(), ButtonLayout()],
            ),
          );
        },
      ),
    );
  }
}
