module.exports = function(){
    var express = require('express');
    var router = express.Router();
	
    function getCharacter(res, mysql, context, complete){
        mysql.pool.query("SELECT characters.id, characters.name as name, homeregion, difficulty, region.name as region_name FROM characters\
						LEFT JOIN region ON characters.homeregion = region.id;", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.character  = results;
            complete();
        });
    }
	
	//for region drop down
    function getRegion(res, mysql, context, complete){
        mysql.pool.query("SELECT id, name FROM region", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.homeregion = results;
            complete();
        });
    }
	
	function getCharacterByName(req, res, mysql, context, complete){
        var command = "SELECT characters.id, characters.name as name, homeregion, difficulty, \
						region.name as region_name FROM characters\
						LEFT JOIN region ON characters.homeregion = region.id \
						WHERE characters.name LIKE " + mysql.pool.escape(req.params.string + '%');
		console.log(command)
		mysql.pool.query(command, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.character  = results;
            complete();
        });
    }


	//display all characters
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["searchCharacters.js"];
        var mysql = req.app.get('mysql');
        getCharacter(res, mysql, context, complete);
        getRegion(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('characters', context);
            }
        }
    });

	router.get('/searchCharacters/:string', function(req, res)	{
		var callbackCount = 0;
        var context = {};
        context.jsscripts = ["searchCharacters.js"];
        var mysql = req.app.get('mysql');
        getCharacterByName(req, res, mysql, context, complete);
        getRegion(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('characters', context);
            }
        }
    });
   

    //insert a new character
    router.post('/', function(req, res){
        console.log(req.body.homeregion)
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
