import exec from "../db/conexion";


export const nuevoColaborador = async (req, res) => {
    try {
        const {
            nombre,
            identidad,
            telefono,
            correo,
            direccion
        } = req.body;

        if (!nombre || !identidad || !telefono || !correo || !direccion) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        await exec('SP_NUEVO_COLABORADOR', {
            nombre,
            identidad,
            telefono,
            correo,
            direccion
        });

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `El colaborador ${nombre} fue agregado con éxito`
        });

    } catch (error) {
        console.log(error);
    }
}


export const getColaboradores = async (req, res) => {
    try {
        const {
            sucursalId
        } = req.params

        if (!sucursalId) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        const colaboradores = await exec('SP_GET_COLABORADORES_POR_SUCURSAL', {
            sucursalId
        });


        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `Informacion de los colaboradores obtenida con exito`,
            colaboradores
        });
    } catch (error) {
        
    }
}

export const getColaborador = async (req, res) => {
    try {
        const {
            colaboradorId,
            sucursalId
        } = req.params

        if (!colaboradorId || !sucursalId) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        const colaborador = await exec('SP_GET_COLABORADOR_POR_SUCURSAL', {
            colaboradorId,
            sucursalId
        });

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `Informacion del colaborador obtenida con exito`,
            colaborador
        });
    } catch (error) {
        console.log(error);
    }
}