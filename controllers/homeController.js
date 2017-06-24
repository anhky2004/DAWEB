var express = require('express');
productRepo = require('../models/productRepo');

var r = express.Router();

r.get('/', function(req, res) {
    var vm = {
    	layoutVM: res.locals.layoutVM
    };
    res.render('home/index', vm);
});

r.get('/about', function(req, res) {
    var vm = {
    	layoutVM: res.locals.layoutVM
    };
    res.render('home/about', vm);
});

r.get('/search', function(req, res) {
    var vm = {
    	layoutVM: res.locals.layoutVM
    };
    res.render('home/search', vm);
});

r.get('/search/danhmuc/:id', function(req, res) {
     var catId = req.params.id;
    if (!catId) {
        res.redirect('/');
    }

    productRepo.loadAllByCat(catId)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('home/search', vm);
        });
});

r.get('/search/tukhoa', function(req, res) {
     var key = req.query.key;
    if (!key) {
        res.redirect('/');
    }

    productRepo.loadBySearch(key)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('home/search', vm);
        });
});

r.get('/category', function(req, res) {
    res.end('ooops');
});

module.exports = r;