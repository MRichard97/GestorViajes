import {
    Router
} from "express";
import { nuevaSucursal } from "../controllers/sucursal.controller";
import { checkRoleAuth } from "../middlewares/rolesJWT.middleware";



const route = Router();

route.post('/nuevaSucursal', checkRoleAuth(['Administrador']), nuevaSucursal);


export default route;