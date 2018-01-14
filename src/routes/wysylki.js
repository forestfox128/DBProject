exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Wysylka', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('wysylki', {page_title: "Wysyłki - Przegląd", data: rows});


        });
    });
};

exports.edit = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Wysylka WHERE ID_Wysylka = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('edit_wysylki', {page_title: "Edytuj Wysyłki", data: rows});
        });
    });
};

exports.save = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = {

            ID_Wysylka: input.ID_Wysylka,
            koszt: input.koszt,
            opis: input.opis

        };

        connection.query("UPDATE Wysylka set ? WHERE ID_Wysylka = ? ", [data, id], function (err, rows) {
            if (err)
                console.log("Error Updating : %s ", err);
            else
                res.redirect('/wysylki');

        });

    });
};