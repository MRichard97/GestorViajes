import exec from "../db/conexion";


export const nuevaAsignacion = async (req, res) => {
    try {
        const {
           colaboradorId,
           sucursalId,
           distancia
        } = req.body;

        if (!colaboradorId || !sucursalId || !distancia) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        const asignacion = await exec('SP_NUEVA_ASIGNACION', {
            colaboradorId,
            sucursalId,
            distancia
        });

        console.log(asignacion);

        if (asignacion[0].resp === 0) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: asignacion[0].msg
            });
        }

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `La asignacion se ha hecho con éxito`
        });

    } catch (error) {
        console.log(error);
    }
}