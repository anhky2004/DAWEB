var q = require('q'),
    categoryRepo = require('../models/categoryRepo'),
	productRepo = require('../models/productRepo');

module.exports = function(req, res, next) {
    q.all([
    	categoryRepo.loadAll(),
    	productRepo.loadRandom(), 
		productRepo.loadFive1(),
		productRepo.loadFive2(),
		productRepo.loadFive3()
	]).spread(function(cRows, nRows, pRows, qRows, mRows) {
		res.locals.layoutVM = {
			categories: cRows,
			products4: nRows,
			products: pRows,
			products2: qRows,
			products3: mRows
			// suppliers: []
		};
    	next();
    });
}