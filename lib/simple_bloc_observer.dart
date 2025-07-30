import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change = $change');
    // العادية لاتظهر البيانات في عند نشر التطبيق Print هذة افضل من : debugPrint
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}

/* BlocObserver ما هو 

"نحن نخبر BLoC أن يستخدم مراقب (observer) خاص بنا لتتبع ما يحدث داخل الـ BLoCs والـ Cubits في التطبيق."

📌 طيب... ليش نعمل كذا؟ ما الفائدة؟
🔎 لأن BlocObserver يعطيك إشراف كامل على كل الأحداث داخل BLoC و Cubit:
مثلاً:
متى تم إنشاء الـ Cubit؟
متى تم تغيير الحالة (state)؟
ما هي الحالة القديمة والجديدة؟
متى تم حذف الكيوبت أو البلوك؟


💡 الفائدة الفعلية:
تسهيل التتبع (debugging) لما تتغير الحالة.
معرفة متى تم إنشاء أو إغلاق كل Cubit/BLoC.
مفيد جدًا أثناء التطوير أو في مشاريع كبيرة.
 */
