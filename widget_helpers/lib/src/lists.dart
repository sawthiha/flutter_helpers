part of 'widgets.dart';

class AnimatedListController<T>   {
  final GlobalKey<AnimatedListState> key;
  final AnimatedListItemBuilder itemBuilder;
  final int initialItemCount;
  
  AnimatedListController(
    {
      required this.itemBuilder,
      this.initialItemCount = 0
    }
  ): key = GlobalKey<AnimatedListState>();

}

class AnimatedListWrapper extends StatelessWidget  {
  final AnimatedListController? controller;
  final Axis axis;

  const AnimatedListWrapper({
    Key? key,
    this.controller,
    this.axis = Axis.vertical,
  }): super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedList(
    key: controller!.key,
    itemBuilder: controller!.itemBuilder,
    initialItemCount: controller!.initialItemCount,
    scrollDirection: axis,
  );

}
