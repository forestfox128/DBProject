exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Adresy', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('adresy', { page_title: "Adresy - Przegląd", data: rows });


        });
    });

};