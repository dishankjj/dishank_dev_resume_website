import 'package:dishankdev/constants.dart';
import 'package:dishankdev/view/add/components/deffered.dart'
    deferred as addpage;

class AddDashboard extends StatefulWidget {
  const AddDashboard({Key? key}) : super(key: key);

  @override
  State<AddDashboard> createState() => _AddDashboardState();
}

class _AddDashboardState extends State<AddDashboard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: addpage.loadLibrary(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Material(child: Center(child: Text('Error')));
            }
            return addpage.AppAuthScreen();
          }
          return const Material(
              child: Center(child: CircularProgressIndicator()));
        });
  }
}
