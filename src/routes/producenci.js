exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Producent', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('producenci', { page_title: "Producenci - Panel Administracyjny", data: rows });


        });
    });

};

exports.add = function (req, res) {
    res.render('add_producenci', { page_title: "Dadaj Producenta" });
};

exports.edit = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Producent WHERE ID_Producent = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('edit_producenci', { page_title: "Edytuj Producenta", data: rows });


        });
    });
};

exports.save = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));

    req.getConnection(function (err, connection) {

        var data = {
            ID_Producent: input.ID_Producent,
            nazwa: input.nazwa
        };

        var query = connection.query("INSERT INTO Producent set ? ", data, function (err, rows) {

            if (err)
                console.log("Error inserting : %s ", err);
            else
                res.redirect('/producenci');
        });
    });
};

exports.save_producent = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));

    req.getConnection(function (err, connection) {

        var id = input.ID_Producent;

        var data = {
            nazwa: input.nazwa
        };

        connection.query("UPDATE Producent set ? WHERE ID_Producent = ?", [data, id], function (err, rows) {

            if (err)
                console.log("Error Updating : %s ", err);
            else
                res.redirect('/producenci');

        });

    });
};


exports.delete_producent = function(req, res){

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        connection.query("DELETE FROM Producent  WHERE ID_Producent = ? ",[id], function(err, rows)
        {

            if(err)
                console.log("Error deleting : %s ",err );

            res.redirect('/producenci');

        });

    });
};