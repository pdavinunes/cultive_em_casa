import { Request, Response } from "express";

import PlantService from "../services/PlantService";

const plantService = new PlantService();

interface Result {
  status: number;
}

class PlantController {
  async index(req: Request, res: Response) {
    const plants = await plantService.index();
    return res.json({ plants });
  }

  async show(req: Request, res: Response) {
    const { id } = req.params;
    const result = (await plantService.show(id)) as Result;
    return res.status(result.status).json({ result });
  }
}

export default PlantController;
