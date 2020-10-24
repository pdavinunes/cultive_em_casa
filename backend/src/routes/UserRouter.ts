import express from "express";
import multer from "multer";

import UserController from "../controllers/UserController";
import multerConfigUser from "../config/multerUser";

const userRouter = express.Router();
const upload = multer(multerConfigUser);

const userController = new UserController();

userRouter.get("/users", userController.index);
userRouter.get("/users/:id", userController.show);
userRouter.post("/users", upload.single("image"), userController.store);
userRouter.post("/auth", userController.auth);
userRouter.put("/users/:id", userController.update);
userRouter.put("/users/:id/password", userController.updatePassword);
userRouter.put(
  "/users/:id/image",
  upload.single("image"),
  userController.updateImage
);
userRouter.delete("/users/:id", userController.delete);

export default userRouter;
