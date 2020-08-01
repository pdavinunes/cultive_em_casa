import express from "express";
import UserRouter from "./routes/UserRouter";
import UserPlantRouter from "./routes/UserPlantRouter";
import PlantRouter from "./routes/PlantRouter";

const routes = express.Router();

routes.use(UserPlantRouter);
routes.use(UserRouter);
routes.use(PlantRouter);

export default routes;
