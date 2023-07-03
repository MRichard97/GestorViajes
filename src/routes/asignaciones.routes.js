import {
    Router
} from "express";
import { checkRoleAuth } from "../middlewares/rolesJWT.middleware";
import { nuevaAsignacion } from "../controllers/asignacion.controller";



const route = Router();

route.post('/nuevaAsignacion', checkRoleAuth(['Administrador']), nuevaAsignacion);


export default route;