import 'dart:async';

import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/core/services/firebase/auth/auth_services.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await CustomLoadingOverlay.show(
              asyncFunction: () async {
                final currentContext = context;
                final signedOut = await AuthServices.signOut();
                if (signedOut) {
                  unawaited(
                    // ignore: use_build_context_synchronously
                    Navigator.of(currentContext).pushNamed(Routes.auth),
                  );
                }
              },
            );
          },
          child: const CustomText(
            'Sign out',
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
