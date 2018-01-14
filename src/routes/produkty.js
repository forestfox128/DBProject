exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Produkty', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('produkty', { page_title: "Produkty - Panel Administracyjny", data: rows });


        });
    });

};

exports.add = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT MAX (ID_Produkt) AS "ID" FROM Produkty', function (err, rows) {
            if (err)
                console.log("Error Selecting : %s ", err);
            res.render('add_produkty', {page_title: "Dadaj Produkt", data: rows});
        });
    });
};

exports.edit = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Produkty WHERE ID_Produkt = ?', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('edit_produkty', { page_title: "Edytuj Produkty", data: rows });


        });

        //console.log(query.sql);
    });
};

exports.save = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));

    req.getConnection(function (err, connection) {

        var data = {

            ID_Produkt: input.ID_Produkt,
            ID_Producent: input.ID_Producent,
            nazwa: input.nazwa,
            cena: input.cena,
            opis: input.opis,
            typ: input.typ,
            ilosc: input.ilosc

        };

        var query = connection.query("INSERT INTO Produkty set ? ", data, function (err, rows) {

            if (err)
                console.log("Error inserting : %s ", err);
            else
            res.redirect('/produkty');

        });


    });
};

exports.save_produkt = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = {

            ID_Produkt: input.ID_Produkt,
            ID_Producent: input.ID_Producent,
            nazwa: input.nazwa,
            cena: input.cena,
            opis: input.opis,
            typ: input.typ,
            ilosc: input.ilosc

        };

        connection.query("UPDATE Produkty set ? WHERE ID_Produkt = ? ", [data, id], function (err, rows) {
            if (err)
                console.log("Error Updating : %s ", err);
            else
            res.redirect('/produkty');

        });

    });
};

exports.delete_produkt = function(req, res){

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        connection.query("DELETE FROM Produkty  WHERE ID_Produkt = ? ",[id], function(err, rows)
        {

            if(err)
                console.log("Error deleting : %s ",err );

            res.redirect('/produkty');

        });

    });
};