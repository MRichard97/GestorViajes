import {
    Router
} from "express";

import { checkRoleAuth } from "../middlewares/rolesJWT.middleware";
import { getColaborador, getColaboradores, nuevoColaborador } from "../controllers/colaborador.controller";



const route = Router();


route.post('/nuevoColaborador', checkRoleAuth(['Administrador']), nuevoColaborador);
route.get('/getColaboradores/:sucursalId', checkRoleAuth(['Administrador', 'Gerente de Tiendas']), getColaboradores);
route.get('/getColaborador/:colaboradorId/:sucursalId', checkRoleAuth(['Administrador', 'Gerente de Tiendas']), getColaborador);


export default route;