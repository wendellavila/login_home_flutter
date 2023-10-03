import 'package:flutter/material.dart';
import 'package:login_home/ui/screens/login.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPage();
}

class _PasswordResetPage extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();

  bool _validateEmail(String email) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(email);
  }

  void _showSuccessDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("E-mail enviado!"),
                content: Text(
                    "Um e-mail de recuperação de senha foi enviado para o endereço ${_emailController.text}.\nConfira sua caixa de entrada."),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          ModalRoute.withName('/'),
                        );
                      },
                      child: Text(
                        "FECHAR",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onError),
                      ))
                ]));
  }

  Widget _passwordResetBody() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context)
          .unfocus(), //Hide keyboard when clicking outside of inputs
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Insira seu e-mail",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width < 450
                        ? MediaQuery.of(context).size.width
                        : 430,
                    child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(0.0),
                            error: (_emailController.text.isNotEmpty &&
                                    !_validateEmail(_emailController.text))
                                ? const Center(
                                    child: Text(
                                      "E-mail inválido",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : null),
                        textAlign: TextAlign.center,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_) => setState(() {}),
                        onFieldSubmitted: (_) {
                          if (_emailController.text.isNotEmpty &&
                              _validateEmail(_emailController.text)) {
                            _showSuccessDialog();
                          }
                        })),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 220,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (_emailController.text.isNotEmpty &&
                            _validateEmail(_emailController.text))
                        ? () async {
                            _showSuccessDialog();
                          }
                        : null,
                    child: Text("ENVIAR",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar Senha"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: _passwordResetBody(),
    );
  }
}
