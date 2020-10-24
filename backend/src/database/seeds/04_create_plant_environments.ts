import Knex from "knex";

export async function seed(knex: Knex) {
  await knex("plant_environments").insert([
    {
      plant_id: "1",
      environment_id: "1",
    },
    {
      plant_id: "1",
      environment_id: "2",
    },
    {
      plant_id: "1",
      environment_id: "3",
    },
    {
      plant_id: "2",
      environment_id: "2",
    },
    {
      plant_id: "2",
      environment_id: "5",
    },
    {
      plant_id: "2",
      environment_id: "6",
    },
    {
      plant_id: "3",
      environment_id: "7",
    },
    {
      plant_id: "3",
      environment_id: "8",
    },
    {
      plant_id: "3",
      environment_id: "9",
    },
    {
      plant_id: "4",
      environment_id: "3",
    },
    {
      plant_id: "4",
      environment_id: "10",
    },
    {
      plant_id: "4",
      environment_id: "5",
    },
    {
      plant_id: "4",
      environment_id: "2",
    },
    {
      plant_id: "5",
      environment_id: "2",
    },
    {
      plant_id: "5",
      environment_id: "8",
    },
    {
      plant_id: "5",
      environment_id: "12",
    },
    {
      plant_id: "6",
      environment_id: "12",
    },
    {
      plant_id: "6",
      environment_id: "10",
    },
    {
      plant_id: "6",
      environment_id: "2",
    },
    {
      plant_id: "6",
      environment_id: "11",
    },
    {
      plant_id: "6",
      environment_id: "3",
    },
    {
      plant_id: "7",
      environment_id: "2",
    },
    {
      plant_id: "7",
      environment_id: "6",
    },
    {
      plant_id: "7",
      environment_id: "13",
    },
    {
      plant_id: "8",
      environment_id: "6",
    },
    {
      plant_id: "8",
      environment_id: "4",
    },
    {
      plant_id: "8",
      environment_id: "7",
    },
    {
      plant_id: "9",
      environment_id: "15",
    },
    {
      plant_id: "9",
      environment_id: "6",
    },
    {
      plant_id: "9",
      environment_id: "8",
    },
    {
      plant_id: "10",
      environment_id: "3",
    },
    {
      plant_id: "10",
      environment_id: "12",
    },
    {
      plant_id: "10",
      environment_id: "14",
    },
    {
      plant_id: "10",
      environment_id: "15",
    },
  ]);
}
