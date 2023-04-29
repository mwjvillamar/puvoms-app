class MessageList {
  final String senderUID;
  final String senderName;
  final String senderRole;
  final String message;
  final DateTime dateSent;
  
  MessageList({
    required this.senderUID,
    required this.senderName,
    required this.senderRole,
    required this.message,
    required this.dateSent
  });
}