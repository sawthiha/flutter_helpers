part of 'widgets.dart';

class MaterialCard extends StatelessWidget{
  final Widget media;
  final String title;
  final String? secondary;
  final Map<String, VoidCallback>? actionMap; 
  final double? width;
  final double? height;

  const MaterialCard(
    {
      Key? key,
      required this.title,
      this.secondary,
      required this.media,
      this.actionMap,
      this.width,
      this.height,
    }
  ): super(key: key);
  
  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    margin: const EdgeInsets.only(left: 10),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          media,
          ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6
            ),
            subtitle: Text(
              secondary!,
              style: Theme.of(context).textTheme.subtitle1
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: actionMap!.entries.map<Widget>(
              (entry) => TextButton(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                  child: Text(entry.key),
                ),
                onPressed: entry.value
              )
            ).toList()
          )
        ],
      ),
    ),
  );

}