var mustache = require('mustache'),
    Q = require('q'),
    db = require('../fn/db');

exports.loadAll = function() {

    var deferred = Q.defer();

    var sql = 'select * from categories';
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}

exports.loadDetail = function(id) {
	var d = Q.defer();

    var obj = {
        CatID: id
    };

    var sql = mustache.render(
        'select * from categories where CatID = {{CatID}}',
        obj
    );

    db.load(sql).then(function(rows) {
        d.resolve(rows[0]);
    });

    return d.promise;
}

exports.insert = function(entity) {
    var sql = mustache.render(
        'insert into categories(CatName) values("{{catName}}")',
        entity
    );

    return db.insert(sql);
}

exports.update = function(entity) {
    var sql = mustache.render(
        'update categories set CatName = "{{catName}}" where CatID = {{catId}}',
        entity
    );

    return db.update(sql);
}

exports.delete = function(entity) {
    var sql = mustache.render(
        'delete from categories where CatID = {{catId}}',
        entity
    );

    return db.delete(sql);
}