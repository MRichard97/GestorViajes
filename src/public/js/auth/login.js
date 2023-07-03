
document.getElementById('login').addEventListener('submit', e => {
	e.preventDefault();

	const correo = document.querySelector('#correo').value;
	const contraseña = document.querySelector('#contraseña').value;

	loginUsuario(correo, contraseña);

});


const loginUsuario = async (correo, contraseña) => {

	const res = await fetch('/loginUsuario', {
		method: 'POST',
		body: JSON.stringify({
			correo,
			contraseña
		}),
		headers: {
			"Content-Type": "application/json",
		}
	});

	const data = await res.json();

	const {
		icon,
		msg,
		ok,
		title,
		url
	} = data

	console.log(data);
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
		})
			.then(() => {
				window.location = url;
			});
	}
}


(function () {
	const forms = document.querySelectorAll('.needs-validation')
	Array.prototype.slice.call(forms)
		.forEach(function (form) {
			form.addEventListener('submit', function (event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}

				form.classList.add('was-validated')
			}, false)
		})
})()