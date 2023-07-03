import exec from "../db/conexion";


export const nuevaSucursal = async (req, res) => {
    try {
        const {
            nombre,
            direccion
        } = req.body;

        if (!nombre || !direccion) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            });
        }

        await exec('SP_NUEVA_SUCURSAL',{
            nombre,
            direccion
        });

        return res.status(200).json({
            ok: true,
            title: '¡Éxito!',
            icon: 'success',
            msg: `La sucursal ${nombre} fue agregada con éxito`
        });

    } catch (error) {
        console.log(error);
    }
}