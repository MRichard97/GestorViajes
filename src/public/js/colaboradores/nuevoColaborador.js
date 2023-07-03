const nuevoColaboradorModal = () => {
    $("#nuevoColaboradorModal").modal("show");
}

const nuevoColaborador =  async(nombre, identidad, telefono, correo, direccion) => {
    const res = await fetch('/nuevoColaborador', {
        method: 'POST',
        body: JSON.stringify({
            nombre,
            identidad, 
            telefono, 
            correo, 
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

document.getElementById('formNuevoColaborador').addEventListener('submit', e => {
    e.preventDefault();

    const nombre = document.querySelector('#nomColaborador').value;
    const dni = document.querySelector('#dniColaborador').value;
    const telefono = document.querySelector('#telColaborador').value;
    const correo = document.querySelector('#emailColaborador').value;
    const direccion = document.querySelector('#dirColaborador').value;

    nuevoColaborador(nombre, dni, telefono, correo, direccion)
});