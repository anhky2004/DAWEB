var express = require('express'),
    productRepo = require('../models/productRepo');

const Entities = require('html-entities').XmlEntities;
const entities = new Entities();

var r = express.Router();

r.get('/add', function(req, res) {
    var vm = {
        layout: false,
    };
    res.render('product/add', vm);
});

r.post('/add', function(req, res) {

    productRepo.insertproduct(req.body).then(function(data) {
        var vm = {
            layout: false,
        };
        res.render('product/add', vm);
    }).catch(function(err) {
        console.log(err);
        res.end('insert fail');
    });
});

r.get('/result/:users', function(req, res) {
     var user = req.params.users;
    if (!user) {
        res.redirect('/');
    }
    productRepo.loadByFinsih(user)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('product/result', vm);
    });
});

r.get('/productDetail/:id', function(req, res) {
    var proId = req.params.id;
    var user = "";
    if (typeof res.locals.layoutModels.curUser != 'undefined')
        user = res.locals.layoutModels.curUser.hoten;
    if (!proId) {
        res.redirect('/');
    }
    productRepo.loadById(proId, user)
        .then(function(pRows) {
            pRows.splice(1, pRows.length - 1);
            for(var i = 0; i < pRows.length; i++) {
                pRows[i].FullDes = pRows[i].FullDes.trim();
                pRows[i].FullDes = entities.decode(pRows[i].FullDes);
                pRows[i].Image1 = entities.decode(pRows[i].Image1);
                pRows[i].Image2 = entities.decode(pRows[i].Image2);
                pRows[i].Image3 = entities.decode(pRows[i].Image3);
            }
            console.log(pRows[0]);
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('product/productDetail', vm);
        });
});

r.get('/trade/:users', function(req, res) {

    var user = req.params.users;
    if (!user) {
        res.redirect('/');
    }
    productRepo.loadByUser(user)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('product/trade', vm);
        });

});

r.get('/finishtrade/:users', function(req, res) {

    var user = req.params.users;
    if (!user) {
        res.redirect('/');
    }
    productRepo.loadByUser2(user)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('product/finishtrade', vm);
        });

});

r.get('/add', function(req, res) {
    var vm = {
        layout: false,
    };
    res.render('category/add', vm);
});

r.post('/like', function(req, res) {
    console.log(req.body);
    var proid = req.body.proid;
    productRepo.insert(req.body).then(function(data) {
        var vm = {
            layout: false,
        };
      res.redirect('/product/productDetail/' + proid);
    }).catch(function(err) {
        console.log(err);
        res.end('insert fail');
    });
});

r.post('/update', function(req, res) {
    var proid = req.body.proid;
    productRepo.update(req.body).then(function(affectedRows) {
        res.redirect('/product/productDetail/' + proid);
    });
});

module.exports = r;