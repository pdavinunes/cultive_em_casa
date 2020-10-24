import Knex from "knex";

export async function seed(knex: Knex) {
  await knex("fertilizers").insert([
    {
      name: "Farinha de osso",
      description: "Adubo natural muito rico em fósforo e cálcio.",
    },
    {
      name: "Torta de mamona",
      description:
        "Adubo orgânico de excelente qualidade. Composto ricamente nitrogenado, eficiente na recuperação de terras esgotadas. Ela é fonte de nitrogênio, fósforo, potássio, além de micronutrientes.",
    },
    {
      name: "Húmus de minhoca",
      description:
        "Adubo natural de baixo custo resultante da decomposição de matéria orgânica digerida pela minhoca. Nele contém nitrogênio, fósforo, potássio, magnésio, cálcio e uma série de micronutrientes.",
    },
    {
      name: "Casca de ovos",
      description:
        "Adubo natural feito com ovos. Contém arbonato de cálcio, magnésio e potássio.",
    },
    {
      name: "Esterco",
      description:
        "Material orgânico em avançado estado de decomposição, contribuim para a fertilidade dos solos. Contém azoto, cálcio, magnésio, potássio e fósforo.",
    },
  ]);
}
