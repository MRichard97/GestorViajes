import {
    Router
} from "express";
import {
    loginUser,
    redirectLoginUser
} from "../controllers/view.controller";



const route = Router();


route.get("/login", loginUser);
route.get('/', redirectLoginUser);



export default route;