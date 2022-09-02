import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/widgets/appbar.dart';

import '../../utils/routes.dart';

class PromocodePage extends StatefulWidget {
  const PromocodePage({Key? key}) : super(key: key);

  @override
  State<PromocodePage> createState() => _PromocodePageState();
}

class _PromocodePageState extends State<PromocodePage> {
  bool isPromocodeApplied = false;
  TextEditingController _promocodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Promotions'),
      body: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary, width: 4),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: "Promo code",
              labelStyle: TextStyle(color: Colors.grey[400]),
            ),
            onChanged: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
              setState(() {
                if (!value.isEmptyOrNull) {
                  isPromocodeApplied = true;
                } else {
                  isPromocodeApplied = false;
                }
              });
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? null
                  : 'not valid email';
            },
          ),
          const HeightBox(30),
          const Text(
              'Enter the code and it will be applied to your next order'),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Apply Button Pressed'),
                duration: Duration(seconds: 1),
              ));
            },
            style: ButtonStyle(
              backgroundColor: isPromocodeApplied == true
                  ? MaterialStateProperty.all(
                      context.theme.colorScheme.secondary)
                  : MaterialStateProperty.all(Colors.yellow[200]),
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
            child: "Apply".text.xl.black.bold.make(),
          ).wh(MediaQuery.of(context).size.width, 50),
        ],
      ).p16(),
    );
  }
}
