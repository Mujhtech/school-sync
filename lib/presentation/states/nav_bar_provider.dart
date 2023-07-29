import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_sync/presentation.dart';

part 'nav_bar_provider.g.dart';

@Riverpod(dependencies: <Object>[])
class NavbarBody extends _$NavbarBody {
  @override
  NavbarBodyState build() {
    return const NavbarBodyState(current: NavbarMenuEnum.home, previous: null);
  }

  void switchNav(NavbarMenuEnum current) async {
    state = NavbarBodyState(previous: state.current, current: current);
  }
}

class NavbarBodyState with EquatableMixin {
  const NavbarBodyState({
    required this.previous,
    required this.current,
  });

  final NavbarMenuEnum? current;
  final NavbarMenuEnum? previous;

  @override
  List<Object?> get props => <Object?>[current, previous];
}
