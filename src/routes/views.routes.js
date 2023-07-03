import {
    Router
} from "express";
import {
    asignaciones,
    colaboradores,
    loginUser,
    redirectLoginUser,
    reportes,
    sucursales,
    transportistas,
    usuarios,
    viajes
} from "../controllers/view.controller";
import { checkRoleAuth } from "../middlewares/rolesJWT.middleware";



const route = Router();


route.get("/login", loginUser);
route.get('/', redirectLoginUser);

// route.get('/usuarios', checkRoleAuth(['Administrador']) ,usuarios);
route.get('/sucursales', checkRoleAuth(['Administrador']), sucursales);
route.get('/colaboradores', checkRoleAuth(['Administrador']), colaboradores);
route.get('/asignaciones', checkRoleAuth(['Administrador']), asignaciones)
route.get('/transportistas', checkRoleAuth(['Administrador']), transportistas);
route.get('/viajes', checkRoleAuth(['Administrador', 'Gerente de Tiendas']), viajes);
route.get('/reportes', checkRoleAuth(['Administrador', 'Gerente de Tiendas']), reportes);




export default route;