var Q = require('q');
var mustache = require('mustache');

var db = require('../fn/db');

exports.insert = function(entity) {

    var deferred = Q.defer();

    var sql =
        mustache.render(
            'insert into user (email, hoten, password, date, roll) values ("{{email}}", "{{hoten}}", "{{password}}", "{{date}}", "{{roll}}")',
            entity
        );

    db.insert(sql).then(function(insertId) {
        deferred.resolve(insertId);
    });

    return deferred.promise;
}

exports.login = function(entity) {

    var deferred = Q.defer();

    var sql =
        mustache.render(
            'select * from user where email = "{{email}}" and password = "{{password}}"',
            entity
        );

    db.load(sql).then(function(rows) {
        if (rows.length > 0) {
            var user = {
                id: rows[0].id,
                email: rows[0].email,
                hoten: rows[0].hoten,
                date: rows[0].date,
                roll: rows[0].roll,
            }
            deferred.resolve(user);
        } else {
            deferred.resolve(null);
        }
    });
    return deferred.promise;
}

exports.checkEmail = function(entity) {

    var deferred = Q.defer();

    var sql =
        mustache.render(
            'select * from user where email = "{{email}}"',
            entity
        );
    db.load(sql).then(function(rows) {
        if (rows.length > 0) {
            var user = {
                id: rows[0].id,
                email: rows[0].email,
                hoten: rows[0].hoten,
                date: rows[0].date,
                roll: rows[0].roll,
            }
            deferred.resolve(user);
        } else {
            deferred.resolve(null);
        }
    });
    return deferred.promise;
}
exports.loadAllUser = function() {

    var deferred = Q.defer();

    var sql = 'select * from user';
    db.load(sql).then(function(rows) {
      
        deferred.resolve(rows);
    });

    return deferred.promise;
}

exports.delete = function(entity) {
    var sql = mustache.render(
        'delete from user where id = {{id}}',
        entity
    );

    return db.delete(sql);
}