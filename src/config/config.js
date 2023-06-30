import {
    config
} from "dotenv";

config();

export default {
    PORT: process.env.PORT,
    DB_HOST: process.env.DB_HOST,
    DB_USER: process.env.DB_USER,
    DB_PASS: process.env.DB_PASSWORD,
    DB_NAME: process.env.DB_NAME,
    SECRET: process.env.SECRET,
}