import { Router } from "express";
import viewsRouters from './views.routes';


const route = Router();

route.use(viewsRouters);

export default route;
