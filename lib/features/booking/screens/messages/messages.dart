import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/call/call.dart';
import 'package:medica_consult/features/booking/screens/conversation_info/conversation_info.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/messages_text_field.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/received_message_box.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/sent_message_box.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:path_provider/path_provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<Map<String, dynamic>> messageArray =
      messagesArray; // Define a list to hold messages

  String? filePath;
  Directory? directory;

  @override
  void initState() {
    super.initState();
    getFilePath();
  }

  void getFilePath() async {
    directory = await getExternalStorageDirectory();
    setState(() {
      filePath =
          directory?.path != null ? '${directory!.path}/myFile.m4a' : null;
    });
  }

  void addMessage(String? content, String type) {
    final currentTime = DateTime.now();
    final message = {
      'sender': 'bob', // Assuming the sender is the user for now
      'content': content,
      'time': currentTime,
      'type': type
    };
    setState(() {
      messageArray.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0,
        title: SizedBox(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: const Image(
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  image: AssetImage(MedicaImages.user1),
                ),
              ),
              const SizedBox(
                width: MedicaSizes.sm,
              ),
              Expanded(
                child: Text(
                  'Firas Riahi',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.phone,
              color: MedicaColors.primary,
            ),
            onPressed: () {
              Get.to(() => VideoCallRingingScreen());
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.videocam_rounded,
              color: MedicaColors.primary,
            ),
            onPressed: () {
              Get.to(() => VideoCallRingingScreen());
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info,
              color: MedicaColors.primary,
            ),
            onPressed: () {
              Get.to(() => const ConversationInfoScreen());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: MedicaSizes.spaceBetweenItems,
                  right: MedicaSizes.spaceBetweenItems,
                ),
                child: Column(
                  children: messageArray.asMap().entries.map((entry) {
                    final data = entry.value;
                    return data["sender"] == "bob"
                        ? SentMessageBox(
                            content: data["content"],
                            time: data["time"],
                            type: data["type"],
                            directory: directory)
                        : ReceivedMessageBox(
                            content: data["content"],
                            time: data["time"],
                            type: data["type"],
                            directory: directory);
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: MedicaSizes.spaceBetweenItems,
              right: MedicaSizes.spaceBetweenItems,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: MedicaSizes.sm, bottom: MedicaSizes.sm),
              child: MyTextField(
                onSendMessage: addMessage,
                voiceMessageFilePath: filePath,
                directory: directory,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
