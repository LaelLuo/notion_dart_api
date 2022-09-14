import './bookmark.dart';
import './breadcrumb.dart';
import './callout.dart';
import './child_page.dart';
import './code.dart';
import './color.dart';
import './column.dart';
import './divider.dart';
import './equation.dart';
import './heading.dart';
import './link_to_page.dart';
import './notion_file.dart';
import './paragraph.dart';
import './parent.dart';
import './rich_text.dart';
import './synced_block.dart';
import './table.dart';
import './table_row.dart';
import './template.dart';
import './todo.dart';
import './u_r_l.dart';
import './user.dart';
import 'common.dart';
import '../../notion.dart';

class Block {
  String? object;

  String? id;

  String? createdTime;

  String? lastEditedTime;

  User? createdBy;

  User? lastEditedBy;

  Parent? parent;

  bool? archived;

  bool? hasChildren;

  String? type;

  Paragraph? paragraph;

  Heading? heading1;

  Heading? heading2;

  Heading? heading3;

  Callout? callout;

  Paragraph? quote;

  Paragraph? bulletedListItem;

  Paragraph? numberedListItem;

  Todo? toDo;

  Paragraph? toggle;

  Code? code;

  ChildPage? childPage;

  URL? embed;

  NotionFile? image;

  NotionFile? video;

  NotionFile? file;

  List<RichText>? caption;

  NotionFile? pdf;

  Bookmark? bookmark;

  Equation? equation;

  Divider? divider;

  Color? tableOfContents;

  Breadcrumb? breadcrumb;

  Column? columnList;

  Column? column;

  URL? linkPreview;

  Template? template;

  LinkToPage? linkToPage;

  SyncedBlock? syncedBlock;

  Table? table;

  TableRow? tableRow;

  Notion? notion;

  Block({
    this.object,
    this.id,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.lastEditedBy,
    this.parent,
    this.archived,
    this.hasChildren,
    this.type,
    this.paragraph,
    this.heading1,
    this.heading2,
    this.heading3,
    this.callout,
    this.quote,
    this.bulletedListItem,
    this.numberedListItem,
    this.toDo,
    this.toggle,
    this.code,
    this.childPage,
    this.embed,
    this.image,
    this.video,
    this.file,
    this.caption,
    this.pdf,
    this.bookmark,
    this.equation,
    this.divider,
    this.tableOfContents,
    this.breadcrumb,
    this.columnList,
    this.column,
    this.linkPreview,
    this.template,
    this.linkToPage,
    this.syncedBlock,
    this.table,
    this.tableRow,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      object: as<String?>(json['object']),
      id: as<String?>(json['id']),
      createdTime: as<String?>(json['created_time']),
      lastEditedTime: as<String?>(json['last_edited_time']),
      createdBy: json['created_by'] == null ? null : User.fromJson(json['created_by']),
      lastEditedBy: json['last_edited_by'] == null ? null : User.fromJson(json['last_edited_by']),
      parent: json['parent'] == null ? null : Parent.fromJson(json['parent']),
      archived: as<bool?>(json['archived']),
      hasChildren: as<bool?>(json['has_children']),
      type: as<String?>(json['type']),
      paragraph: json['paragraph'] == null ? null : Paragraph.fromJson(json['paragraph']),
      heading1: json['heading_1'] == null ? null : Heading.fromJson(json['heading_1']),
      heading2: json['heading_2'] == null ? null : Heading.fromJson(json['heading_2']),
      heading3: json['heading_3'] == null ? null : Heading.fromJson(json['heading_3']),
      callout: json['callout'] == null ? null : Callout.fromJson(json['callout']),
      quote: json['quote'] == null ? null : Paragraph.fromJson(json['quote']),
      bulletedListItem: json['bulleted_list_item'] == null ? null : Paragraph.fromJson(json['bulleted_list_item']),
      numberedListItem: json['numbered_list_item'] == null ? null : Paragraph.fromJson(json['numbered_list_item']),
      toDo: json['to_do'] == null ? null : Todo.fromJson(json['to_do']),
      toggle: json['toggle'] == null ? null : Paragraph.fromJson(json['toggle']),
      code: json['code'] == null ? null : Code.fromJson(json['code']),
      childPage: json['child_page'] == null ? null : ChildPage.fromJson(json['child_page']),
      embed: json['embed'] == null ? null : URL.fromJson(json['embed']),
      image: json['image'] == null ? null : NotionFile.fromJson(json['image']),
      video: json['video'] == null ? null : NotionFile.fromJson(json['video']),
      file: json['file'] == null ? null : NotionFile.fromJson(json['file']),
      caption: (json['caption'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      pdf: json['pdf'] == null ? null : NotionFile.fromJson(json['pdf']),
      bookmark: json['bookmark'] == null ? null : Bookmark.fromJson(json['bookmark']),
      equation: json['equation'] == null ? null : Equation.fromJson(json['equation']),
      divider: json['divider'] == null ? null : Divider.fromJson(json['divider']),
      tableOfContents: json['table_of_contents'] == null ? null : Color.fromJson(json['table_of_contents']),
      breadcrumb: json['breadcrumb'] == null ? null : Breadcrumb.fromJson(json['breadcrumb']),
      columnList: json['column_list'] == null ? null : Column.fromJson(json['column_list']),
      column: json['column'] == null ? null : Column.fromJson(json['column']),
      linkPreview: json['link_preview'] == null ? null : URL.fromJson(json['link_preview']),
      template: json['template'] == null ? null : Template.fromJson(json['template']),
      linkToPage: json['link_to_page'] == null ? null : LinkToPage.fromJson(json['link_to_page']),
      syncedBlock: json['synced_block'] == null ? null : SyncedBlock.fromJson(json['synced_block']),
      table: json['table'] == null ? null : Table.fromJson(json['table']),
      tableRow: json['table_row'] == null ? null : TableRow.fromJson(json['table_row']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(object != null) jsonData['object'] = object;
    if(id != null) jsonData['id'] = id;
    if(createdTime != null) jsonData['created_time'] = createdTime;
    if(lastEditedTime != null) jsonData['last_edited_time'] = lastEditedTime;
    if(createdBy != null) jsonData['created_by'] = createdBy?.toJson();
    if(lastEditedBy != null) jsonData['last_edited_by'] = lastEditedBy?.toJson();
    if(parent != null) jsonData['parent'] = parent?.toJson();
    if(archived != null) jsonData['archived'] = archived;
    if(hasChildren != null) jsonData['has_children'] = hasChildren;
    if(type != null) jsonData['type'] = type;
    if(paragraph != null) jsonData['paragraph'] = paragraph?.toJson();
    if(heading1 != null) jsonData['heading_1'] = heading1?.toJson();
    if(heading2 != null) jsonData['heading_2'] = heading2?.toJson();
    if(heading3 != null) jsonData['heading_3'] = heading3?.toJson();
    if(callout != null) jsonData['callout'] = callout?.toJson();
    if(quote != null) jsonData['quote'] = quote?.toJson();
    if(bulletedListItem != null) jsonData['bulleted_list_item'] = bulletedListItem?.toJson();
    if(numberedListItem != null) jsonData['numbered_list_item'] = numberedListItem?.toJson();
    if(toDo != null) jsonData['to_do'] = toDo?.toJson();
    if(toggle != null) jsonData['toggle'] = toggle?.toJson();
    if(code != null) jsonData['code'] = code?.toJson();
    if(childPage != null) jsonData['child_page'] = childPage?.toJson();
    if(embed != null) jsonData['embed'] = embed?.toJson();
    if(image != null) jsonData['image'] = image?.toJson();
    if(video != null) jsonData['video'] = video?.toJson();
    if(file != null) jsonData['file'] = file?.toJson();
    if(caption != null) jsonData['caption'] = caption?.map((v) => v.toJson()).toList();
    if(pdf != null) jsonData['pdf'] = pdf?.toJson();
    if(bookmark != null) jsonData['bookmark'] = bookmark?.toJson();
    if(equation != null) jsonData['equation'] = equation?.toJson();
    if(divider != null) jsonData['divider'] = divider?.toJson();
    if(tableOfContents != null) jsonData['table_of_contents'] = tableOfContents?.toJson();
    if(breadcrumb != null) jsonData['breadcrumb'] = breadcrumb?.toJson();
    if(columnList != null) jsonData['column_list'] = columnList?.toJson();
    if(column != null) jsonData['column'] = column?.toJson();
    if(linkPreview != null) jsonData['link_preview'] = linkPreview?.toJson();
    if(template != null) jsonData['template'] = template?.toJson();
    if(linkToPage != null) jsonData['link_to_page'] = linkToPage?.toJson();
    if(syncedBlock != null) jsonData['synced_block'] = syncedBlock?.toJson();
    if(table != null) jsonData['table'] = table?.toJson();
    if(tableRow != null) jsonData['table_row'] = tableRow?.toJson();
    return jsonData;
  }

  Block copy() => Block.fromJson(toJson());
}
