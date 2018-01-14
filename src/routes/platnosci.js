exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Platnosc', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('platnosci', {page_title: "Płatności - Przegląd", data: rows});


        });
    });
};

exports.edit = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Platnosc WHERE ID_Platnosc = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('edit_platnosci', {page_title: "Edytuj Płatności", data: rows});
        });
    });
};

exports.save = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = {

            ID_Platnosc: input.ID_Platnosc,
            opis: input.opis

        };

        connection.query("UPDATE Platnosc set ? WHERE ID_Platnosc = ? ", [data, id], function (err, rows) {
            if (err)
                console.log("Error Updating : %s ", err);
            else
                res.redirect('/platnosci');

        });

    });
};