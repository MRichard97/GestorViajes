const nuevaAsignacionModal = () => {
    $("#nuevaAsignacionModal").modal("show");
    $('#colaboradorId').selectize();
    $('#sucursalId').selectize();
}

document.getElementById('formNuevaAsignacion').addEventListener('submit', e => {
    e.preventDefault();

    const colaboradorId = document.querySelector('#colaboradorId').value;
    const sucursalId = document.querySelector('#sucursalId').value;
    const distancia = document.querySelector('#distancia').value;

    nuevaAsignacion(colaboradorId, sucursalId, distancia)

});

const nuevaAsignacion = async (colaboradorId, sucursalId, distancia) => {
    const res = await fetch('/nuevaAsignacion', {
        method: 'POST',
        body: JSON.stringify({
            colaboradorId,
            sucursalId,
            distancia
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



const campoDistancia = document.querySelector('#distancia')
campoDistancia.oninput = () => {
    let valor = campoDistancia.value;
    let nuevoValor = valor.replace(/[^0-9.]/g, '');

    campoDistancia.value = nuevoValor;
}