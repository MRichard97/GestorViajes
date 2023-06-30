import {
    Router
} from "express";
import {
    loginUser,
    redirectLoginUser,
    sucursales
} from "../controllers/view.controller";



const route = Router();


route.get("/login", loginUser);
route.get('/', redirectLoginUser);

route.get('/sucursales', sucursales);



export default route;