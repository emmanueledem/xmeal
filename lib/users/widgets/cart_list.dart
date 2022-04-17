import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';

class Cartlist extends StatelessWidget {
  const Cartlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          height: 72.95,
                          width: 88.35,
                          image: AssetImage('assets/images/Rectangle 308.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              'Fried Rice',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff0A191E),
                              ),
                            ),
                            Text(
                              'Nigerian',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff0A191E),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 30.67,
                  width: 83.58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: appColour, style: BorderStyle.solid, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        '-',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          fontSize: 21,
                          color: Color(0xffEA6435),
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 21,
                          color: Color(0xffEA6435),
                        ),
                      ),
                      Text(
                        '+',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          fontSize: 21,
                          color: Color(0xffEA6435),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    '₹100',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff050505),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
                child: const Icon(
              Icons.delete_rounded,
              color: appColour,
            )),
          ],
        ),
      ),
    );
  }
}
