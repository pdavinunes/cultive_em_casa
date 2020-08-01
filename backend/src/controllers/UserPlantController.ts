import { Request, Response } from "express";

import UserPlantService from "../services/UserPlantService";

const service = new UserPlantService();

interface Result {
  status: any;
  message: string;
}
class UserPlantController {
  async index(req: Request, res: Response) {
    const { id } = req.params;
    const resultShow = (await service.show(id)) as Result;
    res.status(resultShow.status).json({ ...resultShow });
  }

  async store(req: Request, res: Response) {
    const image = req.file.filename;
    const user_plant = { ...req.body, image };
    const resultStore = (await service.store(user_plant)) as Result;
    return res.status(resultStore.status).json({ ...resultStore });
  }

  async update(req: Request, res: Response) {
    const { id } = req.params;
    const user_plant = { ...req.body };
    const resultUpdate = (await service.update(id, user_plant)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }

  async action(req: Request, res: Response) {
    const { id } = req.params;
    const action = { ...req.body };
    const resultUpdate = (await service.action(id, action)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }

  async delete(req: Request, res: Response) {
    const { id } = req.params;
    const resultUpdate = (await service.delete(id)) as Result;
    return res.status(resultUpdate.status).json({ ...resultUpdate });
  }
}

export default UserPlantController;
