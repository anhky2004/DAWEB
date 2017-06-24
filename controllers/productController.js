var express = require('express'),
    productRepo = require('../models/productRepo');

var r = express.Router();

r.get('/add', function(req, res) {
    var vm = {
        layout: false,
    };
    res.render('product/add', vm);
});

r.get('/result', function(req, res) {
    var vm = {
    };
    res.render('product/result', vm);
});

r.get('/productDetail/:id', function(req, res) {

    var proId = req.params.id;
    if (!proId) {
        res.redirect('/');
    }
    productRepo.loadById(proId)
        .then(function(pRows) {
            var vm = {
                layoutVM: res.locals.layoutVM,
                products: pRows,
                noProducts: pRows.length === 0
            };
            res.render('product/productDetail', vm);
        });

});



module.exports = r;