import 'package:flutt/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SVGProvider svgProvider;

  @override
  void initState() {
    super.initState();
    svgProvider = Provider.of<SVGProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tugas Rest-API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Consumer<SVGProvider>(
                  builder: (context, provider, _) {
                    if (svgProvider.image != null) {
                      return SvgPicture.string(svgProvider.image!);
                    } else {
                      return const Icon(
                        Icons.account_circle_outlined,
                        size: 50,
                      );
                    }
                  },
                ),
              ),
              TextFormField(
                controller: svgProvider.nameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Name',
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF4A5157),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  svgProvider.svgImage();
                },
                child: const Text('Generate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
