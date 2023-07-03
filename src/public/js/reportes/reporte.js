
const generar = () => {
    const transportista = document.querySelector('#transportista').value;
    const fechaDesde = document.querySelector('#dateFrom').value;
    const fechaHata = document.querySelector('#dateTo').value;
    reporte(transportista, fechaDesde, fechaHata);
}

const reporte = async (transportistaId, fechaInicio, fechaFinal) => {
    $('#reporte').DataTable().destroy();
    const tabla = document.querySelector('#reporte tbody')
    const res = await fetch(`/reporte`, {
        method: 'POST',
        body: JSON.stringify({
            transportistaId,
            fechaInicio,
            fechaFinal
        }),
        headers: {
            'Accept': 'application/json',
            "Content-Type": "Application/json",
        }
    });

    const data = await res.json();

    const {
        title,
        icon,
        msg,
        ok,
        reporte
    } = data;

    if (!ok) {
        $('#reporte tbody').empty();
        Swal.fire({
            title: title,
            icon: icon,
            text: msg
        })
    } else {
        Swal.fire({
            title: title,
            text: msg,
            icon: icon,
            showConfirmButton: false,
            timer: 1800
        })

        for (let i = 0; i < reporte.length; i++) {
            let fila =
                `
            <tr>
              <td class="">${reporte[i].usuario}</td>
              <td>${reporte[i].sucursal}</td>
              <td>${reporte[i].transportista}</td>
              <td class="">${reporte[i].distanciaTotal}</td>
              <td class="">${reporte[i].tarifa}</td>
              <td class="">${reporte[i].fecha}</td>
            </tr>
          `;
            let tr = document.createElement("tr");
            tr.innerHTML = fila;
            if (i == 0) {
                tabla.innerHTML = fila;
            } else {
                tabla.appendChild(tr);
            }
        }

        $('#reporte')
            .DataTable({
                dom: 'Bfrtip',
                buttons: [{
                    extend: 'excel',
                    text: '<i class="fa-sharp fa-solid fa-file-excel text-green"></i> Exportar Excel',
                    titleAttr: 'Exportar a Excel',
                },
                {
                    extend: 'pdf',
                    text: '<i class="fa-solid fa-file-pdf text-rojo"></i> Exportar PDF',
                    titleAttr: 'Exportar PDF',
                },
                ],
                responsive: true,
                "bInfo": true,
                bDestroy: true,
                stateSave: true,
                pageLength: 10,
            })

    }

} 