import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giới thiệu'),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/travel_guide_vn.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ứng dụng Hướng dẫn Du lịch Đa ngôn ngữ',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Phiên bản: ',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                ),
                Text(
                  '1.0.0',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              'Về ứng dụng',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Ứng dụng Hướng dẫn Du lịch Đa ngôn ngữ được thiết kế để cung cấp cho người dùng thông tin chi tiết về các địa điểm du lịch nổi tiếng. '
              'Người dùng có thể khám phá các địa điểm với mô tả, giá vé, giờ mở cửa và thông tin liên hệ. '
              'Ứng dụng hỗ trợ nhiều ngôn ngữ, bao gồm Tiếng Việt, Tiếng Anh và Tiếng Nhật, cho phép người dùng xem nội dung bằng ngôn ngữ ưa thích của mình.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tính năng chính',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '- Xem danh sách các địa điểm du lịch với mô tả ngắn gọn.\n'
              '- Thông tin chi tiết về địa điểm, bao gồm giá vé, giờ mở cửa và thông tin liên hệ.\n'
              '- Chuyển đổi giữa các ngôn ngữ (Tiếng Việt, Tiếng Anh, Tiếng Nhật) qua menu cài đặt.\n'
              '- Hiển thị thông tin được định dạng theo ngôn ngữ/khu vực đã chọn (ví dụ: tiền tệ, ngày/giờ, số điện thoại).\n'
              '- Giao diện đẹp với hình ảnh minh họa.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Về nhóm phát triển',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Nhóm của chúng tôi đam mê tạo ra các ứng dụng thân thiện với người dùng và sáng tạo để nâng cao trải nghiệm du lịch của bạn. '
              'Chúng tôi hy vọng ứng dụng này sẽ giúp bạn khám phá thế giới một cách dễ dàng và tiện lợi.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Cảm ơn bạn đã sử dụng ứng dụng của chúng tôi!',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
