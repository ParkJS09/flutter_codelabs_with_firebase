import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CountPage extends StatefulWidget {
  static const routes = 'count_pages';
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Baby Name Votes'),
        ),
        body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    //StreamBuilder위젯은 데이터베이스에 대한 업데이트를 청취하고
    // 데이터가 변경 될 때마다 목록을 새로 고칩니다.
    // 데이터가 없으면 진행률 표시기가 나타납니다.
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('baby').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data.documents);
        }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    return ListView(
        padding: const EdgeInsets.only(top:  20.0),
        children : snapshot.map((data) => _buildListItem(context, data)).toList()
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          //onTap: () => record.reference.updateData({'votes':record.votes+1}),
          onTap: () => record.reference.updateData({'votes':FieldValue.increment(1)}),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data, reference : snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}