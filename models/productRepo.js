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
    var sql = 'select * from products order by Price desc limit 5';
    return db.load(sql);
}

exports.loadFive3 = function() {
    var sql = 'select * from products order by ProID desc limit 5';
    return db.load(sql);
}


exports.loadById = function(proId) {
    var obj = {
        ProID: proId
    };
    var sql = mustache.render(
        'select * from products where ProID = {{ProID}}',
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




