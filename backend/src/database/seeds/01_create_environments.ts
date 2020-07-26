import Knex from "knex";

export async function seed(knex: Knex) {
  await knex("environments").insert([
    {
      name: "Garagem",
      description: "...",
    },
    {
      name: "Sala de estar",
      description: "...",
    },
    {
      name: "Locais fechados",
      description: "...",
    },
    {
      name: "Locais bem ventilados",
      description: "...",
    },
    {
      name: "Quarto",
      description: "...",
    },
    {
      name: "Jardim",
      description: "...",
    },
    {
      name: "Locais com muita luz",
      description: "...",
    },
    {
      name: "Varanda",
      description: "...",
    },
    {
      name: "Próximo de janelas",
      description: "...",
    },
    {
      name: "Escritório",
      description: "...",
    },
    {
      name: "Locais com pouca luz",
      description: "...",
    },
    {
      name: "Jardim de inverno",
      description: "...",
    },
    {
      name: "Escrivaninha",
      description: "...",
    },
    {
      name: "Calçada",
      description: "...",
    },
    {
      name: "Locais com luz indireta",
      description: "...",
    },
  ]);
}
