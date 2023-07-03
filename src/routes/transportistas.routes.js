import {
    Router
} from "express";
import { getTransportista, nuevoTransportista } from "../controllers/transportista.controller";
import { checkRoleAuth } from "../middlewares/rolesJWT.middleware";



const route = Router();


route.post('/nuevoTransportista', checkRoleAuth(['Administrador']), nuevoTransportista);
route.get('/getTransportista/:transportistaId', checkRoleAuth(['Administrador', 'Gerente de Tiendas']), getTransportista);

export default route;