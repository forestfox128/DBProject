/*
 * GET home page.
 */

exports.index = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Produkty', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('index', { page_title: "AlkoSZOP", data: rows });


        });

        //console.log(query.sql);
    });
};
