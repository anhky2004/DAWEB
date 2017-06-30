var mustache = require('mustache'),
    db = require('../fn/db');

exports.loadAll = function() {
    var sql = 'select * from products';
    return db.load(sql);
}

exports.loadRandom = function() {
    var sql = 'select * from products order by rand() limit 8';
    return db.load(sql);
}

exports.loadFive1 = function() {
    var sql = 'select * from products order by Quantity desc limit 5';
    return db.load(sql);
}

exports.loadFive2 = function() {
    var sql = 'select * from products where TimeFinish > NOW() order by Price desc limit 5';
    return db.load(sql);
}

exports.loadFive3 = function() {
    var sql = 'select * from products where TimeFinish > NOW() order by TimeFinish asc limit 5';
    return db.load(sql);
}

exports.loadById = function(proId, user) {
    var obj = {
        ProID: proId, 
        User: user
    };
    var sql = mustache.render(
        'select * from products left join likes on products.ProId = likes.IDPro and likes.USERS = "{{User}}" where ProID = {{ProID}}',
        obj
    );
    return db.load(sql);
}

exports.loadAllByCat = function(catId) {
    var obj = {
        CatID: catId
    };
    var sql = mustache.render(
        'select * from products where CatID = {{CatID}}',
        obj
    );
    return db.load(sql);
}

exports.loadBySearch = function(key) {
    var obj = {
        Key: key
    };
    var sql = mustache.render(
        "select * from products where ProName like '%{{Key}}%'",
        obj
    );
    return db.load(sql);
}

exports.insert = function(entity) {
    var sql = mustache.render(
        'insert into likes(Users,IDPro,NamePro) values("{{users}}","{{proid}}","{{proname}}")',
        entity
    );

    return db.insert(sql);
}


exports.loadByLike = function(users) {
    var obj = {
        Users: users
    };
    var sql = mustache.render(
       
     
         "SELECT * FROM likes where Users like '%{{Users}}%'",
        obj
    );
    return db.load(sql);
}

exports.loadByTrader = function(users) {
    var obj = {
        Users: users
    };
    var sql = mustache.render(
         "SELECT * FROM products where BestBuyer like '%{{Users}}%' and TimeFinish > NOW()",
        obj
    );
    return db.load(sql);
}

exports.loadByFinsih = function(user) {
    var obj = { 
        Users: user
    };
    var sql = mustache.render(
        "select * from products where BestBuyer like '%{{Users}}%'and TimeFinish < NOW() ",
        obj
    );
    return db.load(sql);
}

exports.loadByUser = function(user) {
    var obj = { 
        Users: user
    };
    var sql = mustache.render(
        "select * from products where Seller like '%{{Users}}%'and TimeFinish > NOW() ",
        obj
    );
    return db.load(sql);
}

exports.loadByUser2 = function(user) {
    var obj = { 
        Users: user
    };
    var sql = mustache.render(
        "select * from products where Seller like '%{{Users}}%'and TimeFinish < NOW() ",
        obj
    );
    return db.load(sql);
}

exports.loadByLike2 = function(id) {
    var obj = {
        Id: id
    };
    var sql = mustache.render(
        "select * from likes where LikeID = '{{Id}}'",
        obj
    );
    return db.load(sql);
}

exports.update = function(entity) {
    var sql = mustache.render(
        'update products set Price = "{{price}}", Quantity = {{quantity}}+1, BestBuyer = "{{bestbuyer}}" where ProID = {{proid}}',
        entity
    );

    return db.update(sql);
}

exports.insertproduct = function(entity) {
    var sql = mustache.render(
        'insert into products(ProName,TinyDes,FullDes,Price,CatID,Quantity,TimeStart,TimeFinish,Image1,Image2,Image3,Seller,BestBuyer) values("{{proName}}","{{tinyDes}}","{{fullDes}}","{{price}}","{{catID}}","0","{{timeStart}}","{{timeFinish}}","{{image1}}","{{image2}}","{{image3}}","{{seller}}","null")',
        entity
    );

    return db.insert(sql);
}
