import 'package:flutter/material.dart';
import '../../theme/style.dart';
import '../../model/category_model.dart';
import '../../request/api.dart';
import '../../theme/constants.dart';

/*
 * 分类页面
 */
class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {
  CategoryModel _category;

  Widget _getCategoryWidet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CategoryMainWidget._(_category, (MainCategoryItem mainCategoryItem) {
          //处理左侧列表点击事件
          print(mainCategoryItem.cateName);
        }),
        Expanded(
          child: CategoryItemWidget._(
            _category.mainCategoryItems[0],
            (SubCategoryItem item) {
              //处理右侧列表点击事件
              print(item.cateTitle);
            },
          ), //直接写死0会使默认无效。一会想办法改
        ),
      ],
    );
  }

  Future<void> _getCategory() async {
    var data = await getCategory();
    setState(() {
      _category = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getWhiteTheme(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text(HOME_PAGE_CATEGORY_HINT, style: itemTitleStyle),
        ),
        body: _category == null ? getProgressWidget() : _getCategoryWidet(),
      ),
    );
  }
}

class CategoryMainWidget extends StatefulWidget {
  CategoryMainWidget._(this._categoryModel, this._callback);

  final ValueChanged<MainCategoryItem> _callback;
  final CategoryModel _categoryModel;

  @override
  State<StatefulWidget> createState() {
    return CategoryMainWidgetState();
  }
}

class CategoryMainWidgetState extends State<CategoryMainWidget> {
  String defaultId;

  @override
  void initState() {
    super.initState();
    defaultId = widget._categoryModel.defaultId;
  }

  Widget _buildRow(MainCategoryItem mainCategoryItem) {
    return InkWell(
      onTap: () {
        setState(() {
          defaultId = mainCategoryItem.cateId;
        });
        widget._callback(mainCategoryItem);
      },
      child: SizedBox(
        height: 55,
        child: Row(
          children: <Widget>[
            defaultId == mainCategoryItem.cateId
                ? Container(
                    margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                    width: 5.0,
                    decoration: BoxDecoration(
                      color: Color(0xfffed952),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 5.0),
                  ),
            Container(
              width: 95,
              child: Center(
                child: Text(
                  mainCategoryItem.cateName,
                  style: defaultId == mainCategoryItem.cateId
                      ? itemTitleStyle
                      : itemSubTitleStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ListView.builder(
        itemCount: widget._categoryModel.mainCategoryItems.length,
        itemBuilder: (context, index) {
          return _buildRow(widget._categoryModel.mainCategoryItems[index]);
        },
      ),
    );
  }
}

//右侧ListView组件
class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget._(this._mainCategoryItem, this._callback);

  final ValueChanged<SubCategoryItem> _callback;
  final MainCategoryItem _mainCategoryItem;

  Widget _getGridItemView(SubCategoryItem item) {
    return InkWell(
      onTap: () {
        _callback(item);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            item.cateUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Text(
            item.cateTitle,
            style: itemSmallTitleStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _mainCategoryItem.subCategoryGroups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _mainCategoryItem.subCategoryGroups[index].cateGroupName,
                  style: itemTitleStyle,
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 5,
                  padding: EdgeInsets.all(10),
                  children: _mainCategoryItem.subCategoryGroups[index].cateList
                      .map((SubCategoryItem item) {
                    return _getGridItemView(item);
                  }).toList(),
                ),
              ],
            ),
          );
        });
  }
}
