part of ads_detail_buyer_view;

class BottomSheetBodyDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: ColorResource.lightGray,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close_rounded,
                size: 14.w,
                color: ColorResource.mainColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        AppText(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          text: context.localizations.more_details,
          color: ColorResource.mainFontColor,
        ),
        AppDivider(
          color: ColorResource.secondaryColor,
          height: 25.h,
          thickness: 1.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                LineDetail(
                  detail: 'المواصفات الاقليمية : ',
                  result: 'مواصفات خليجية',
                ),
                LineDetail(
                  detail: 'الضمان : ',
                  result: 'لا',
                ),
                LineDetail(
                  detail: 'نشر في  : ',
                  result: 'يونيو 12 . 2023',
                ),
                LineDetail(
                  detail: 'اللون الخارجي : ',
                  result: 'ازرق',
                ),
                LineDetail(
                  detail: 'عدد الابواب : ',
                  result: '4 ابواب',
                ),
                LineDetail(
                  detail: 'الحالة : ',
                  result: 'ممتازة من الداخل والخارج',
                ),
                LineDetail(
                  detail: 'اللون الداخلي : ',
                  result: 'اسود',
                ),
                LineDetail(
                  detail: 'عدد المقاعد : ',
                  result: '5 مقاعد',
                ),
                LineDetail(
                  detail: 'عدد الاسطوانات : ',
                  result: '8 اسطوانات',
                ),
                LineDetail(
                  detail: 'نوع الوقود : ',
                  result: 'بنزين',
                ),
                LineDetail(
                  detail: 'ميزات تقنية : ',
                  result: ' جر امامي',
                ),
                LineDetail(
                  detail: 'جهة القيادة : ',
                  result: 'اليسار',
                ),
                LineDetail(
                  detail: 'اضافي : ',
                  result: 'مراقب المناخ .......',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
