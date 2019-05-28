module.exports = function(){
    var express = require('express');
    var router = express.Router();
	


	//display all characters
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = [""];
        var mysql = req.app.get('mysql');
        //function complete(){
            //callbackCount++;
           // if(callbackCount >= 2){
                res.render('rules', context);
           // }
       // }
    });
   

    //insert a new character
    router.post('/', function(req, res){
        console.log(req.body.region)
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO characters (name, homeregion, difficulty) VALUES (?,?,?)";
        var inserts = [req.body.name, req.body.region, req.body.difficulty];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/characters');
            }
        });
    });

    return router;
}();
