import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/profile.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final DealController controller;

  const PrivacyPolicyPage({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Privacy Policy',
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
                    'Privacy Policy',
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
                'บทนำ',
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
                  'บริษัท วีดีล คอร์ปอเรชั่น จำกัด (“WeDeal” “เรา” หรือ “พวกเรา”) จะดำเนินการเก็บรวบรวมข้อมูลที่เกี่ยวข้องกับบุคคล (“ข้อมูลส่วนบุคคล”) เพื่อให้บริการแอปพลิเคชัน WeDeal (“WeDeal App”) รวมถึงการนำเสนอสินค้า แอปพลิเคชัน การบริการ และเว็บไซต์ที่เกี่ยวข้องกับ WeDeal App ทั้งหมด (ต่อไปนี้รวมเรียกว่า “บริการฯ”)',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 6,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'นโยบายความเป็นส่วนตัวฉบับนี้ (“นโยบายความเป็นส่วนตัว”) อธิบายถึงประเภทของข้อมูลส่วนบุคคลที่เราทำการเก็บรวบรวม การใช้ การเปิดเผยข้อมูลส่วนบุคคล และวิธีการที่ท่านสามารถจัดการข้อมูลส่วนบุคคลของท่าน',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'เราแนะนำให้ท่านอ่านและทำความเข้าใจ “WeDeal Privacy Center”ซึ่งอธิบายถึงภาพรวมของนโยบายความเป็นส่วนตัวฉบับนี้ในลักษณะที่เข้าใจง่าย',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'การเปิดเผยข้อมูลส่วนบุคคล',
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
                  'เราจะไม่เปิดเผย หรือแชร์ข้อมูลส่วนบุคคลกับบุคคลที่สามเว้นแต่เราจะได้รับความยินยอมจากท่าน หรือเป็นการปฏิบัติตามกฎหมายที่มีผลบังคับใช้เมื่อเราได้รับความยินยอมจากท่าน หรือมีกฎหมายให้อำนาจไว้ เราอาจส่งหรือโอนข้อมูลส่วนบุคคลไปยังประเทศที่สามถึงแม้ว่าประเทศดังกล่าวจะไม่มีกฎหมายคุ้มครองข้อมูลส่วนบุคคลที่มีมาตรการการคุ้มครองข้อมูลส่วนบุคคลที่เทียบเท่ากับประเทศหรือภูมิภาคที่ท่านอาศัยอยู่ก็ตาม',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 6,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'โดยทั่วไปแล้ว เราจะไม่เปิดเผย หรือแชร์ข้อมูลส่วนบุคคลกับบุคคลที่สามเว้นแต่เราจะได้รับความยินยอมจากท่าน หรือเป็นการปฏิบัติตามกฎหมายที่มีผลบังคับใช้อย่างไรก็ตาม ในกรณีต่อไปนี้ เราอาจเปิดเผยข้อมูลส่วนบุคคลแก่บุคคลที่สามเพื่อประโยชน์ในการให้บริการฯบุคคลที่สามผู้รับข้อมูลส่วนบุคคล เช่น ผู้รับเหมาช่วง บริษัทสาขาและบริษัทในเครือที่ตั้งอยู่ในประเทศหรือภูมิภาคอื่นนอกเหนือจากที่ท่านอาศัยอยู่',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 6,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'กรณีเปิดเผยข้อมูลส่วนบุคคล เราอาจส่งหรือโอนข้อมูลดังกล่าวไปยังประเทศที่สามซึ่งเป็นประเทศที่ไม่มีกฎหมายคุ้มครองข้อมูลส่วนบุคคลหรือมีแต่กฎหมายคุ้มครองข้อมูลส่วนบุคคลดังกล่าวมีมาตรการการคุ้มครองข้อมูลส่วนบุคคลที่ไม่เทียบเท่ากับกฎหมายในประเทศหรือภูมิภาคที่ท่านอาศัยอยู่ (ณ วันที่ 23 มกราคม 2019 คณะกรรมาธิการยุโรปได้พิจารณาแล้วว่าญี่ปุ่นมีมาตรฐานความปลอดภัยเพียงพอในการคุ้มครองข้อมูลส่วนบุคคล) กรณีดังกล่าวข้างต้น เราจะใช้สัญญามาตรฐานหรือวิธีการอื่นๆ ที่เกี่ยวข้องกับมาตรการคุ้มครองข้อมูลส่วนบุคคลที่ได้รับการอนุมัติในประเทศหรือภูมิภาคของท่าน และเราจะส่งหรือโอนข้อมูลส่วนบุคคลดังกล่าวไปยังประเทศที่สามตามข้อกำหนดของกฎหมายที่มีผลใช้บังคับ',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 10,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'การเปิดเผยข้อมูลส่วนบุคคลต่อสาธารณะ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'โดยผู้ใช้เอง',
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
                  'ข้อมูลโปรไฟล์ที่ท่านลงทะเบียนจะถูกประมวลผลเป็นข้อมูลสาธารณะ ข้อความที่ท่านโพสต์บนไทม์ไลน์และกระดานข่าวตลอดจนการดำเนินการต่างๆ เช่น “ไลค์” และความคิดเห็นในโพสต์ของผู้ใช้รายอื่นจะเปิดเผยต่อบุคคลที่สามตามการตั้งค่าของการเปิดเผยและตำแหน่งของท่าน ข้อมูลดังกล่าวข้างต้นอาจถูกคัดลอก จัดเก็บ หรือส่งต่อโดยผู้รับ และเข้าถึงได้โดยผู้รับบุคคลที่สามโดยไม่ได้ตั้งใจเนื่องจากลักษณะของข้อมูลดิจิทัลนั้น ดังนั้น เมื่อท่านตั้งค่าโปรไฟล์หรือโพสต์บนบริการฯ ของเราโปรดคำนึงถึงเนื้อหาและขอบเขตของการเปิดเผยโพสต์ดังกล่าวด้วย',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 8,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'การรับจ้างช่วง',
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
                  'เราอาจต้องจ้างช่วงบุคคลที่สามเพื่อให้บริการบางอย่างที่จำเป็นต่อการให้บริการฯ ของเรา (เช่น การสร้างและการบริหารจัดการโครงสร้างพื้นฐาน, การจัดการการชำระหนี้, การขนส่งสินค้าหรือบริการ, การสนับสนุนลูกค้า ฯลฯ) โดยเราอาจให้ผู้รับจ้างช่วงประมวลผลข้อมูลส่วนบุคคลทั้งหมดหรือบางส่วน',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 4,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'ผู้รับจ้างช่วงจะเข้าถึงข้อมูลส่วนบุคคลอย่างน้อยที่สุดเท่าที่จำเป็นต่อการปฏิบัติตามสัญญาช่วงในนามของเราเท่านั้น และผู้รับจ้างช่วงดังกล่าวจะไม่ใช้ข้อมูลส่วนบุคคลนอกเหนือจากขอบเขตการให้บริการตามสัญญาช่วง',
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(
                  'ด้วยเหตุนี้ เราจึงสร้างระบบการจัดการข้อมูลส่วนบุคคลอย่างเหมาะสมขึ้น โดยเราจะปฏิบัติตามกฎหมายที่มีผลใช้บังคับและตรวจสอบคุณสมบัติของผู้รับจ้างช่วงให้มีความเหมาะสม รวมทั้งกำหนดเรื่องการรักษาความลับและการคุ้มครองข้อมูลส่วนบุคคลไว้ในสัญญาระหว่างเราและผู้รับจ้างช่วง',
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
