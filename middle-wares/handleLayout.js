var q = require('q'),
    categoryRepo = require('../models/categoryRepo'),
	productRepo = require('../models/productRepo');

const Entities = require('html-entities').XmlEntities;
const entities = new Entities();

module.exports = function(req, res, next) {
    q.all([
    	categoryRepo.loadAll(),
    	productRepo.loadRandom(), 
		productRepo.loadFive1(),
		productRepo.loadFive2(),
		productRepo.loadFive3()
	]).spread(function(cRows, nRows, pRows, qRows, mRows) {
		for(var i = 0; i < pRows.length; i++) {
			pRows[i].FullDes = entities.decode(pRows[i].FullDes);
			pRows[i].Image1 = entities.decode(pRows[i].Image1);
			pRows[i].Image2 = entities.decode(pRows[i].Image2);
			pRows[i].Image3 = entities.decode(pRows[i].Image3);
		}
		for(var i = 0; i < nRows.length; i++) {
			nRows[i].FullDes = entities.decode(nRows[i].FullDes);
			nRows[i].Image1 = entities.decode(nRows[i].Image1);
			nRows[i].Image2 = entities.decode(nRows[i].Image2);
			nRows[i].Image3 = entities.decode(nRows[i].Image3);
		}
		for(var i = 0; i < pRows.length; i++) {
			qRows[i].FullDes = entities.decode(qRows[i].FullDes);
			qRows[i].Image1 = entities.decode(qRows[i].Image1);
			qRows[i].Image2 = entities.decode(qRows[i].Image2);
			qRows[i].Image3 = entities.decode(qRows[i].Image3);
		}
		for(var i = 0; i < pRows.length; i++) {
			mRows[i].FullDes = entities.decode(mRows[i].FullDes);
			mRows[i].Image1 = entities.decode(mRows[i].Image1);
			mRows[i].Image2 = entities.decode(mRows[i].Image2);
			mRows[i].Image3 = entities.decode(mRows[i].Image3);
		}
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