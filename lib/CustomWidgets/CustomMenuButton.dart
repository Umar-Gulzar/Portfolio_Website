import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Providers/Providers.dart';

void scrollToSection(GlobalKey key)
{
  Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut
  );
}
final  HOME_KEY=GlobalKey();
final  ABOUTME_KEY=GlobalKey();
final  SKILLS_KEY=GlobalKey();
final  PROJECTS_KEY=GlobalKey();
final  CONTACT_KEY=GlobalKey();
final List<GlobalKey<State<StatefulWidget>>> BUTTON_KEYS=[ HOME_KEY,ABOUTME_KEY,SKILLS_KEY,PROJECTS_KEY,CONTACT_KEY,];



class CustomMenuButton extends ConsumerWidget
{
  int index;
  CustomMenuButton(this.index);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Consumer(
      builder: (context,ref,child) {
        final hover=ref.watch(menuProvider.select((state)=>state.isHovered));
        final press=ref.watch(menuProvider.select((state)=>state.isPressed));
        final button=ref.watch(menuProvider.select((state)=>state.buttonNames));

        return TextButton(
            style: TextButton.styleFrom(
              shadowColor: hover[index] ? Colors.tealAccent : Colors.transparent,
              elevation: 20,
              shape: RoundedRectangleBorder(),
              backgroundColor: hover[index] ? Colors.transparent : Colors.transparent,
            ),
            onHover: (b) {
              ref.read(menuProvider.notifier).setHover(index, b);
            },
            onPressed: () {
              ref.read(menuProvider.notifier).pressButton(index);
              scrollToSection(BUTTON_KEYS[index]);
              },
            child: Column(
              children: [
                SizedBox(height: 12,),
                Text(
                  button[index],
                  style: TextStyle(
                  color: hover[index] || press[index] ? Colors.tealAccent : Colors.white
                  ),
                ),
                SizedBox(height: 8,),
                Container(height: 1,
                width: 60,
                color: hover[index] || press[index] ? Colors.white : Colors.transparent
            )
          ],
        )
        );
      }
    );
  }
}




