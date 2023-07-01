import 'package:discover_ethiopia/constants/colors.dart';
import 'package:discover_ethiopia/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authStateProvider);
    print(authState.user);

    return Scaffold(
      body: Stack(
        children: [
          const SizedBox.expand(
            child: Image(
              image: AssetImage('assets/images/intro-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.6219, 0.8106],
                  colors: [
                    KPrimaryColor.shade50.withOpacity(0),
                    KPrimaryColor.shade900.withOpacity(0.82),
                    KPrimaryColor.shade900
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Discover Ethiopia",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Unleash the allure of Ethiopia's ancient wonders, vibrant cultures, and breathtaking landscapes on an unforgettable journey that will captivate your heart.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.8,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 88,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: () {
                          ref.read(authStateProvider.notifier).login();
                        },
                        child: AnimatedContainer(
                          height: 50,
                          width: authState.isLoading ? 50 : 300,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                offset: const Offset(0, 3),
                                blurRadius: 15,
                              )
                            ],
                          ),
                          child: Center(
                            child: authState.isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: KPrimaryColor.shade500,
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          BoxIcons.bxl_google,
                                          color: KPrimaryColor.shade900,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Sign in With Google",
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            color: KPrimaryColor.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastEaseInToSlowEaseOut,
                          opacity: authState.isLoading ? 0 : 1,
                          child: TextButton(
                            onPressed: () {
                              context.go('/home');
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                            ),
                            child: const Text("Continue as a Guest"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
