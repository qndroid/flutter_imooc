import 'package:flutter/material.dart';
import '../commponents/viewpager/intro_page_item.dart';
import '../commponents/viewpager/page_transformer.dart';
import 'home.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  //这块逻辑可以后面优化
                  var child = IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                  if (index == sampleItems.length - 1) {
                    return GestureDetector(
                      child: child,
                      onTapDown: (TapDownDetails details) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => route == null);
                      },
                    );
                  } else {
                    return child;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
