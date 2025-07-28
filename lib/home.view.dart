import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckApiChatPage extends StatefulWidget {
  const CheckApiChatPage({super.key});

  @override
  State<CheckApiChatPage> createState() => _CheckApiChatPageState();
}

class _CheckApiChatPageState extends State<CheckApiChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<_ChatMessage> messages = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    messages.add(
      _ChatMessage(
        "👋 Selamat datang di *Bot Deteksi Spam*!\n\nKetik pesan apa pun, dan saya akan bantu cek apakah itu spam atau bukan.",
        isUser: false,
        bubbleColor: Colors.grey.shade300,
      ),
    );
  }

  Future<void> checkApi(String inputText) async {
    if (inputText.trim().isEmpty) return;

    setState(() {
      messages.add(_ChatMessage(inputText, isUser: true));
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.3:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': inputText}),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final label =
            decoded['result'] ?? decoded['prediction'] ?? 'Tidak diketahui';

        String responseText;
        Color color;

        if (label == "Spam") {
          responseText =
              "⚠️ Pesan ini terdeteksi sebagai *SPAM*. Harap berhati-hati! 😠";
          color = Colors.red.shade200;
        } else {
          responseText = "✅ Pesan ini aman. Tidak terdeteksi sebagai spam. 😌";
          color = Colors.green.shade200;
        }

        messages.add(
          _ChatMessage(responseText, isUser: false, bubbleColor: color),
        );
      } else {
        messages.add(
          _ChatMessage(
            "❌ Gagal: ${response.statusCode}",
            isUser: false,
            bubbleColor: Colors.orange.shade200,
          ),
        );
      }
    } catch (e) {
      messages.add(
        _ChatMessage(
          "❌ Error: $e",
          isUser: false,
          bubbleColor: Colors.orange.shade200,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECE5DD),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 53, 143),
        title: const Text(
          "Chatbot Checker",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final alignment = msg.isUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft;

                final bubbleColor =
                    msg.bubbleColor ??
                    (msg.isUser ? Colors.lightBlue.shade100 : Colors.white);

                final borderRadius = BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(msg.isUser ? 12 : 0),
                  bottomRight: Radius.circular(msg.isUser ? 0 : 12),
                );

                return Align(
                  alignment: alignment,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: bubbleColor,
                      borderRadius: borderRadius,
                    ),
                    child: Text(msg.text, style: const TextStyle(fontSize: 15)),
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: "Ketik pesan...",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        filled: true,
                        fillColor: const Color(0xffF0F0F0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: const Color(0xff075E54),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: isLoading || _controller.text.trim().isEmpty
                          ? null
                          : () {
                              final input = _controller.text.trim();
                              _controller.clear();
                              checkApi(input);
                            },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final Color? bubbleColor;

  _ChatMessage(this.text, {this.isUser = false, this.bubbleColor});
}
