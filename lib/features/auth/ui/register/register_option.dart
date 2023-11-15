import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Options {
  final String image;
  final String title;
  Options({required this.image, required this.title});
}

List<Options> registerOptions = [
  Options(image: 'Icons.abc', title: 'Persona'),
  Options(image: 'Icons.abc', title: 'Fundación'),
];

class RegisterOption extends StatefulWidget {
  const RegisterOption({super.key});

  @override
  State<RegisterOption> createState() => _RegisterOptionState();
}

class _RegisterOptionState extends State<RegisterOption> {
  int selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFf70B765)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quiero registrarme como...',
              style: TextStyle(
                color: Color(0xFf70B765),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int position) {
                  return InkWell(
                    onTap: () => setState(() {
                      selectedOption = position;
                    }),
                    child: SizedBox(
                      width: 190,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color(0xFf70B765),
                            width: 2,
                          ),
                        ),
                        color: (selectedOption == position)
                            ? const Color(0xFf70B765)
                            : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(registerOptions[position].image),
                            Text(
                              registerOptions[position].title,
                              style: TextStyle(
                                color: (selectedOption == position)
                                    ? Colors.white
                                    : const Color(0xFf70B765),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () => context.push('/login-main'),
                  child: const Text('Continuar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
