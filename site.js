var express = require("express");
var mysql = require('./dbcon.js');
var app = express();
var bodyParser = require('body-parser');
var handlebars = require('express-handlebars').create({defaultLayout:'main'});
var path = require('path');
app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}))
app.use('/static',express.static('public'));

app.set('view engine', 'handlebars');
app.set('mysql', mysql);
app.set('port', process.argv[2]);
app.use('/', require('./main.js'));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/map', require('./map.js'));
app.use('/findPark', require('./findPark.js'));
app.use('/rules', require('./rules.js'));



app.use(function(req,res)	{
	res.status(404);
	res.render('404');
});

app.use(function(err,req,res,next)	{
	console.error(err.stack);
	res.status(500);
	res.render('500');
});


app.listen(app.get('port'), function(){
  console.log('Express started on port ' + app.get('port') + '; press Ctrl-C to terminate.');
});