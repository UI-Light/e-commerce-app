import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/core/presentation/widgets/stars.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    if (counter == 0) {
      setState(() {
        counter = 0;
      });
    } else {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Palette.categoryGridBg,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/perfume.png',
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Garnier White Skincare',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Stars(),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      '\$200.00',
                      style: TextStyle(
                          color: Palette.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Text(
                      'Select size',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          color: Palette.productGridBg,
                          child: const Text('100 GM'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Palette.productGridBg,
                          child: const Text('150 GM'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Palette.productGridBg,
                          child: const Text('200 GM'),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        TextButton(
                          onPressed: () {
                            decrement();
                          },
                          child: const Text(
                            '-',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Text(
                          counter.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 20,
                          color: Palette.blue,
                          child: GestureDetector(
                              onTap: () {
                                increment();
                              },
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Product Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0.0),
                            backgroundColor:
                                MaterialStatePropertyAll(Palette.blue),
                            // fixedSize: MaterialStatePropertyAll<Size>(
                            //   Size.fromWidth(160),
                            // ),
                            minimumSize:
                                MaterialStatePropertyAll<Size>(Size(160, 40)),
                          ),
                          child: const Text('Add to cart'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0.0),
                            backgroundColor: MaterialStatePropertyAll(
                                Palette.categoryGridBg),
                            //fixedSize: MaterialStatePropertyAll<Size>(
                            // Size.fromWidth(160),
                            // ),
                            minimumSize:
                                MaterialStatePropertyAll<Size>(Size(160, 40)),
                          ),
                          child: const Text('Buy Now',
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
