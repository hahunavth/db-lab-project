-- Database: shoptest

-- CREATE DATABASE shoptest
--   WITH OWNER = me
--        ENCODING = 'UTF8'
--        TABLESPACE = pg_default
--        LC_COLLATE = 'en_US.UTF-8'
--        LC_CTYPE = 'en_US.UTF-8'
--        CONNECTION LIMIT = -1;

 create table Product
    (
        IdProduct   varchar(4)  not null primary key,
        Price       int         not null,
        NameProduct varchar(50) not null,
        Brand       varchar(20) not null
    );

 create table DetailProduct
    (
        IdProduct  varchar(4) not null,
        DateSX     date,
        DescribePr varchar(500),
        foreign key (IdProduct) references Product (IdProduct)
            on delete cascade on update cascade,
        primary key (IdProduct, DescribePr)
    );
create table specifications
    (
        IdProduct    varchar(4) not null primary key,
        Memory       varchar(15),
        FrontCamera  varchar(15),
        BehindCamera varchar(15),
        CPU          varchar(30),
        OS           varchar(20),
        Pin          varchar(20),
        foreign key (IdProduct) references Product (IdProduct)
            on delete cascade on update cascade
    );

 create table Color
    (
        IdProduct varchar(4) not null,
        color     varchar(7),
        quantity  int,
        foreign key (IdProduct) references Product (IdProduct) on delete cascade on update cascade,
        primary key (IdProduct, Color)
    );

create table urlImage
    (
        IdProduct varchar(4) not null,
        urlImage  varchar(300),
        foreign key (IdProduct) references Product (IdProduct) on delete cascade on update cascade,
        primary key (IdProduct, urlImage)
    );

create table Orders
    (
        IdOrder   serial primary key,
        Receiver  varchar(30)  not null,
        Phone     varchar(10)  not null,
        Address   varchar(150) not null,
        TotalCost int,
        Day       date
    );

 create table DetailOrder
    (
        IdOrder   int,
        IdProduct varchar(4) not null,
        color     varchar(7),
        Quantity  smallint,
        foreign key (IdOrder) references Orders (IdOrder) on delete cascade on update cascade,
        foreign key (IdProduct) references Product (IdProduct) on delete cascade on update cascade,
        primary key (IdProduct, IdOrder, color)
    );

 insert into Product
    values ('1', 7590, '??i???n tho???i Samsung Galaxy A51', 'Samsung'),
           ('2', 13990, '??i???n tho???i Samsung Galaxy S10 Lite', 'Samsung'),
           ('3', 10400, '??i???n tho???i Samsung Galaxy A71', 'Samsung'),
           ('6', 14400, '??i???n tho???i iPhone 8 Plus 64GB', 'Apple'),
           ('7', 40900, '??i???n tho???i iPhone 11 ProMax  512GB', 'Apple'),
           ('10', 8900, '??i???n tho???i Oppo Reno2 F', 'Oppo'),
           ('11', 5900, '??i???n tho???i Oppo A9', 'Oppo'),
           ('12', 23000, '??i???n tho???i Oppo Find X2', 'Oppo'),
           ('14', 23990, '??i???n tho???i Huawei P40 Pro', 'Huawei'),
           ('15', 7900, '??i???n tho???i Huawei Nova 5T', 'Huawei'),
           ('18', 5900, '??i???n tho???i Xiaomi Redmi Note 9S', 'Xiaomi'),
           ('19', 13000, '??i???n tho???i Xiaomi Note 10 Pro', 'Xiaomi'),
           ('23', 10000, '??i???n tho???i Realme C7 Pro', 'Realme')
;
 insert into detailProduct
    values ('1', '2019-05-07', 'M??y c?? thi???t k??? m???ng nh??? thu???c h??ng top trong ph??n kh??c, ch??? 7.9 mm. M???t l??ng v???i h???a ti???t c???t kim c????ng ??a s???c n???i b???t, ??i k??m l?? 3 t??y ch???n m??u s???c s??nh ??i???u: Xanh Crush ??a S???c, Tr???ng Crush L???p L??nh, ??en Crush Kim C????ng.'),
           ('2', '2019-04-07', 'Samsung Galaxy S10 Lite l?? m???t phi??n b???n kh??c c???a d??ng Galaxy S10 ???? ra m???t tr?????c ???? nh??ng mang trong m??nh kh?? nhi???u kh??c bi???t v??? ngo???i h??nh c??ng nh?? b??n trong.'),
           ('3', '2019-05-20', 'Sau A51, Samsung ti???p t???c ra m???t Galaxy A71 l?? ?????i di???n k??? ti???p thu???c th??? h??? smartphone Galaxy A 2020. M??y ???????c c???i ti???n v???i camera macro si??u c???n ?????t ph??, camera ch??nh l??n ?????n 64 MP c??ng thi???t k??? th???i th?????ng v?? cao c???p.'),
           ('6', '2019-07-21', 'Th???a h?????ng nh???ng thi???t k??? ???? ?????t ?????n ????? chu???n m???c, th??? h??? iPhone 8 Plus thay ?????i phong c??ch b??ng b???y h??n v?? b??? sung h??ng lo???t t??nh n??ng cao c???p cho tr???i nghi???m s??? d???ng v?? c??ng tuy???t v???i.'),
           ('7', '2019-11-03', '????? t??m ki???m m???t chi???c smartphone c?? hi???u n??ng m???nh m??? v?? c?? th??? s??? d???ng m?????t m?? trong 2-3 n??m t???i th?? kh??ng c?? chi???c m??y n??o x???ng ??ang h??n chi???c iPhone 11 Pro Max 512GB m???i ra m???t trong n??m 2019 c???a Apple.'),
           ('10', '2020-01-15', 'Th???a h?????ng nh???ng thi???t k??? ???? ?????t ?????n ????? chu???n m???c, th??? h??? Oppo Reno2 F thay ?????i phong c??ch b??ng b???y h??n v?? b??? sung h??ng lo???t t??nh n??ng cao c???p cho tr???i nghi???m s??? d???ng v?? c??ng tuy???t v???i.'),
           ('11', '2019-09-05', 'K??? th???a phi??n b???n OPPO A7 ???? t???ng g??y hot tr?????c ????, OPPO A9 (2020) c?? nhi???u s??? c???i ti???n h??n v??? m??n h??nh, camera v?? hi???u n??ng tr???i nghi???m.'),
           ('12', '2020-03-12', 'Ti???p n???i th??nh c??ng vang d???i c???a th??? h??? Find X, OPPO ch??nh th???c ra m???t Find X2 v???i nh???ng ???????ng n??t thanh l???ch t??? thi???t k??? ph???n c???ng cho ?????n tr???i nghi???m ph???n m???m, h???a h???n m???t v??? ?????p ho??n h???o, m???t s???c m???nh x???ng t???m.'),
           ('14', '2020-04-20', 'Huawei P40 Pro l?? m???t trong 3 m???u smartphone ?????u b???ng n??m 2020 ?????n t??? nh?? Huawei. Chi???c m??y s??? h???u c???m 4 camera Leica ch???p ???nh v?? quay phim ?????nh cao, thi???t k??? m??n h??nh si??u tr??n ???n t?????ng c??ng hi???u n??ng kh???ng x???ng t???m flagship.'),
           ('15', '2017-05-30', 'Th???a h?????ng nh???ng thi???t k??? ???? ?????t ?????n ????? chu???n m???c, th??? h??? Huawei  Nova 5T thay ?????i phong c??ch b??ng b???y h??n v?? b??? sung h??ng lo???t t??nh n??ng cao c???p cho tr???i nghi???m s??? d???ng v?? c??ng tuy???t v???i.'),
           ('18', '2019-12-12', 'Si??u ph???m t???m trung Xiaomi Mi Note 10 Pro, chi???c smartphone ?????u ti??n s??? h???u ???ng k??nh ????? ph??n gi???i 108 MP c??ng h??? th???ng 5 camera ?????c ????o, c??ng ngh??? s???c si??u nhanh 30W ??i k??m nhi???u t??nh n??ng n???i tr???i kh??c.'),
           ('19', '2020-05-15', 'Th???a h?????ng nh???ng thi???t k??? ???? ?????t ?????n ????? chu???n m???c, th??? h??? Xiaomi Note 10 Pro thay ?????i phong c??ch b??ng b???y h??n v?? b??? sung h??ng lo???t t??nh n??ng cao c???p cho tr???i nghi???m s??? d???ng v?? c??ng tuy???t v???i.'),
           ('23', '2019-05-06', 'Nh???ng chi???c smartphone Realme lu??n g??y ???????c s??? ch?? ?? c???a ng?????i d??ng b???i nh???ng trang b??? tr??n m??y so v???i t???m gi?? ti???n v?? m???i ????y "si??u ph???m gi?? r???" Realme 5 3GB/64GB ra m???t l???i m???t l???n n???a khi???n ng?????i d??ng kh??ng kh???i "tr???m tr???".')
;
insert into Color
    values ('1', 'Red', 5),
           ('1', 'Black', 5),
           ('1', 'White', 5),
           ('2', 'Red', 2),
           ('2', 'Black', 5),
           ('2', 'White', 5),
           ('3', 'Red', 3),
           ('3', 'Black', 2),
           ('6', 'White', 2),
           ('6', 'Red', 5),
           ('10', 'Black', 4),
           ('19', 'Black', 5),
           ('19', 'Red', 2),
           ('15', 'Black', 4),
           ('15', 'White', 2),
           ('7', 'Black', 5),
           ('7', 'White', 5),
           ('11', 'Red', 2),
           ('11', 'Black', 5),
           ('11', 'White', 5),
           ('12', 'Red', 3),
           ('12', 'Black', 2),
           ('14', 'White', 2),
           ('14', 'Red', 5),
           ('18', 'Black', 4),
           ('23', 'Red', 2),
           ('23', 'Black', 4),
           ('12', 'White', 2)
;
 insert into urlImage
    values ('1', 'https://cdn.tgdd.vn/Products/Images/42/211570/samsung-galaxy-a51-white-1-400x460.png'),
           ('1', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/s/a/samsung-galaxy-a51-black_10.jpg'),
           ('1', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/s/a/samsung-galaxy-a51-white-400x400_1_2_5.jpg'),
           ('2', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/2/0/2026427.png'),
           ('2', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/s/a/samsung-galaxy-note-10-lite-600x600.jpg'),
           ('2', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/x/u/xuat-hien-anh-chup-thuc-te-cua-galaxy-note-10-lite-camera-vuong-1.png'),
           ('3', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/6/0/600_samsung-galaxy-a71_1_1.jpg'),
           ('3', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/s/a/samsung-galaxy-a71-thumblo_n-tra_ng-600x600_1.jpg'),
           ('3', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/x/a/xanh_78l4-a2_1.jpg'),
           ('6', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/8/-/8-plus-3_1.jpg'),
           ('6', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/8/-/8-plus-gold_12.jpg'),
           ('6', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/i/m/img_9001_2.jpg'),
           ('7', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-11-pro-max-midnight-green-select-2019_1.png'),
           ('7', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-11-pro-max-gold-select-2019_1.png'),
           ('7', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-11-pro-max-silver-select-2019_1.png'),
           ('10', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/r/e/reno_2f_2.jpg'),
           ('10', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/r/e/reno_2f_1.jpg'),
           ('10', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/l/a/lake-green.9e8cb487.png'),
           ('19', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/m/i/mi-cc9-pro-blue_1.jpg'),
           ('19', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/x/i/xiaomi-mi-cc9-pro-6-47-inch-6gb-128gb-smartphone-white-886232-_1.jpg'),
           ('19', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/x/i/xiaomi-mi-cc9-pro-6-47-inch-6gb-128gb-smartphone-grey-886228-_1.jpg'),
           ('15', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/6/3/637165989862080442_huawei-nova-5t-green-1.png'),
           ('15', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637105309126556376_huawei-nova-5t-xanh-1_1.png'),
           ('15', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637165989861768575_huawei-nova-5t-green-3.png'),
           ('11', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/a/9/a9-xanhbien_1.jpg'),
           ('11', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/o/p/oppo-a9-_-fa-rgb.jpg'),
           ('11', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/o/p/oppo-a9-_-_-fa-rgb.jpg'),
           ('12', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/6/3/637191049692122812_oppo-find-x2-xanh-1.png'),
           ('12', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637194500601105652_oppo-find-x2-xanh-4.png'),
           ('12', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637194500600555695_oppo-find-x2-xanh-3.png'),
           ('14', 'https://cdn.tgdd.vn/2020/04/campaign/1-800x450.jpg'),
           ('14', 'https://cdn.tgdd.vn/2020/04/campaign/2-800x450.jpg'),
           ('14', 'https://cdn.tgdd.vn/2020/04/campaign/3-800x450.jpg'),
           ('18', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/6/3/637060410960077373_xiaomi-redmi-note-8-xanh-1.png'),
           ('18', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637060415977209905_xiaomi-redmi-note-8-trang-1.png'),
           ('18', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637060418361864075_xiaomi-redmi-note-8-den-1.png'),
           ('23', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/6/3/637201240317028744_realme-6pro-do-1_1_2.png'),
           ('23', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/9df78eab33525d08d6e5fb8d27136e95/6/3/637201240317018721_realme-6pro-do-3_1.png'),
           ('23', 'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/thumbnail/115x/9df78eab33525d08d6e5fb8d27136e95/6/3/637201240317358960_realme-6pro-do-4_1.png')
;
    insert into specifications
    values ('1', '128 GB', '32 MP', '48 MP', 'Exynos 9611 8 nh??n', 'Android 10', '4500 mAh'),
           ('2', '128 GB', '32 MP', '48 MP', 'Snapdragon 855 8 nh??n', 'Android 10', '4400 mAh'),
           ('3', '128 GB', '32 MP', '64 MP', 'Snapdragon 730 8 nh??n', 'Android 10', '4200 mAh'),
           ('19', '128 GB', '32 MP', '48 MP', 'Snapdragon 720 8 nh??n', 'Android 9.0', '4700 mAh'),
           ('6', '128 GB', '32 MP', '48 MP', 'Snapdragon 710 8 nh??n', 'IOS', '4500 mAh'),
           ('10', '128 GB', '32 MP', '48 MP', 'Snapdragon 830 8 nh??n', 'Android 10', '4600 mAh'),
           ('15', '128 GB', '32 MP', '48 MP', 'Snapdragon 930 8 nh??n', 'Android 10', '4500 mAh'),
           ('7', '512 GB', '32 MP', '48 MP', 'Snapdragon 730 8 nh??n', 'IOS', '4000 mAh'),
           ('11', '128 GB', '27 MP', '48 MP', 'Snapdragon 720 8 nh??n', 'Android 10', '3500 mAh'),
           ('12', '128 GB', '32 MP', '47 MP', 'Snapdragon 830 8 nh??n', 'Android 10', '4200 mAh'),
           ('14', '128 GB', '30 MP', '48 MP', 'Snapdragon 910 8 nh??n', 'Android 9.0', '5000 mAh'),
           ('18', '128 GB', '30 MP', '45 MP', 'Snapdragon 750 8 nh??n', 'Adroid 10', '3500 mAh'),
           ('23', '128 GB', '32 MP', '48 MP', 'Snapdragon 715 8 nh??n', 'Android 10', '4500 mAh')
;