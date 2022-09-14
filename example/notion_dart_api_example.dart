import 'package:notion_dart_api/notion_dart_api.dart';

Future<void> main() async {
  final officialToken = 'NOTION_OFFICIAL_TOKEN';
  final unofficialToken = 'NOTION_UNOFFICIAL_TOKEN';
  final databaseId = 'DATABASE_ID';
  final notion = Notion(officialToken: officialToken, unofficialToken: unofficialToken);
  //query database
  final database = await notion.getDatabase(databaseId);
  final children = await database.children();
  for (final child in children) {
    final icon = child.icon?.emoji;
    final title = child.properties?.titlePlainText;
    print('$icon $title');
  }
  notion.verbose = true;
  //create a page
  final page = await notion.updatePage(Page(
    parent: Parent(databaseId: databaseId),
    icon: Emoji(emoji: getRandomEmoji()),
    properties: PropertiesValue({
      'Name': PropertyValue(
        title: [RichText(text: Text(content: 'Test Title'))],
      ),
    }),
    children: [
      Block(
        paragraph: Paragraph(
          richText: [
            RichText(text: Text(content: 'test content')),
          ],
        ),
      )
    ],
  ));
  notion.verbose = false;
  //query block
  final block = await notion.getBlock(page.id!);
  printJson(block.childPage?.title);
  //remove page
  await notion.updatePage(Page(
    id: page.id,
    archived: true,
  ));
  //get bot info
  final user = await notion.whoami();
  printJson(user.toJson());
  //clear trash(need unofficial token)
  await notion.clear();
}
