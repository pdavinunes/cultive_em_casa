import Knex from "knex";

export async function seed(knex: Knex) {
  await knex("plant_fertilizers").insert([
    {
      plant_id: "1",
      fertilizer_id: "1",
    },
    {
      plant_id: "1",
      fertilizer_id: "2",
    },
    {
      plant_id: "2",
      fertilizer_id: "3",
    },
    {
      plant_id: "3",
      fertilizer_id: "1",
    },
    {
      plant_id: "3",
      fertilizer_id: "4",
    },
    {
      plant_id: "4",
      fertilizer_id: "4",
    },
    {
      plant_id: "4",
      fertilizer_id: "1",
    },
    {
      plant_id: "5",
      fertilizer_id: "1",
    },
    {
      plant_id: "5",
      fertilizer_id: "2",
    },
    {
      plant_id: "6",
      fertilizer_id: "2",
    },
    {
      plant_id: "6",
      fertilizer_id: "4",
    },
    {
      plant_id: "7",
      fertilizer_id: "3",
    },
    {
      plant_id: "8",
      fertilizer_id: "5",
    },
    {
      plant_id: "8",
      fertilizer_id: "4",
    },
    {
      plant_id: "9",
      fertilizer_id: "3",
    },
    {
      plant_id: "10",
      fertilizer_id: "4",
    },
    {
      plant_id: "10",
      fertilizer_id: "2",
    },
  ]);
}
