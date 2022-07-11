import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class RichTextView extends StatelessWidget
{
	final QuillController controller;
	final focusNode = FocusNode(canRequestFocus: false);

	RichTextView({ Key? key, required this.controller })
		: super(key: key);

	@override
	Widget build(BuildContext context)
	{
		return QuillEditor(
			controller: controller,
			scrollable: true,
			scrollController: ScrollController(),
			focusNode: focusNode,
			autoFocus: false,
			readOnly: true,
			padding: const EdgeInsets.all(8),
			expands: false,
		);
	}
}