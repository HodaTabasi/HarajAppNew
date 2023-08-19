part of ads_detail_seller_view;

class AdsContactInfoComponent extends StatefulWidget {
  const AdsContactInfoComponent({super.key});

  @override
  State<AdsContactInfoComponent> createState() =>
      _AdsContactInfoComponentState();
}

class _AdsContactInfoComponentState extends State<AdsContactInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Column(
        children: [
          //TODO: Make Lang Here
          const LineDetail(
            detail: 'رقم التواصل : ',
            result: '+971 565484467',
          ),
          const LineDetail(
            detail: 'رقم الواتساب : ',
            result: '+971 565484467',
          ),
          const LineDetail(
            detail: 'حساب الفيسبوك : ',
            result: 'mahmoud_alserhi',
          ),
          const LineDetail(
            detail: 'الدردشة الداخلية : ',
            result: 'متاحة',
          ),
        ],
      ),
    );
  }
}
