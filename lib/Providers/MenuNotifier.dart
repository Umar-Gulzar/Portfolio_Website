import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuState
{
  final List<bool> isHovered;
  final List<bool> isPressed;
  final List<String> buttonNames;

  MenuState({required this.isHovered,required this.isPressed,required this.buttonNames});

  MenuState copyWith({List<bool>? isH,List<bool>? isP,List<String>? buttonN,})
  {
    return MenuState(
        isHovered: isH??this.isHovered,
        isPressed: isP??this.isPressed,
        buttonNames: buttonN??this.buttonNames
    );
  }

}
class MenuNotifier extends StateNotifier<MenuState>
{
  MenuNotifier():super(MenuState(
      isHovered: List.filled(5,false),
      isPressed: List.filled(5,false),
      buttonNames:['Home','About Me','Skills','Projects','Contact'])
  );

  void setHover(int index,bool v)
  {
    final list=[...state.isHovered];
    list[index]=v;
    state=state.copyWith(isH: list);
  }
  void pressButton(int index)
  {
    final list=List.filled(5, false);
    list[index]=true;
    state=state.copyWith(isP: list);
  }

}

