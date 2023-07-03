import {
    Router
} from "express";
import { checkRoleAuth } from "../middlewares/rolesJWT.middleware";
import { nuevoViaje, reporte } from "../controllers/viaje.controller";



const route = Router();

route.post('/nuevoViaje', checkRoleAuth(['Administrador', 'Gerente de Tiendas']), nuevoViaje);
route.post('/reporte',checkRoleAuth(['Administrador', 'Gerente de Tiendas']), reporte)


export default route;