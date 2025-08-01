import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'MenuNotifier.dart';



final hoverProvider=StateProvider<List<bool>>((ref)
{
  return List.filled(4, false);
}
);

final menuProvider=StateNotifierProvider<MenuNotifier,MenuState>((ref)
{
  return MenuNotifier();
});

final skillContainerHoverProvider=StateProvider<List<bool>>((ref)
{
  return List.filled(6, false);
}
);