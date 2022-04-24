part of views;

class Home extends StatelessWidget  {

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    key: Key('Home'),
    body: const Center(
      child: Text('Hello there'),
    ),
  );

}

class FloatingStack extends StatelessWidget  {
  @override
  Widget build(BuildContext context) => Stack(

  );

}
