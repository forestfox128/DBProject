exports.list = function (req, res) {

    req.getConnection(function (err, connection) {
        var surname = req.query.user;

        var filter = "";
        if (surname) {
            filter = 'WHERE nazwisko = ?';
        }

        var query = connection.query('SELECT * FROM Klient ' + filter, surname, function (err, rows) {
            if (err) {
                console.log("Error Selecting : %s ", err);
            }

            res.render('klienci', {page_title: 'Klienci - Przegląd', data: rows, user: surname});
        });
    });
};