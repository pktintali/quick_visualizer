import 'index.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const MyDropdown(),
                  const XSortText(),
                  const InputContainer(),
                  const AvgVSWorstSwitch(),
                  GenerateAndSortRow(
                    scaffoldKey: _scaffoldKey,
                  ),
                  const MasterGraphWidget(),
                  const Text('No of Elements in Array  ➡'),
                  const ResetButton(),
                  const DisplayArrayWidget(),
                  const SizedBox(height: 80),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
