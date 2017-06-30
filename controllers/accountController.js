var express = require('express');
var crypto = require('crypto');
var moment = require('moment');
var md5 = require('md5');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
var restrict = require('../middle-wares/restrict');
var account = require('../models/accountRepo');
var productRepo = require('../models/productRepo');

var r = express.Router();

r.get('/login', function(req, res) {
    if (req.session.isLogged === true) {
        res.redirect('/');
    } else {
       res.render('account/login', {
            layoutModels: res.locals.layoutModels,
            layout: false
        });
    }
});

r.post('/login',urlencodedParser, function(req, res) {
    var ePWD = md5(req.body.password);
    var entity = {
        email: req.body.email,
        password: ePWD,
    };
    var tudongdangnhap = req.body.tudongdangnhap ? true : false;
    account.login(entity)
        .then(function(user) {
            if (user === null) {
                var error ="Email hoặc mật khẩu không đúng!";
                res.render('account/login', {
                layoutModels: res.locals.layoutModels,
                error: error,
                layout: false
                });
            } else {
                req.session.isLogged = true;
                req.session.user = user;
                if(user.roll == 1){
                  req.session.roll = true;
                }
                if (tudongdangnhap === true) {
                    var hour = 1000 * 60 * 60 * 24;
                    req.session.cookie.expires = new Date(Date.now() + hour);
                    req.session.cookie.maxAge = hour;
                }
                var url = '/';
                if (req.query.retUrl) {
                    url = req.query.retUrl;
                }
                res.redirect("/");
            }
        });
});
r.get('/logout', restrict, function(req, res) {
    req.session.isLogged = false;
    req.session.user = null;
    req.session.cookie.expires = new Date(Date.now() - 1000);
    res.redirect("/");
});

r.get('/register', function(req, res) {
    var vm = {
        layout: false,
        layutModels: res.locals.layoutModels
    };
    res.render('account/register', vm);
});

r.post('/register',urlencodedParser, function(req, res) {
    var enti = {
        email: req.body.email,
    };
    var ePWD = md5(req.body.password);
    var ngay = req.body.namengay;
    var thang = req.body.namethang;
    var nam = req.body.namenam;
    var date = nam+"-"+thang+"-"+ngay;
    var entity = {
        email: req.body.email,
        hoten: req.body.hoten,
        password:ePWD ,
        date: date,
        roll: 0
    };
    account.checkEmail(enti)
        .then(function(user) {
            if (user === null) {
               account.insert(entity)
               .then(function(insertId){
                var vm = {
                    layout: false,
                    layutModels: res.locals.layoutModels
                    };
                res.redirect("./login");
               });

            } else {
                var error ="Email đã tồn tại!";
                var vm = {
                     layout: false,
                     error: error,
                     layutModels: res.locals.layoutModels
                };
                 res.render('account/register', vm);
            }
        });
});

r.get('/profile/:user', function(req, res) {

    var users = req.params.user;
    if (!users) {
        res.redirect('/');
    }
    productRepo.loadByLike(users)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                accounts: pRows,
                noAccounts: pRows.length === 0
            };
            res.render('account/mylist', vm);
        });
});

r.get('/listuser', function(req, res) {
    account.loadAllUser()
        .then(function(rows) {
            var vm = {
              layoutVM: res.locals.layoutVM,
              list: rows
            };
            res.render('account/listUser', vm);
        }).fail(function(err) {
            console.log(err);
            res.end('fail');
        });
});
r.get('/mytrader/:user', function(req, res) {

    var users = req.params.user;
    if (!users) {
        res.redirect('/');
    }
    productRepo.loadByTrader(users)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                accounts: pRows,
                noAccounts: pRows.length === 0
            };
            res.render('account/mytrader', vm);
        });
});

r.post('/xoauser',function(req,res){
    account.delete(req.body).then(function(affectedRows) {
        res.redirect('/account/listuser');
    });
});
module.exports = r;
