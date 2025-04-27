import 'package:flutter/material.dart';
import 'package:travel_app/screens/widgets/navigation_menu.dart';
import 'package:travel_app/screens/widgets/settings/menu_setting_title.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqItems = [
      {
        'question': 'Ứng dụng cung cấp thông tin gì?',
        'answer':
            'Ứng dụng cung cấp thông tin về các địa điểm du lịch, bao gồm mô tả, giá vé, giờ mở cửa và thông tin liên hệ.',
      },
      {
        'question': 'Làm sao để chuyển đổi ngôn ngữ?',
        'answer':
            'Bạn có thể chuyển đổi ngôn ngữ qua menu cài đặt hoặc nút trên giao diện.',
      },
      {
        'question': 'Thông tin hiển thị có được định dạng theo ngôn ngữ không?',
        'answer':
            'Có, các định dạng như giá vé, ngày giờ và số điện thoại sẽ được điều chỉnh theo ngôn ngữ/khu vực bạn chọn.',
      },
      {
        'question': 'Ứng dụng hỗ trợ những ngôn ngữ nào?',
        'answer': 'Ứng dụng hỗ trợ Tiếng Việt, Tiếng Anh và Tiếng Nhật.',
      },
      {
        'question': 'Tôi có thể xem chi tiết địa điểm như thế nào?',
        'answer':
            'Bạn có thể nhấn vào một địa điểm trong danh sách để xem chi tiết, bao gồm mô tả, giá vé và giờ mở cửa.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hướng dẫn sử dụng'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Hướng dẫn sử dụng ứng dụng Travel Guide Vietnam',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.live_help_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm câu hỏi',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xem câu hỏi phổ biến',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...faqItems.map(
                    (item) => Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          item['question']!,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              item['answer']!,
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.copyWith(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Tìm theo mục',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        MenuSettingTitle(
                          icon: Icons.home,
                          title: 'Trang chủ',
                          onTap: () {
                            // Navigate to home screen
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NavigationMenu(onLocaleChanged: (locale) {}),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                        MenuSettingTitle(
                          icon: Icons.help_rounded,
                          title: 'Cách sử dụng Ứng dụng',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.headset_mic),
      ),
    );
  }
}
