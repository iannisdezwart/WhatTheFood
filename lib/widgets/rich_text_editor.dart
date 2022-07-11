import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class RichTextEditor extends StatelessWidget
{
	final QuillController controller;
	final focusNode = FocusNode();

	RichTextEditor({ Key? key, required this.controller })
		: super(key: key);

	@override
	Widget build(BuildContext context)
	{
		return Column(children: [
				QuillToolbar.basic(
					controller: controller,
					multiRowsDisplay: false,
				),
				Container(
					height: 300,
					decoration: BoxDecoration(
						border: Border.all(
							color: Colors.grey,
							width: 1,
						),
						borderRadius: BorderRadius.circular(5),
					),
					child: SingleChildScrollView(
						scrollDirection: Axis.vertical,
						child: SizedBox(
							height: 300,
							child: QuillEditor(
								controller: controller,
								scrollable: true,
								scrollController: ScrollController(),
								focusNode: focusNode,
								autoFocus: true,
								readOnly: false,
								padding: const EdgeInsets.all(8),
								expands: false,
							),
						)
					)
				),
			]
		);
	}
}