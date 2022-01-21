import 'package:beamer/beamer.dart';
import 'package:dishankdev/constants.dart';

class ViewDashboard extends StatelessWidget {
  const ViewDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        var _isMobileView = constraint.maxWidth <= 600;
        if (_isMobileView) {
          return const _MobileView();
        } else {
          return const _WebView();
        }
      },
    );
  }
}

class _WebView extends StatelessWidget {
  const _WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceViewPort = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: deviceViewPort.width,
        height: deviceViewPort.height,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            AppBarRow(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  scale: 8,
                ),
                const Text(
                  'dishank.dev',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    // await launch('https://www.linkedin.com/in/dishankjindal/');
                    Beamer.of(context).beamToNamed('/add');
                  },
                  child: const Text(
                    'Linkedin',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
                  onPressed: () async {
                    await launch('https://www.fiverr.com/share/xAYvAD');
                  },
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Hire Me',
                        style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.blueGrey,
              thickness: 0.1,
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      "Flutter Developer || Software Engineer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Expletus Sans').copyWith(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "I design and develops interactive Ui/Ux. I love what i do.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Expletus Sans').copyWith(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 100,
                      child: Image.asset(
                        'assets/animation_loader.gif',
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceViewPort = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: deviceViewPort.width,
        height: deviceViewPort.height,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            AppBarRow(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  scale: 16,
                ),
                const Text(
                  'dishank.dev',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    // await launch('https://www.linkedin.com/in/dishankjindal/');
                    Beamer.of(context).beamToNamed('/add');
                  },
                  child: const Text(
                    'Linkedin',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.blueGrey,
              thickness: 0.1,
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      "Flutter Developer\nSoftware Engineer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Expletus Sans').copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "I design and develops interactive Ui/Ux.\nI love what i do.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Expletus Sans').copyWith(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 100,
                      child: Image.asset(
                        'assets/animation_loader.gif',
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)))),
                      onPressed: () async {
                        await launch('https://www.fiverr.com/share/xAYvAD');
                      },
                      child: const SizedBox(
                        height: 48,
                        child: Center(
                          child: Text(
                            'Hire Me',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
