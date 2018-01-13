exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Adresy', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('adresy', { page_title: "Adresy - Przegląd", data: rows });


        });
    });
};

exports.edit = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Adresy WHERE ID_Klient = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('edit_adresy', { page_title: "Edytuj Adresy", data: rows });
        });
    });
};

exports.save = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = {

            ID_Klient: input.ID_Klient,
            ulica: input.ulica,
            nr_domu: input.nr_domu,
            miejscowosc: input.miejscowosc,
            kod_pocztowy: input.kod_pocztowy

        };

        connection.query("UPDATE Adresy set ? WHERE ID_Klient = ? ", [data, id], function (err, rows) {
            if (err)
                console.log("Error Updating : %s ", err);
            else
                res.redirect('/adresy');

        });

    });
};