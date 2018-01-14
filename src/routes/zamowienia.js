exports.list = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM Zamowienia', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.render('zamowienia', { page_title: "Adresy - Zamówienia", data: rows });


        });
    });
};

exports.delete = function(req, res){

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        connection.query("DELETE FROM Zamowienia WHERE ID_Zamowienia = ? ",[id], function(err, rows)
        {

            if(err)
                console.log("Error deleting : %s ",err );
            res.redirect('/zamowienia');

        });

    });
};