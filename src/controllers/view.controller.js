import exec from "../db/conexion";


export const loginUser = async(req, res) => {
    return res.render("auth/login", {
        page: "Login"
    });
}

export const redirectLoginUser = async(req, res) => {
    res.redirect('/login');
}

export const usuarios = async(req, res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }

        return res.render("usuarios/usuarios",{
            nombre,
            rol,
            adminRol,
            title: 'Usuarios',
            page: 'Usuarios'
        });
    } catch (error) {
        
    }
}

export const colaboradores = async(req, res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }

        const colaboradores = await exec('SP_GET_COLABORADORES')

        return res.render("colaboradores/colaboradores",{
            nombre,
            rol,
            adminRol,
            title: 'Colaboradores',
            page: 'Colaboradores',
            colaboradores
        });
    } catch (error) {
        
    }
}


export const sucursales = async(req,res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }
        const sucursales = await exec('SP_GET_SUCURSALES');
        return res.render("sucursales/sucursales",{
            nombre,
            rol,
            adminRol,
            title: 'Sucursales',
            page: 'Sucursales',
            sucursales
        });
    } catch (error) {
        
    }

}

export const asignaciones = async(req, res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }

        const colaboradores = await exec('SP_GET_COLABORADORES');
        const sucursales = await exec('SP_GET_SUCURSALES');
        const asignaciones = await exec('SP_GET_ASIGNACIONES');

        return res.render("asignaciones/asignaciones",{
            nombre,
            rol,
            adminRol,
            title: 'Asignaciones',
            page: 'Asignaciones',
            colaboradores,
            sucursales,
            asignaciones
        });
    } catch (error) {
        
    }
}

export const transportistas = async(req, res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }

        const transportistas = await exec('SP_GET_TRANSPORTISTAS');
        console.log(transportistas);
        return res.render("transportistas/transportistas",{
            nombre,
            rol,
            adminRol,
            title: 'Transportistas',
            page: 'Transportistas',
            transportistas
        });
    } catch (error) {
        
    }
}

export const viajes = async(req, res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }

        const sucursales = await exec('SP_GET_SUCURSALES');
        const transportistas = await exec('SP_GET_TRANSPORTISTAS');
        const viajes = await exec('SP_GET_VIAJES');

        return res.render("viajes/viajes",{
            nombre,
            rol,
            adminRol,
            title: 'Viajes',
            sucursales,
            transportistas,
            viajes
        });
    } catch (error) {
        
    }
}

export const reportes = async(req, res) => {
    try {
        const{
            usuarioId,
            nombre,
            rol
        } = req.usuario

        let adminRol = false;
        if (rol === 'Administrador') {
            adminRol = true;
        }

        const transportistas = await exec('SP_GET_TRANSPORTISTAS');
        return res.render("reportes/reportes",{
            nombre,
            rol,
            adminRol,
            title: 'Reportes',
            page: 'Reportes',
            transportistas
        });
    } catch (error) {
        
    }
}