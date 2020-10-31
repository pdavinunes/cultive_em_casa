import { Request, Response } from "express";

import UserService from "../services/UserService";
import User from "../models/User";

const service = new UserService();

interface Result {
  status: any;
  message: string;
}
class UserController {
  async index(req: Request, res: Response) {
    const users = await service.index();
    return res.json(users);
  }

  async show(req: Request, res: Response) {
    const { id } = req.params;
    const resultShow = (await service.show(id)) as Result;
    res.status(resultShow.status).json({ ...resultShow });
  }

  async store(req: Request, res: Response) {
    const { name, username, password, email } = req.body;
    const user = new User(name, email, username, password, req.file.filename);
    
    const resultStore = (await service.store(user)) as Result;

    return res.status(resultStore.status).json({ ...resultStore });
  }

  async auth(req: Request, res: Response) {
    const { username, password } = req.body;
    const resultAuth = (await service.auth(username, password)) as Result;
    return res.status(resultAuth.status).json({ ...resultAuth });
  }

  async update(req: Request, res: Response) {
    const { id } = req.params;
    const user = { ...req.body };
    const resultUpdate = (await service.update(id, user)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }

  async updatePassword(req: Request, res: Response) {
    const { id } = req.params;
    const { password } = req.body;
    const resultUpdate = (await service.updatePassword(id, password)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }

  async updateImage(req: Request, res: Response) {
    const { id } = req.params;
    const image = req.file.filename;
    const resultUpdate = (await service.updateImage(id, image)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }

  async delete(req: Request, res: Response) {
    const { id } = req.params;
    const resultUpdate = (await service.delete(id)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }
}

export default UserController;
