/*
 * GET home page.
 */

exports.index = function (req, res) {

    req.getConnection(function (err, connection) {

        var nazwa = req.query.user;

        var filter = "";
        if (nazwa) {
            filter = 'WHERE nazwa = ?';
        }

        var query = connection.query('SELECT * FROM Produkty ' + filter, nazwa, function (err, rows) {
            if (err) {
                console.log("Error Selecting : %s ", err);
            }

            res.render('index', {page_title: 'AlkoSZOP - Strona Główna', data: rows, user: nazwa});
        });
    });
};
