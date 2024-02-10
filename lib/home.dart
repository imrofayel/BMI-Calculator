import 'dart:math';

import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum Gender { male, female, other }

class _HomeState extends State<Home> {

  double bmi = 0;

  String info = '';

  String $info = '';

  Gender gender = Gender.male;

  double age = 18;

  TextEditingController height = TextEditingController();

  TextEditingController weight = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: AnnotatedRegion(

        value: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark, systemNavigationBarColor: Colors.white, systemNavigationBarIconBrightness: Brightness.dark),

        child: Scaffold(
        
          backgroundColor: Colors.white,
        
          appBar: AppBar(
          
            toolbarHeight: 80,
          
            title: const Opacity(
        
              opacity: 0.9,
        
              child: Text("BMI Calculator", textScaler: TextScaler.linear(1.2))),
          
            centerTitle: true,
          
            leading: CupertinoButton(child: const Icon(CupertinoIcons.back), onPressed: (){}),
          
            actions: [
          
              CupertinoButton(child: const Icon(CupertinoIcons.ellipsis), onPressed: (){}),
            ],
          ),
          
          body: Expanded(
        
            child: SingleChildScrollView(
        
              scrollDirection: Axis.vertical,
        
              child: Column(
              
                children: [
                  
                  Row(
              
                    mainAxisAlignment: MainAxisAlignment.center,
              
                    children: [
              
                      SegmentedButton(
        
                        style: const ButtonStyle(textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)), side: MaterialStatePropertyAll(BorderSide.none)),
                        
                        segments: const[
              
                          ButtonSegment(value: Gender.male, icon: Icon(Icons.male_sharp), label: Text("Male")),
              
                          ButtonSegment(value: Gender.female, icon: Icon(Icons.male_sharp), label: Text("Female")),
              
                        ], 
                        
                        selected: {gender},
              
                        onSelectionChanged: (selected) {
              
                          setState(() {
                            gender = selected.first;
                          });
                        },
                        
                      ),
                    ],
                  ),
              
                  const Gap(20),
              
                  Padding(
              
                    padding: const EdgeInsets.all(20),
              
                    child: Row(
                    
                      children: [
                    
                        Expanded(
                          
                          child: Container(
              
                            decoration: BoxDecoration(border: Border.all(color: CupertinoColors.lightBackgroundGray), borderRadius:BorderRadius.circular(100)),
              
                            child: Slider(
                              
                              activeColor: CupertinoColors.lightBackgroundGray,
              
                              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              
                              value: age,
                              min: 0,
                              max: 105,
                              onChanged: (value) {
                                setState(() {
                                  age = value;
                                });
                              },
                            ),
                          ),
                        ),
              
                        const Gap(8),
              
                        Container(
              
                          height: 50, width: 50,
              
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Theme.of(context).colorScheme.onSecondaryContainer),
                          
                          child: Center(child: Text("${age.toInt()}", textScaler: const TextScaler.linear(1.6), style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)))
                        
                        )
                      ],
                    ),
                  ),
                  
                  Padding(
              
                    padding: const EdgeInsets.all(20),
              
                    child: Row(
              
                      mainAxisAlignment: MainAxisAlignment.start,
                    
                      children: [
                    
                        Expanded(
                    
                          child: Column(
              
                            mainAxisAlignment: MainAxisAlignment.start,
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
              
                            children: [
              
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Height (cm)", textScaler: TextScaler.linear(1.6)),
                              ),
              
                              const Gap(6),
              
                              TextField(
                              
                                style: TextStyle(fontSize: 26, color: Theme.of(context).cardColor),
                              
                                controller: height,
              
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              
                                decoration: InputDecoration(
                              
                                  contentPadding: const EdgeInsets.fromLTRB(20, 14, 14, 14),
                              
                                  enabledBorder: OutlineInputBorder(
                              
                                    borderRadius: BorderRadius.circular(100),
                              
                                    borderSide: const BorderSide(color: CupertinoColors.lightBackgroundGray),
                                  ),
                              
                                  focusedBorder: OutlineInputBorder(
                              
                                    borderRadius: BorderRadius.circular(100),
                              
                                    borderSide: const BorderSide(color: CupertinoColors.lightBackgroundGray),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                    
                        const Gap(20),
                    
                        Expanded(
                          
                          child: Column(
              
                            crossAxisAlignment: CrossAxisAlignment.start,
              
                            children: [
              
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Weight (kg)", textScaler: TextScaler.linear(1.6)),
                              ),
              
                              const Gap(6),
              
                              TextField(
                              
                                controller: weight,
              
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              
                                style: TextStyle(fontSize: 26, color: Theme.of(context).cardColor),
                              
                                decoration: InputDecoration(
                              
                                  contentPadding: const EdgeInsets.fromLTRB(20, 14, 14, 14),
                              
                                  enabledBorder: OutlineInputBorder(
                              
                                    borderRadius: BorderRadius.circular(100),
                              
                                    borderSide: const BorderSide(color: CupertinoColors.lightBackgroundGray),
                                  ),
                              
                                  focusedBorder: OutlineInputBorder(
                              
                                    borderRadius: BorderRadius.circular(100),
                              
                                    borderSide: const BorderSide(color: CupertinoColors.lightBackgroundGray),
                                  )
                                ),
                              
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  const Gap(10),
              
                  FilledButton(onPressed: (){
              
                    setState(() {
              
                      if(weight.text.isNotEmpty && height.text.isNotEmpty){
              
                        bmi = double.parse(weight.text) / pow((double.parse(height.text)/100), 2);
              
                        info = Calculation.getInterpretation(bmi);
        
                        $info = Calculation.feedback(bmi);
              
                      }
                      else{
              
                      }
                    });
              
                  },
                  
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onSecondaryContainer), fixedSize: const MaterialStatePropertyAll(Size(200, 70))), 
                  
                  child: const Text("Calculate", textScaler: TextScaler.linear(1.8), style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
              
                  const Gap(30),
                                
                  Text.rich(
                    
                    textAlign: TextAlign.center,  
                            
                    TextSpan(
                      text: $info,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
        
                  const Gap(20),
        
                  Text.rich(
                    
                    textAlign: TextAlign.left,  
              
                    TextSpan(
                      text: '${bmi.roundToDouble()}',
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                        
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text.rich(
                      
                      textAlign: TextAlign.center,  
                              
                      TextSpan(
                        text: info,
                        style: const TextStyle(fontSize: 24),
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
}