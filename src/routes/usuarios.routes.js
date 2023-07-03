import {
    Router
} from "express";
import { loginUsuario } from "../controllers/usuario.controller";



const route = Router();

route.post('/loginUsuario', loginUsuario);



export default route;