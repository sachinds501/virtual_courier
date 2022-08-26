import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/widgets/appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<String> payment_method = ['Bank Card', 'Cash on Dilevery', 'UPI'];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: myAppBar(context, 'Select preffered payment method',
          color: Colors.grey[200]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeightBox(20),
                    'PAYMENT METHOD'.text.bold.make(),
                    SizedBox(
                        height: 100,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Flexible(
                            child: SizedBox(
                              width: 20,
                            ),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Card(
                              elevation: 3,
                              color: selectedIndex == index
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                              child: payment_method[index]
                                  .text
                                  .gray400
                                  .size(12)
                                  .align(TextAlign.center)
                                  .bold
                                  .makeCentered(),
                            ).wOneForth(context).py16().cornerRadius(20),
                          ),
                        )),
                    'PAYMENT DETAILS'.text.bold.make(),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        labelText: "Card holder's name",
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? null
                            : 'not valid email';
                      },
                    ),
                    const HeightBox(20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.credit_card),
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        labelText: 'Card number',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? null
                            : 'not valid email';
                      },
                    ),
                    const HeightBox(20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 5),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              labelText: 'Date (MM/YY)',
                              labelStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            onSaved: (String? value) {},
                            validator: (String? value) {
                              return (value != null && value.contains('@'))
                                  ? null
                                  : 'not valid email';
                            },
                          ).pOnly(right: 8),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 5),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              labelText: 'CVV',
                              labelStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            onSaved: (String? value) {
                              // This optional block of code can be used to run
                              // code when the user saves the form.
                            },
                            validator: (String? value) {
                              return (value != null && value.contains('@'))
                                  ? null
                                  : 'not valid email';
                            },
                          ).pOnly(right: 8),
                        ),
                      ],
                    ),
                    const HeightBox(20),
                  ],
                ).p16(),
              ),
            ).cornerRadius(10).p16().wFull(context),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      context.theme.colorScheme.secondary),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  ),
                ),
                child: "Make Payment".text.xl.black.bold.make(),
              ).wh(MediaQuery.of(context).size.width, 50),
            ).p16()
          ],
        ),
      ),
    );
  }
}
