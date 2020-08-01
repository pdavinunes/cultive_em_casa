import express from "express";
import multer from "multer";

import UserPlantController from "../controllers/UserPlantController";
import multerConfigPlant from "../config/multerPlant";

const userPlantRouter = express.Router();
const upload = multer(multerConfigPlant);

const userPlantController = new UserPlantController();

userPlantRouter.get("/user-plants/:id", userPlantController.index);
userPlantRouter.post(
  "/user-plants",
  upload.single("image"),
  userPlantController.store
);
userPlantRouter.put("/user-plants/:id", userPlantController.update);
userPlantRouter.put("/user-plants/:id/action", userPlantController.action);
userPlantRouter.delete("/user-plants/:id", userPlantController.delete);

export default userPlantRouter;
