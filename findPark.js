module.exports = function(){
    var express = require('express');
    var router = express.Router();
	
	function getParks(res, mysql, context, complete){
        mysql.pool.query("SELECT parks.name as name, parks.main_state as state, parks.region as region, parks.link as link \
						FROM parks ORDER BY parks.name;"
						, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.parks  = results;
            complete();
        });
    }
	
	function getRegions(res, mysql, context, complete)	{
        mysql.pool.query("SELECT DISTINCT parks.region AS region_name FROM parks;"
						, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.regions  = results;
            complete();
        });
    }
	
	function getStates(res, mysql, context, complete)	{
        mysql.pool.query("SELECT DISTINCT parks.main_state AS state_name FROM parks ORDER BY parks.main_state;"
						, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.states = results;
            complete();
        });
    }

	
	function getActivities(res, mysql, context, complete){
        mysql.pool.query("SELECT activities.id as id, activities.name as name FROM activities ORDER BY activities.name;"
						, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.activities  = results;
            complete();
        });
    }
	
	function getFeatures(res, mysql, context, complete){
        mysql.pool.query("SELECT features.id as id, features.name as name FROM features ORDER BY features.name;"
						, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.features  = results;
            complete();
        });
    }
	
	function getParkByForm(req, res, mysql, context, complete)	{
		console.log("\n\nPOST REQUEST BODY \n");
		console.log(req.body);
		var sql = "SELECT DISTINCT parks.name as name, parks.main_state as state, parks.link as link\
					FROM parks JOIN park_activities ON parks.id = park_activities.pid \
					JOIN activities ON park_activities.aid = activities.id \
					JOIN park_features ON parks.id = park_features.pid \
					JOIN features ON park_features.fid = features.id \
					WHERE (parks.region = ? OR parks.main_state= ? OR ? = 'null')\
					AND (activities.id = CAST(? AS UNSIGNED) or ? = 'null')\
					AND (features.id= CAST(? AS UNSIGNED) or ? = 'null')\
					ORDER BY parks.name";

		var inserts = [req.body.region, req.body.region,req.body.region, req.body.activity, req.body.activity, req.body.feature, req.body.feature];
		sql = mysql.pool.query(sql,inserts,function(error, results, fields){
			if(error){
				console.log(JSON.stringify(error))
				res.write(JSON.stringify(error));
				res.end();
			}
			console.log("\n\nPOST Results After SQL Query \n");
			console.log(results );
			console.log('\n');
			context.parks  = results;
			complete();
		});
		

	}

    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["searchParks.js"];
        var mysql = req.app.get('mysql');
        getParks(res, mysql, context, complete);
		getStates(res, mysql, context, complete);
		getRegions(res, mysql, context, complete);
		getActivities(res, mysql, context, complete);
		getFeatures(res, mysql, context, complete);
		function complete(){
            callbackCount++;
            if(callbackCount >= 5){
                res.render('findPark', context);
            }
        }
    });
   

    //gets park by search parameters
    router.post('/', function(req, res){
		var callbackCount = 0;
        var context = {};
        context.jsscripts = ["searchParks.js"];
        var mysql = req.app.get('mysql');

		getParkByForm(req, res, mysql, context, complete);
		getRegions(res, mysql, context, complete);
		getStates(res, mysql, context, complete);
		getActivities(res, mysql, context, complete);
		getFeatures(res, mysql, context, complete);
		function complete(){
            callbackCount++;
            if(callbackCount >= 5){
                res.render('findPark', context);
            }
        }
    });

	
    return router;
}();
