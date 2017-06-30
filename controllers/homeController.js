var express = require('express');
productRepo = require('../models/productRepo');

const Entities = require('html-entities').XmlEntities;
const entities = new Entities();

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
            for(var i = 0; i < pRows.length; i++) {
                pRows[i].FullDes = entities.decode(pRows[i].FullDes);
                pRows[i].Image1 = entities.decode(pRows[i].Image1);
                pRows[i].Image2 = entities.decode(pRows[i].Image2);
                pRows[i].Image3 = entities.decode(pRows[i].Image3);
            }
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
            for(var i = 0; i < pRows.length; i++) {
                pRows[i].FullDes = entities.decode(pRows[i].FullDes);
                pRows[i].Image1 = entities.decode(pRows[i].Image1);
                pRows[i].Image2 = entities.decode(pRows[i].Image2);
                pRows[i].Image3 = entities.decode(pRows[i].Image3);
            }
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('home/search', vm);
        });
});

module.exports = r;