import exec from "../db/conexion";


export const nuevoTransportista = async (req, res) => {
    try {
        const {
            nombre,
            identidad,
            telefono,
            correo,
            tarifa
        } = req.body;

        if (!nombre || !identidad || !telefono || !correo || !tarifa) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        await exec('SP_NUEVO_TRANSPORTISTA', {
            nombre,
            identidad,
            telefono,
            correo,
            tarifa
        });

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `El transportista ${nombre} fue agregado con éxito`
        });

    } catch (error) {
        console.log(error);
    }
}

export const getTransportista = async(req,res)  => {
    try {

        const {
            transportistaId
        } = req.params

        if (!transportistaId) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        const transportista = await exec('SP_GET_TRANSPORTISTA', {
            transportistaId
        });

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `Informacion del transportista obtenida con exito`,
            transportista
        });
        
    } catch (error) {
        
    }
}