exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Typ', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('typy', { page_title: "Typy - Panel Administracyjny", data: rows });


        });
    });

};

exports.add = function (req, res) {
    res.render('add_typy', { page_title: "Dadaj Typ" });
};

exports.edit = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Typ WHERE ID_Typ = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('edit_typy', { page_title: "Edytuj Typ", data: rows });


        });
    });
};

exports.save = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));

    req.getConnection(function (err, connection) {

        var data = {
            ID_Typ: input.ID_Typ,
            nazwa: input.nazwa
        };

        var query = connection.query("INSERT INTO Typ set ? ", data, function (err, rows) {

            if (err)
                console.log("Error inserting : %s ", err);
            else
                res.redirect('/typy');
        });
    });
};

exports.save_typy = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));

    req.getConnection(function (err, connection) {

        var id = input.ID_Typ;

        var data = {
            nazwa: input.nazwa
        };

        connection.query("UPDATE Typ set ? WHERE ID_Typ = ?", [data, id], function (err, rows) {

            if (err)
                console.log("Error Updating : %s ", err);
            else
                res.redirect('/typy');

        });

    });
};


exports.delete_typy = function(req, res){

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        connection.query("DELETE FROM Typ WHERE ID_Typ = ? ",[id], function(err, rows)
        {

            if(err)
                console.log("Error deleting : %s ",err );

            res.redirect('/typy');

        });

    });
};