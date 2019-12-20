$(document).ready(function () {

    const config = {
        pagingType: "full_numbers",
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        responsive: true,
        language: {
            search: "_INPUT_",
            searchPlaceholder: "Buscar",
            emptyTable: "No se han encontrado resultados",
            zeroRecords: "No se han encontrado resultados"
        }
    };
    $('#Tabla').DataTable(config);
    $('#Tabla2').DataTable(config);
});

$(document).ready(function () {
    var table = $('#cargador').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [1, 2, 3]
        }]
    });

    $('#btnCargar').click(function () {
        var data = table.$('input, select').serialize();
        alert(
            "The following data would have been submitted to the server: \n\n" +
            data.substr(0, 120) + '...'
        );
        return false;
    });
});




function relocate_home() {
    location.href = ".AltaAlumno.jsp";
} 
