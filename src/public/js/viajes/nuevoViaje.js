const nuevoViajeModal = () => {
    $("#nuevoViajeModal").modal("show");

    $('#colaborador').selectize();
    $('#sucursal').selectize();
    $('#transportista').selectize();
}



const nuevoViaje = async (distanciaTotal, fecha, transportistaId, colaboradores, sucursalId, tarifa) => {
    const res = await fetch('/nuevoViaje', {
        method: 'POST',
        body: JSON.stringify({
            distanciaTotal,
            fecha,
            transportistaId,
            colaboradores,
            sucursalId,
            tarifa
        }),
        headers: {
            "Content-Type": "application/json",
        }
    });
    const data = await res.json();

    const {
        ok,
        title,
        icon,
        msg
    } = data

    if (!ok) {
        Swal.fire({
            icon: icon,
            title: title,
            text: msg
        });
    } else {
        Swal.fire({
            icon: icon,
            title: title,
            text: msg
        }).then(() => {
            location.reload();
            Swal.close();
        });
    }
}

document.getElementById('formNuevoViaje').addEventListener('submit', e => {
    e.preventDefault();
    const distancia = document.querySelector('#distancia').value;
    const sucursal = document.querySelector('#sucursal').value;
    const fecha = document.querySelector('#fecha').value;
    const transportista = document.querySelector('#transportista').value;
    const tarifa = document.querySelector('#tarifa').value;

    const tab = document.querySelector('#viajeTable');
    let viaje = [];
    for (let i = 0; i < tab.rows.length; i++) {
        if (tab.rows[i].innerHTML.indexOf("<th") < 0) {
            let col = tab.rows[i].cells;
            let jsonObj = {
                id: col[0].innerHTML,
                distancia: col[2].innerHTML,
            }
            viaje.push(jsonObj);
        }
    }

    let distanciaTotal = 0;
    for (let i = 0; i < viaje.length; i++) {
        distanciaTotal += parseFloat(viaje[i].distancia);
    }

    const hoy = new Date();
    const hora = hoy.toLocaleTimeString('es-HN');
    const FechaHora = fecha+' '+hora;
 
    nuevoViaje(distanciaTotal, FechaHora, transportista, viaje, sucursal, tarifa)

});


const agregarColaborador = () => {
    const colaboradorId = document.querySelector('#colaborador').value;
    const colaborador = document.querySelector('#colaborador').textContent;
    const distancia = document.querySelector('#distancia').value;
    const tablaViajes = document.querySelector('#viajeTable tbody');

    if (colaborador === "" || distancia === "") {
        return Swal.fire({
            title: "Campos vacios",
            showDenyButton: false,
            showCancelButton: false,
            icon: 'warning',
            confirmButtonText: "Aceptar",
        });
    }
    const tr = document.createElement('tr');
    let fila = `
        <td scope="row"class="text-center" style="display: none">${colaboradorId}</td>
        <td scope="row"class="text-center">${colaborador}</td>
        <td scope="row"class="text-center">${distancia}</td>
        <td scope="row"class="text-center"><button type="button" class="borrar btn btn-sm btn-outline-dark text-danger" title="Eliminar">
        <i class="fas fa-minus-circle text-red"></i></button></td>
    `;

    tr.innerHTML = fila;
    tablaViajes.appendChild(tr);

}

const sucursalCambio = document.querySelector('#sucursal');
sucursalCambio.onchange = async () => {
    const res = await fetch(`/getColaboradores/${sucursalCambio.value}`, {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            "Content-Type": "Application/json",
        }
    });

    const data = await res.json();

    const {
        colaboradores
    } = data

    const select = $('#colaborador').selectize();
    const control = select[0].selectize;
    control.clearOptions();

    colaboradores.forEach(colaborador => {
        control.addOption({
            value: colaborador.colaboradorId,
            text: colaborador.nombre
        });
    });

}

const colaboradorCambio = document.querySelector('#colaborador');
colaboradorCambio.onchange = async () => {
    const distancia = document.querySelector('#distancia');
    const res = await fetch(`/getColaborador/${colaboradorCambio.value}/${sucursalCambio.value}`, {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            "Content-Type": "Application/json",
        }
    });

    const data = await res.json();
    const {
        colaborador
    } = data

    distancia.value = colaborador[0].distancia;
}

const transportistaCambio = document.querySelector('#transportista');
transportistaCambio.onchange = async () => {
    const tarifa = document.querySelector('#tarifa');
    const res = await fetch(`/getTransportista/${transportistaCambio.value}`, {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            "Content-Type": "Application/json",
        }
    });

    const data = await res.json();

    const {
        transportista
    } = data;

    tarifa.value = transportista[0].tarifa;
}



$(document).on('click', '.borrar', function (event) {
    event.preventDefault();
    $(this).closest('tr').remove();
});