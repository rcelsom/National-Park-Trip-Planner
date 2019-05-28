module.exports = function()	{
	var express = require('express');
	var router = express.Router();

	
	//display all characters
	router.get('/', function(req, res)	{
		var callbackCount = 0;
		var context = {};
		context.jsscripts = ["carousel.js"];
		var mysql = req.app.get('mysql');


		res.render('main', context);

	});
	
	return router;
}();