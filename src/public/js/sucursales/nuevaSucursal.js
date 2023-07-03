const nuevaSucursalModal = () => {
    $("#nuevaSucursalModal").modal("show");
}

document.getElementById('formNuevaSucursal').addEventListener('submit', e => {
    e.preventDefault();

    const nombre = document.querySelector('#nomSucursal').value;
    const direccion = document.querySelector('#dirSucursal').value;

    nuevaSucursal(nombre, direccion);
});

const nuevaSucursal = async (nombre, direccion) => {
    const res = await fetch('/nuevaSucursal', {
        method: 'POST',
        body: JSON.stringify({
            nombre,
            direccion
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



