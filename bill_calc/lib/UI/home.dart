import 'package:flutter/material.dart';

class BillCalc extends StatefulWidget {
  const BillCalc({Key? key}) : super(key: key);

  @override
  State<BillCalc> createState() => _BillCalcState();
}

class _BillCalcState extends State<BillCalc> {
  int _TotalBill = 0;
  int _allPersons = 1;
  double _tipPercentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(14.0)),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Center(
                  child: Text(
                    "\$ ${calculateTotal(_TotalBill, _allPersons, calculateTip(_TotalBill, _tipPercentage))} ",
                    style:
                        const TextStyle(fontSize: 35.0, color: Colors.purple),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )),
          ),
          Center(
            child: Container(
                margin: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.4),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                        child: TextField(
                          onChanged: (String value) {
                            try {
                              setState(() {
                                _TotalBill = int.parse(value);
                              });
                              if (value.isEmpty) {
                                setState(() {
                                  _TotalBill = 0;
                                });
                              }
                            } catch (e) {
                              setState(() {
                                _TotalBill = 0;
                              });
                            }
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.monetization_on_rounded),
                              prefixIconColor: Colors.purple),
                          style: const TextStyle(
                            color: Colors.purple,
                            fontSize: 25.0,
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Persons",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_allPersons != 1) {
                                      _allPersons--;
                                    }
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.purple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.purple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Text(
                                    "$_allPersons",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.purple),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _allPersons++;
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.purple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ]),
                          ]),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  "\$ Total Tip",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 25,
                                      color: Colors.purple),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Text(
                                  "${calculateTip(_TotalBill, _tipPercentage)}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.purple),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Slider(
                            activeColor: Colors.purple,
                            inactiveColor: Colors.grey,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            value: _tipPercentage,
                            onChanged: (double value) {
                              setState(() {
                                _tipPercentage = value;
                              });
                            },
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  calculateTotal(int bill, int totalPerson, double percentage) {
    double totalTip = 0.0;
    if (bill < 0 ||
        totalPerson.toString().isEmpty ||
        percentage.toString().isEmpty) {
    } else {
      totalTip = ((bill + percentage) / totalPerson);
    }
    return totalTip.roundToDouble();
  }

  calculateTip(int totalBill, double percentage) {
    double total = 0;
    if (totalBill < 0 || percentage.toString().isEmpty) {
    } else {
      total = totalBill / 100 * percentage;
    }
    return total.roundToDouble();
  }
}
