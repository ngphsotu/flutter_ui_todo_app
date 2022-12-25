import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334),
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792)..init(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.menu, color: Color(0xFF433D82)),
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Stack(
      children: [
        _buildBodyContent(context),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: _buildAddButton(),
        ),
      ],
    );
  }

  _buildBodyContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildHelloWidget(context: context, name: 'Tung'),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildDateWidget(context: context),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTaskTypesWidget(context: context),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 20),
          _buildGridView(context)
        ],
      ),
    );
  }

  _buildAddButton() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25)),
      child: MaterialButton(
        color: const Color(0xFFFF4954),
        height: 55,
        minWidth: 55,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  _buildHelloWidget({@required BuildContext context, @required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello',
          style: Theme.of(context).textTheme.displayLarge.copyWith(
                color: const Color(0xFF433D82),
                fontSize: ScreenUtil(allowFontScaling: true).setSp(70),
              ),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.displayMedium.copyWith(
                color: const Color(0xFF433D82),
                fontSize: ScreenUtil(allowFontScaling: true).setSp(100),
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }

  _buildDateWidget({@required BuildContext context}) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: const TextStyle(fontSize: 14, color: Color(0xFF878695)),
        children: [
          TextSpan(
            text: '${DateFormat("EEEEE", "en_US").format(DateTime.now())}, ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil(allowFontScaling: true).setSp(27),
            ),
          ),
          TextSpan(
            text: DateFormat.yMMMMd("en_US").format(DateTime.now()),
            style: TextStyle(
              fontSize: ScreenUtil(allowFontScaling: true).setSp(27),
            ),
          ),
        ],
      ),
    );
  }

  _buildTaskTypesWidget({@required BuildContext context}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      _buildTaskStatusWidget(context: context, count: '57', title: 'Created'),
      _buildTaskStatusWidget(context: context, count: '35', title: 'Completed'),
    ]);
  }

  _buildTaskStatusWidget(
      {@required BuildContext context, String count, String title}) {
    return Row(
      children: <Widget>[
        Text(
          count,
          style: Theme.of(context).textTheme.titleLarge.copyWith(
                color: const Color(0xFF433D82),
                fontSize: ScreenUtil(allowFontScaling: true).setSp(45),
              ),
        ),
        const SizedBox(width: 10),
        Text(
          '$title \nTasks',
          style: TextStyle(
            color: const Color(0xFF878695),
            fontSize: ScreenUtil(allowFontScaling: true).setSp(25),
          ),
        )
      ],
    );
  }

  _buildGridView(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: ScreenUtil.screenWidth * 0.025,
        children: <Widget>[
          _buildGridTile(
            icon: Icons.library_books,
            title: 'All Schedule',
            context: context,
            subTitle: '57 Tasks',
          ),
          _buildGridTile(
            icon: Icons.group,
            title: 'Personal Errand',
            context: context,
            subTitle: '23 Tasks',
          ),
          _buildGridTile(
            icon: Icons.work,
            title: 'Work Projects',
            context: context,
            subTitle: '45 Tasks',
          ),
          _buildGridTile(
            icon: Icons.local_grocery_store,
            title: 'Grocery List',
            context: context,
            subTitle: '10 Tasks',
          ),
          _buildGridTile(
            icon: Icons.school,
            title: 'School Project',
            context: context,
            subTitle: '12 Tasks',
          ),
        ].map((Widget child) {
          return GridTile(child: child);
        }).toList(),
      ),
    );
  }

  Widget _buildGridTile({
    @required BuildContext context,
    @required IconData icon,
    String title,
    String subTitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.amber),
      title: Text(
        title.replaceAll(" ", "\n"),
        style: TextStyle(fontSize: ScreenUtil().setSp(35)),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.caption.copyWith(
              fontSize: ScreenUtil().setSp(30),
            ),
      ),
    );
  }
}
