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

exports.buy = function (req, res) {
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Produkty WHERE ID_Produkt = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('buy_produkty', { page_title: "Kup Produkt", data: rows });
        });
    });
};

exports.buy_produkt = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = input.ilosc;

        connection.query("UPDATE Produkty set ilosc = ilosc - ? WHERE ID_Produkt = ? ", [data, id], function (err, rows) {

            if (err)
                console.log("Error Updating : %s ", err);
            else
                res.redirect('/');
        });

    });
};
