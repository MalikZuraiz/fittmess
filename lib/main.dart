import 'package:fittmess/app/routes/app_pages.dart';
import 'package:fittmess/app/services/supabaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://jrhcipgyfiygwirnfhcb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpyaGNpcGd5Zml5Z3dpcm5maGNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc1ODE0MjEsImV4cCI6MjA1MzE1NzQyMX0.bcw7TAvKJhU9-zA_WlHtdTpgSv_ioKfcl3A1llWBB7g',
  );

  Get.put(SupabaseService()); // Bind the SupabaseService
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fittness',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
