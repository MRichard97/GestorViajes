import jwt from 'jsonwebtoken';
import config from '../config/config';
import exec from '../db/conexion';

export const checkRoleAuth = (roles) => async (req, res, next) => {

    try {
        const {
            _token
        } = req.cookies;

        jwt.verify(_token, config.SECRET, async (err, data) => {
            if (err) {
                res.redirect('/login');
                if (!_token) return res.redirect('/login');
            } else if (data.usuarioId) {
                
                const [usuario] = await exec('SP_GET_USUARIO', {
                    usuarioId: data.usuarioId
                })

                const {
                    rol
                } = usuario

                if ([].concat(roles).includes(rol)) {
                    req.usuario = data;
                    return next();
                } else {
                    res.redirect('/login');


                }
            }
        });
    } catch (error) {
        return req.clearCookie('_token').redirect('/login');
    }
}
