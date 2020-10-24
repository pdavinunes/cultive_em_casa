import express from "express";

import PlantController from "../controllers/PlantController";

const plantRouter = express.Router();

const plantController = new PlantController();

plantRouter.get("/plants", plantController.index);
plantRouter.get("/plants/:id", plantController.show);

export default plantRouter;
