import exec from "../db/conexion";
import jwt from "jsonwebtoken";
import config from "../config/config";


export const loginUsuario = async (req, res) => {
    try {
        const {
            correo,
            contraseña
        } = req.body

        if (!correo || !contraseña) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: 'Campos Vacios'
            })
        }

        const [usuario] = await exec('SP_LOGIN_USUARIO', {
            correo,
            contraseña
        });

        const {
            msg,
            resp,
            usuarioId,
            nombre,
            rol,
        } = usuario;

        
        if (resp === 0) {
            return res.status(200).json({
                ok: false,
                title: '¡Error!',
                icon: 'error',
                msg: msg
            })
        }
        

        const token = jwt.sign({
            usuarioId,
            nombre,
            rol
        },
        config.SECRET, {
            expiresIn: "8h",
        });

        res.cookie('_token', token, {
            maxAge: 8 * 60 * 60 * 1000,
            httpOnly: true
        });

        if (rol === 'Gerente de Tiendas') {
            return res.status(200).json({
                ok: true,
                title: '¡Inicio de sesión exitoso!',
                icon: 'success',
                msg: msg,
                url: '/asignaciones'
            })
        }
        return res.status(200).json({
            ok: true,
            title: '¡Inicio de sesión exitoso!',
            icon: 'success',
            msg: msg,
            url: '/sucursales'
        })

    } catch (error) {

    }
}