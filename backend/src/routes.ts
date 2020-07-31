import express from "express";
import UserRouter from "./routes/UserRouter";
import PlantRouter from "./routes/PlantRouter";

const routes = express.Router();

routes.use(UserRouter);
routes.use(PlantRouter);

export default routes;
