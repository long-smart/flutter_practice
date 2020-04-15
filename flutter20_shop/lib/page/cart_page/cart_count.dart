import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter20_shop/model/cart.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/cart.dart';

class CartCount extends StatelessWidget {
  final CartModel item;

  CartCount({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(),
          _addBtn(context),
        ],
      ),
    );
  }

  // 减号按钮
  Widget _reduceBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.count <= 1) return;
        Provide.value<CartProvide>(context).goodsDecrease(item.goodsId);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count > 1 ? Colors.white : Colors.black12,
          border: Border(right: BorderSide(width: 1.0, color: Colors.black12)),
        ),
        child: Icon(Icons.remove),
      ),
    );
  }

  // 中间数量显示
  Widget _countArea() {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }

  // 加号按钮
  Widget _addBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).goodsadd(item.goodsId);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 1.0, color: Colors.black12)),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}