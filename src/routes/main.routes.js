import { Router } from "express";
import viewsRouters from './views.routes';
import usuariosRouters from './usuarios.routes'
import sucursalesRouters from './sucursales.routes';
import colaboradoresRouters from './colaboradores.routes';
import transportistasRouters from './transportistas.routes';
import asignacionesRoutes from './asignaciones.routes';
import viajesRoutes from './viajes.routes';

const route = Router();

route.use(viewsRouters);
route.use(usuariosRouters);
route.use(sucursalesRouters);
route.use(colaboradoresRouters);
route.use(transportistasRouters);
route.use(asignacionesRoutes);
route.use(viajesRoutes);

export default route;
