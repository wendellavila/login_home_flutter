import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/home/home.dart';
import 'package:login_home/ui/screens/password_reset.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  Widget _landscapeLoginBody() {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(), //Hide keyboard when clicking outside of inputs
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 220,
                            child: Image(
                              image: AssetImage('assets/img/logo/logo-HQ.png'),
                              width: 500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "LOGIN PAGE",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Usuário",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width < 450 ? MediaQuery.of(context).size.width : 430,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
                              controller: _codeController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (_) => setState(() {}),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Senha",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width < 450 ? MediaQuery.of(context).size.width : 430,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.done,
                              autocorrect: false,
                              enableSuggestions: false,
                              obscureText: _showPassword ? false : true,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.all(0.0),
                                  suffixIcon: IconButton(
                                    icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () => setState(() {
                                      _showPassword = _showPassword ? false : true;
                                    }),
                                  )),
                              onChanged: (_) => setState(() {}),
                              onFieldSubmitted: (_) {
                                if (_codeController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()),
                                    ModalRoute.withName('/'),
                                  );
                                }
                              },
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: (_codeController.text.isNotEmpty && _passwordController.text.isNotEmpty)
                                ? () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HomePage()),
                                      ModalRoute.withName('/'),
                                    );
                                  }
                                : null,
                            child: Text("ENTRAR", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onPrimary)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.surface),
                            child: Text("RECUPERAR SENHA", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onPrimary)),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage())),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _portraitloginBody() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(), //Hide keyboard when clicking outside of inputs
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width < 520 ? MediaQuery.of(context).size.width * 0.5 : 320,
                      child: const Image(
                        image: AssetImage('assets/img/logo/logo-HQ.png'),
                        width: 500,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "LOGIN PAGE",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Usuário",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 520 ? MediaQuery.of(context).size.width * 0.8 : 500,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.next,
                      controller: _codeController,
                      decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.all(0.0)),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Senha",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 520 ? MediaQuery.of(context).size.width * 0.8 : 500,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: _showPassword ? false : true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.all(0.0),
                        suffixIcon: IconButton(
                          icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() {
                            _showPassword = _showPassword ? false : true;
                          }),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                      onFieldSubmitted: (_) {
                        if (_codeController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                            ModalRoute.withName('/'),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (_codeController.text.isNotEmpty && _passwordController.text.isNotEmpty)
                          ? () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                                ModalRoute.withName('/'),
                              );
                            }
                          : null,
                      child: Text("ENTRAR", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onPrimary)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        "RECUPERAR SENHA",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordResetPage(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginBody() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _portraitloginBody();
        } else {
          return _landscapeLoginBody();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _loginBody(),
    ));
  }
}
