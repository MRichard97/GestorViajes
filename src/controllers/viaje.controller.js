import exec from "../db/conexion";


export const nuevoViaje = async (req, res) => {
    try {
        const {
            usuarioId,
        } = req.usuario;

        const {
            distanciaTotal,
            fecha,
            transportistaId,
            colaboradores,
            sucursalId,
            tarifa
        } = req.body

        if (!distanciaTotal || !fecha || !usuarioId || !transportistaId || !colaboradores || !sucursalId || !tarifa) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }


        let viaje;
        for (let i = 0; i < colaboradores.length; i++) {
            const colaborador = colaboradores[i];
            viaje = await exec('SP_NUEVO_VIAJE', {
                distanciaTotal: parseFloat(distanciaTotal),
                fecha,
                usuarioId,
                transportistaId,
                colaboradorId: colaborador.id,
                sucursalId,
                distancia: parseFloat(colaborador.distancia),
                tarifa: parseFloat(tarifa)
            })

        }
        console.log(viaje);
        if (viaje[0].resp === 0) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: viaje[0].msg
            });
        }
        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: viaje[0].msg
        });

    } catch (error) {
        console.log(error);
    }
}

export const reporte = async(req, res) => {
    try {
        const{
            transportistaId,
            fechaInicio,
            fechaFinal
        } = req.body

        if (!transportistaId || !fechaInicio || !fechaFinal) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        const reporte = await exec('SP_REPORTE', {
            transportistaId,
            fechaInicio,
            fechaFinal
        })

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: 'Reporte obtenido con exito',
            reporte
        });
    } catch (error) {
        
    }
} 