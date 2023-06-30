import express from "express";
import cookieParser from 'cookie-parser';
import path from 'path';
import {
    create
} from "express-handlebars";
import cors from 'cors';

import config from "./config/config";
import mainRoutes from "./routes/main.routes";

const app = express();

app.set('port', config.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.use(cors());

const exphbs = create({
    extname: '.hbs',
    layoutsDir: path.join(app.get("views"), "layouts"),
    defaultLayout: 'main',
    partialsDir: [
        path.join(app.get('views'), 'partials'),
    ],
});

app.engine(".hbs", exphbs.engine);
app.set("view engine", ".hbs");

app.use(express.urlencoded({
    extended: false
}));
app.use(cookieParser());
app.use(express.json());


app.use(mainRoutes);


app.use(express.static(path.join(__dirname, 'public')));


export default app;