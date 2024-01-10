alter table product
add constraint fk1 foreign key(catid) references
category(catid) on delete restrict;

alter table lineitem
add constraint fk2 foreign key(orderid) references
orders(orderid) on delete cascade;

alter table account
add constraint ck1 check(sex ='男' or sex = '女');

update product
set
	unitcost = (unitcost*qty + 50*15) / (qty + 50),
    listprice = unitcost * 1.2,
    qty = qty + 50
where
	name = '天使鱼';
    

delete from orders where userid = 'u0004';

select fullname 姓名, address 地址, phone 电话 from account;

select userid 订单号, totalprice 订单总价, status 订单状态 from orders
where totalprice >= 200;

select fullname, totalprice from account, orders
where account.userid = orders.userid and sex = '女' and orderdate < '2020-05-01';


select max(totalprice) 最高金额, min(totalprice) 最低金额 from orders;

alter table orders
add constraint fk3 foreign key(userid) references account(userid)
on delete restrict on update restrict;

update orders set status = 1 where orderid = '20130411';

select distinct(orderid), unitprice from lineitem;

select fullname 姓名,(case sex
when '男' then 1
when '女' then 0
end
) 性别 from account;

select * from product where productid like '%W___';

select orderid, name, quantity from product, lineitem where lineitem.orderid = product.productid;

select * from account, orders where fullname = '刘晓和 ' and account.userid = orders.userid;

select count(*) from account;

select sum(qty), avg(unitcost) from product group by catid;

select * from orders order by  userid asc, orderdate desc;

use petstore;
alter table lineitem
add constraint fk4 foreign key(itemid) references product(productid) on update cascade  on delete cascade;

select quantity*unitprice 商品金额, orderid 订单号 from lineitem;

select name 商品名,(case
when  listprice <1000 then '低价商品'
when  listprice >=1000 and listprice < 2000 then '中档商品'
when  listprice >=2000 then '高价商品'
end
)档次 from product;

select fullname 姓名,address 地址,phone 电话 from account where sex = '女';

select * from orders where totalprice>=200 and totalprice<=500;

select fullname, totalprice from orders, account where account.userid = orders.userid and totalprice>=300;

select sum(totalprice) 订单总额 from orders;

select count(*) 人数, sex 性别 from account group by sex;

select itemid, quantity from lineitem where quantity >2 order by quantity;

update product, lineitem
set qty = qty -quantity where product.productid = lintitem.itemid and orderid = '20130411';


use LibraryDB;
alter table 读者表
add constraint fk5 foreign key(类别号) references 读者类型表(类别号) on update cascade on delete cascade;

alter table 读者类型表
add constraint ck1 check(可借数量>=0 and 可借数量<=30);

insert into 借阅表 
values(default, "2234120", '2001',current_date(), null,'借阅');
update 库存表 
set 库存状态='借出' where 条码 ='223410';

delete from 借阅表 where 读者编号=(select 读者编号 from 读者表 where 姓名='苏明');
delete from 读者表 where 姓名='苏明';

select distinct (书号), 库存状态列 from 库存表;

select * from 库存表 where 位置 like '%A%' and 库存状态='借出';

select * from 读者表,借阅表 where 读者表.读者编号 = 借阅表.借阅编号 and 姓名 = '张小东';

select 姓名,单位,可借天数,可借数量 from 读者表,读者类型表 where 读者表.类型号=读者类型表.类型号;

select 单位, count(*)人数 from 读者表 group by 单位;


select * from 读者表 where 类型号 in(select 类型号 from 读者类型表 where 类名='教师' or 类名 = '学生');

use librarydb;
alter table 读者表
add constraint pk1 primary key(读者编号);

alter table 借阅表
add constraint fk2 foreign key(条码) references 
库存码(条码) on update cascade on delete cascade;

insert into 图书表
values('C3325', '计算机基础', '计算机', '陈焕东', '高等教育出版社', 38.6, 2);
insert into 库存表
values('331122','C3325','3-B-01','在馆');
insert into 库存表
values('331123','C3325','3-B-02','在馆');

select 条码, (case
when '在馆' then '1'
when '借出' then '0'
when '丢失' then '-1'
end
)库存状态 from 库存表;

select * from 图书表 where  类别='财经' or 类别='文学'  and 数量>5;

select  姓名,书名,借阅日期,借阅状态 from 借阅表, 读者表,读书表,库存表;

select 单位, count(*) 读者人数 from 读者表
group by 单位 having count(*)>=2;


select * from 图书表 order by 数量 desc;

select * from 借阅表 order by 借阅状态,借阅数量;




