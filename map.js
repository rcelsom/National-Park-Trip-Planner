module.exports = function(){
    var express = require('express');
    var router = express.Router();
	
    function getParks(res, mysql, context, complete){
        mysql.pool.query("SELECT  parks.id as id, parks.name as name, parks.main_state as state,parks.region as region, parks.link as link\
			FROM parks ORDER BY parks.name;", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.parks  = results;
            complete();
        });
    }

	//display page
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = [""];
        var mysql = req.app.get('mysql');
		getParks(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('map', context);
            }
        }
    });
   
    return router;
}();
