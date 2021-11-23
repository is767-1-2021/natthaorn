import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/profile.dart';

class TermsOfServicePage extends StatelessWidget {
  final DealController controller;
  const TermsOfServicePage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Terms Of Service',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple.shade600,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile2Page(
                          controller: controller,
                        )));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WeDeal',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Terms Of Service',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[300],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'ข้อกำหนดและเงื่อนไขในการใช้งาน WeDeal',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'ข้อกำหนดและเงื่อนไขในการใช้งาน WeDeal ฉบับนี้ ("ข้อกำหนดและเงื่อนไขฯ") ได้ระบุถึงข้อกำหนดและเงื่อนไขในการใช้งานผลิตภัณฑ์และบริการใดๆ (เรียกรวมกันว่า “บริการฯ”) ของ วีดีล คอร์ปอเรชั่น ("WeDeal") แก่ผู้ใช้บริการ (โดยแต่ละรายเรียกว่า "ผู้ใช้" หรือ “ผู้ใช้รายต่างๆ” ขึ้นอยู่กับเนื้อหา)',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 4,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'การตกลงยอมรับข้อกำหนดและเงื่อนไขฯ ฉบับนี้',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '1.ผู้ใช้ทุกรายจะต้องใช้บริการฯ ตามข้อกำหนดที่ระบุไว้ในข้อกำหนดและเงื่อนไขฯ ฉบับนี้ โดยผู้ใช้จะไม่สามารถใช้บริการฯ ได้เว้นเสียแต่ผู้ใช้ได้ตกลงยอมรับข้อกำหนดและเงื่อนไขฯ ฉบับนี้แล้ว',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '2.ผู้ใช้ซึ่งเป็นผู้เยาว์จะสามารถใช้บริการฯ ได้ก็ต่อเมื่อได้รับความยินยอมล่วงหน้าจากบิดามารดาหรือผู้แทนโดยชอบกฎหมายเท่านั้น นอกจากนี้ หากผู้ใช้ดังกล่าวใช้บริการฯ ในนามหรือเพื่อวัตถุประสงค์ขององค์กรธุรกิจใด ให้ถือว่าองค์กรธุรกิจดังกล่าวได้ตกลงยอมรับข้อกำหนดและเงื่อนไขฯ ฉบับนี้แล้วล่วงหน้า',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 4,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '3.หากมีข้อกำหนดและเงื่อนไขฯ เพิ่มเติมใดๆ ซึ่งเกี่ยวข้องกับการให้บริการฯ ผู้ใช้จะต้องปฏิบัติตามข้อกำหนดและเงื่อนไขฯ เพิ่มเติมดังกล่าวเช่นเดียวกับข้อกำหนดและเงื่อนไขฯ ในการใช้งานฉบับนี้',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 6,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'การแก้ไขข้อกำหนดและเงื่อนไขฯ ฉบับนี้',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'WeDeal อาจเปลี่ยนแปลงแก้ไขข้อกำหนดและเงื่อนไขฯ ฉบับนี้ได้ตลอดเวลาตามที่ WeDeal เห็นสมควรซึ่งจะอยู่ภายใต้ขอบวัตถุประสงค์ของข้อกำหนดและเงื่อนไขฯ ฉบับนี้ ในกรณีดังกล่าว WeDeal จะแจ้งเนื้อหาของข้อกำหนดฉบับแก้ไขรวมถึงวันที่มีผลบังคับใช้บนเว็บไซต์ของ WeDeal หรืออาจแจ้งให้ผู้ใช้ทราบด้วยวิธีการอื่นใดตามที่ WeDeal กำหนด ทั้งนี้ ข้อกำหนดและเงื่อนไขฉบับแก้ไขจะมีผลบังคับใช้ตามวันที่กำหนดต่อไป',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 6,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'บัญชี',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '1.เมื่อใช้บริการฯ ผู้ใช้อาจมีความจำเป็นต้องลงทะเบียนการใช้บริการฯ ด้วยข้อมูลบางประการ ทั้งนี้ ผู้ใช้ต้องให้ข้อมูลที่เป็นความจริง ถูกต้อง ครบถ้วนและมีหน้าที่ต้องปรับปรุงและแก้ไขข้อมูลดังกล่าวให้เป็นปัจจุบันอยู่เสมอ',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '2.ในกรณีที่ผู้ใช้ลงทะเบียนข้อมูลการยืนยันตัวตนใดๆ (Authentication information) เมื่อใช้บริการฯ ผู้ใช้ต้องใช้ความระมัดระวังในการจัดการข้อมูลดังกล่าวด้วยความรับผิดชอบของตน เพื่อให้เป็นที่เน่ใจว่าข้อมูลดังกล่าวจะไม่ถูกนำไปใช้ในลักษณะที่ไม่ชอบด้วยกฎหมาย ทั้งนี้ LINE อาจถือว่ากิจกรรมใดๆ ซึ่งดำเนินการโดยการใช้ข้อมูลการรับรองตัวตนดังกล่าว เสมือนเป็นกิจกรรมที่ผู้เป็นเจ้าของข้อมูลได้ดำเนินการด้วยตนเองทั้งสิ้น',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 6,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '3.ผู้ใช้ซึ่งลงทะเบียนใช้บริการฯ สามารถลบบัญชีของตนและยกเลิกการใช้บริการฯ ได้ไม่ว่าในเวลาใด',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '4.WeDeal ขอสงวนสิทธิในการลบบัญชีใดๆ ซึ่งไม่มีการเปิดใช้งานเป็นเวลากว่า หนึ่ง (1) ปี หรือนานกว่านับแต่วันที่มีการเปิดใช้งานบัญชีดังกล่าวครั้งล่าสุด ทั้งนี้ โดยไม่ต้องบอกกล่าวล่วงหน้าใดๆ แก่ผู้ใช้บัญชีดังกล่าว',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '5.สิทธิใดๆ ของผู้ใช้บริการอาจสิ้นสุดลงเมื่อบัญชีของผู้ใช้ดังกล่าวถูกลบไม่ว่าด้วยเหตุผลประการใดๆ ทั้งนี้ บัญชีการใช้บริการฯ จะไม่สามารถกู้คืนได้ถึงแม้ว่าผู้ใช้บริการฯ จะลบบัญชีของตนโดยไม่ได้ตั้งใจก็ตาม',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  '6.บัญชีแต่ละบัญชีในการใช้บริการฯ นั้น มีไว้เพื่อการใช้งานเฉพาะบุคคลและเป็นของเจ้าของบัญชีนั้นแต่เพียงผู้เดียว ผู้ใช้ไม่สามารถโอน ให้ยืม หรือจำหน่ายสิทธิในการใช้บัญชีของตนแก่บุคคลภายนอก ขณะเดียวกันบุคคลภายนอกก็ไม่สามารถรับช่วงสิทธิหรือสืบทอดบัญชีจากผู้ใช้ดังกล่าวได้เช่นกัน',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'การแจ้งเหตุฉุกเฉิน',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'ผู้ใช้ไม่สามารถพึ่งพาบริการฯ นี้เป็นบริการหลักในการแจ้งเหตุฉุกเฉินได้ ไม่ว่าจะเป็นการแจ้งเหตุไปยังหน่วยงานบังคับใช้กฎหมาย หน่วยงานด้านความปลอดภัยทางทะเล หน่วยงานดับเพลิง หรือหน่วยงานอื่นๆ ซึ่งให้บริการฉุกเฉิน',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 4,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'ผู้ให้บริการภายนอก',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'การให้บริการฯ นี้อาจมีเนื้อหาฯ หรือบริการอื่นใดซึ่งให้บริการหรือจัดทำโดยผู้ให้บริการภายนอก ในการนี้ผู้ให้บริการภายนอกดังกล่าวจะเป็นผู้รับผิดชอบแต่เพียงผู้เดียวเกี่ยวกับเนื้อหาฯ และ/หรือการให้บริการดังกล่าว นอกจากนี้ เนื้อหาฯ หรือบริการฯ ดังกล่าวอาจตกอยู่ภายใต้ข้อกำหนด การใช้ หรือข้อกำหนดและเงื่อนไขอื่นใดซึ่งผู้ให้บริการภายนอกได้กำหนดไว้สำหรับเนื้อหาและบริการนั้นๆ',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'ไม่รับประกันความเสียหาย',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'WeDeal จะไม่รับประกันใด ๆ ไม่ว่าโดยชัดแจ้งหรือโดยปริยายเกี่ยวกับการให้บริการฯ แก่ผู้ใช้ (ซึ่งรวมถึงเนื้อหาหลักฯ) ว่าบริการฯ นั้นปราศจากข้อบกพร่องใดๆ (ข้อบกพร่องในที่นี่รวมถึงแต่ไม่จำกัดเพียง ข้อบกพร่องด้านความปลอดภัย ฯลฯ ข้อผิดพลาด บัค (BUGS) หรือการละเมิดสิทธิใดๆ) หรือมีความปลอดภัย มีความน่าเชื่อถือ มีความถูกต้องสมบูรณ์ มีประสิทธิภาพ และมีความเหมาะสมแก่การใช้ประโยชน์เฉพาะอย่าง ทั้งนี้ WeDeal ไม่มีความรับผิดชอบในการที่จะต้องจัดหาบริการฯ ที่ไม่มีข้อบกพร่องดังกล่าวแต่อย่างใด',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'กฎหมายที่ใช้บังคับและเขตอำนาจศาล',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'ในกรณีที่ WeDeal ได้จัดหาคำแปลฉบับภาษาญี่ปุ่นของข้อกำหนดและเงื่อนไขฯ ฉบับนี้ให้แก่ผู้ใช้ ("ฉบับภาษาญี่ปุ่น") ให้ฉบับภาษาญี่ปุ่นมีผลใช้บังคับในเรื่องความสัมพันธ์ระหว่างผู้ใช้และ WeDeal ในกรณีที่มีการขัดกันระหว่างฉบับภาษาญี่ปุ่นและฉบับแปลอื่นเกิดขึ้นไม่ว่าในกรณีใด บทบัญญัติในฉบับภาษาญี่ปุ่นจะมีผลบังคับเหนือฉบับแปลอื่นใดทั้งสิ้น ทั้งนี้ ข้อกำหนดและเงื่อนไขฯ ฉบับนี้จะอยู่ภายใต้บังคับของกฎหมายญี่ปุ่น ความขัดแย้งที่เกิดขึ้นจากหรือมีความเกี่ยวพันกับการบริการฯ หรือความขัดแย้งระหว่างผู้ใช้และ WeDeal ที่เกี่ยวกับบริการฯ จะถูกตัดสินและอยู่ภายใต้เขตอำนาจศาลกรุงโตเกียว',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
