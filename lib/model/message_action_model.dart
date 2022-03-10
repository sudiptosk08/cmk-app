class MessageModel {
  String image;
  String text;

  MessageModel({
    this.image,
    this.text,
  });
}

final List<MessageModel> messageList = [
  MessageModel(image: 'assets/images/unselected.png', text: 'Pin Message'),
  MessageModel(image: 'assets/images/addcomment.png', text: 'Reply'),
  MessageModel(image: 'assets/images/share.png', text: 'Share with...'),
  MessageModel(image: 'assets/images/edit.png', text: 'Edit Message'),
  MessageModel(image: 'assets/images/delete.png', text: 'Delete'),
];
