const nuevoTransportistaModal = () => {
    $("#nuevoTransportistaModal").modal("show");
}

document.getElementById('formNuevoTransportista').addEventListener('submit', e => {
    e.preventDefault();

    const nombre = document.querySelector('#nomTransportista').value;
    const identidad = document.querySelector('#dniTransportista').value;
    const telefono = document.querySelector('#telTransportista').value;
    const correo = document.querySelector('#emailTransportista').value;
    const tarifa = document.querySelector('#tarifa').value;

    nuevaTransportista(nombre, identidad, telefono, correo, tarifa);
});

const nuevaTransportista = async (nombre, identidad, telefono, correo, tarifa) => {
    const res = await fetch('/nuevoTransportista', {
        method: 'POST',
        body: JSON.stringify({
            nombre,
            identidad,
            telefono,
            correo,
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