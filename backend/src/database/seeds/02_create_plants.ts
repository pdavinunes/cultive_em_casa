import Knex from "knex";

export async function seed(knex: Knex) {
  await knex("plants").insert([
    {
      popular_name: "Samambaias",
      scientific_name: "Nephrolepsis exaltata",
      lightness: "MEIA_SOMBRA",
      watering_frequency: "86400000",
      fertilizion_frequency: "2592000000",
      pruning_frequency: "31557600000",
      comments:
        "Molhar o solo e espirrar água nas folhas. Evite regar as folhas.",
      description:
        "As samambaias são vegetais vasculares membros do táxon das pteridófitas (que deixou de ter validade taxonômica e só é utilizado como uma denominação informal). Elas possuem tecidos vasculares (xilema e floema), folhas verdadeiras, se reproduzem através de esporos e não produzem sementes ou flores. A diversificação das samambaias parece ter ocorrido no Devoniano (há mais de 400 milhões de anos). Elas foram essenciais na ocupação dos ambientes terrestres pelos animais, fornecendo habitat e alimento além de serem importantes na formação do solo rico em nutrientes que viria a propiciar a formação das grandes florestas do carbonífero. Neste período as samambaias e as licófitas eram as principais representantes vegetais do planeta.",
    },
    {
      popular_name: "Suculentas",
      scientific_name: "Crassula Rupestris",
      lightness: "SOL_PLENO",
      watering_frequency: "604800017",
      fertilizion_frequency: "31557600000",
      pruning_frequency: "0",
      comments:
        "Não necessita poda, somente retirar folhas mortas quando necessário. Sistemas de drenagem para cultivo em xicaras e terrários.",
      description:
        "É um tipo de planta que retém muito líquido, por isso o nome suculenta. São típicas do continente africano, mas podem ser facilmente encontradas também aqui no Brasil. Por reterem bastante líquido, é uma planta ótima para quem não tem muito tempo de cuidar de plantas e por isso acaba esquecendo de regar. As suculentas podem ficar dias expostas ao sol sem precisar de tanta água quanto outros tipos. Uma das mais populares que encontramos por aqui é a Espada de São Jorge. Normalmente são confundidas com os cactos, mas não são a mesma coisa. Os cactos normalmente são reconhecidos pelos espinhos, mesmo que nem todas as espécies tenham, e as suculentas são mais reconhecidas pelas folhas mais “gordinhas”, mesmo que algumas espécies tenham a aparência de cactos.",
    },
    {
      popular_name: "Cactos",
      scientific_name: "Cactaceas",
      lightness: "SOL_PLENO",
      watering_frequency: "604800017",
      fertilizion_frequency: "94672800000",
      pruning_frequency: "0",
      comments:
        "Não precisa de poda. A areia não pode ser muito fina, nem muito arredondada para evitar a compactação do solo e prejudicar a drenagem da água.",
      description:
        "É uma planta de regiões desérticas. Cresce em lugares secos, onde outras plantas têm dificuldade para sobreviver. Sua capacidade de armazenar água é o que o mantém vivo. Os cactos têm espinhos pontudos que os impedem de ser comidos por certos animais do deserto. ",
    },
    {
      popular_name: "Cara de Cavalo",
      scientific_name: "Philodendron Panduriforme",
      lightness: "SOMBRA",
      watering_frequency: "259200000",
      fertilizion_frequency: "2629800000",
      pruning_frequency: "0",
      comments:
        "Excelente purificador de ar. Não precisa de poda, apenas retirar as folhas amareladas e secas para evitar a proliferação de fungos e bactérias",
      description:
        "Esta espécie de Filodendro é chamada popularmente de cara-de-cavalo porque a sua maior característica é o formato das folhas. Elas são recortadas com formato parecido com a cara de um cavalo. Sua folhagem atrai os paisagistas por ser abundante e de aparência muito ornamental. A planta tem um excelente crescimento e pode alcançar até um metro de dimensão. O Filodendro cara-de-cavalo é uma planta de hábito de trepadeira.",
    },
    {
      popular_name: "Comigo Ninguém Pode",
      scientific_name: "Dieffenbachia amoena",
      lightness: "MEIA_SOMBRA",
      watering_frequency: "302400008",
      fertilizion_frequency: "2629800000",
      pruning_frequency: "0",
      comments:
        "Planta venenosa, todas as partes são prejudiciais se forem ingeridas. Não precisa de poda, apenas retirar sempre as folhas secas ou amareladas para que a planta se desenvolva melhor",
      description:
        'É uma planta da família das Araceae muito apreciada como ornamental de interiores, dada a sua tolerância à baixa luminosidade ambiente e baixa umidade relativa do ar. Produz grandes folhas variegadas, com vários tons de verde e amarelo, lustrosas e duradouras, o que o torna muito interessante em decoração de interiores. Em algumas regiões do mundo, a sua popularidade como planta doméstica é acrescida devido à fama que a planta leva de "espantar o mau-olhado e maus-espíritos".',
    },
    {
      popular_name: "Babosa",
      scientific_name: "Alocacia Black",
      lightness: "SOL_PLENO",
      watering_frequency: "604800017",
      fertilizion_frequency: "3888000000",
      pruning_frequency: "0",
      comments: "Não precisa de poda. Usada para hidratar cabelo ou pele.",
      description:
        "É uma espécie de planta suculenta do gênero Aloe. Cresce selvagem em climas tropicais ao redor do mundo e é cultivada para usos agrícolas e medicinais. Também é usada para fins decorativos e cresce com sucesso dentro de casa como uma planta em vaso. É usada em muitos produtos de consumo, incluindo bebidas, loções para a pele, cosméticos ou pomadas para pequenas queimaduras e queimaduras solares. Existem diversas evidências científicas da eficácia ou segurança dos extratos de Aloe vera, quer para fins cosméticos ou medicinais, mas tais evidências positivas são às vezes contraditórias com outros estudos.",
    },
    {
      popular_name: "Espada de São Jorge",
      scientific_name: "Dracaena trifasciata",
      lightness: "MEIA_SOMBRA",
      watering_frequency: "302400008",
      fertilizion_frequency: "31557600000",
      pruning_frequency: "0",
      comments: "Não precisa de poda. Planta tóxica não letal.",
      description:
        "É uma planta herbácea de origem africana. Também é importante saber que é uma planta tóxica, e que não deve ser ingerida. Além do seu uso ornamental, as espadas-de-são-jorge são também conhecidas como plantas de proteção contra o mau-olhado, devendo ser colocadas próximo à entrada das casas.",
    },
    {
      popular_name: "Hibisco",
      scientific_name: "Hibiscus",
      lightness: "SOL_PLENO",
      watering_frequency: "86400000",
      fertilizion_frequency: "2592000000",
      pruning_frequency: "0",
      comments:
        "Poda de aparação cortando apenas as pontas dos ramos dando um aspecto arredondado. Suas flores podem ser usadas para chás com diferentes finalidades (diuréticos, laxantes, tratamentos gastrointestinais)",
      description:
        "É um gênero de plantas com flor que agrupa cerca de 300 espécies, inserido na família das Malvaceae, com flores e folhas exuberantes. Devido à nova taxonomia pela filogenética (Angiosperm Phylogeny Group), muitas espécies que pertenciam a esse gênero estão migrando para outros gêneros. Por exemplo: Hibiscus esculentus L., a planta do quiabo, agora é Abelmoschus esculentus (L.) Moench. O cultivo dos exemplares do gênero, tanto ornamental como econômico, está disseminado nas regiões subtropicais e tropicais, cuidando para não sofrerem com geadas e temperaturas baixas constantes.",
    },
    {
      popular_name: "Girassol",
      scientific_name: "Helianthus annuus",
      lightness: "SOL_PLENO",
      watering_frequency: "86400000",
      fertilizion_frequency: "2592000000",
      pruning_frequency: "0",
      comments:
        "Não precisa de poda, apenas retire os girassóis fracos para evitar que eles roubem os nutrientes presentes no solo. As raízes do girassol são longas e podem apodrecer se o solo for alagado.",
      description:
        "É uma planta anual da família das Asteraceae, gênero Heliantheae. Está situado na tribo Heliantheae, subtribo Helianthinae. É cultivada pelo seu óleo e frutos comestíveis. O nome é derivado do formato de sua inflorescência. É caracterizada por possuir grandes inflorescências do tipo capítulo — com aproximadamente 30 cm de diâmetro — cujo caule pode atingir até 3 metros de altura e apresenta filotaxia do tipo oposta cruzada. O girassol mais alto já registrado chegou a 9.17 metros.",
    },
    {
      popular_name: "Palmeiras",
      scientific_name: "Arecaceae",
      lightness: "MEIA_SOMBRA",
      watering_frequency: "950400008",
      fertilizion_frequency: "31557600000",
      pruning_frequency: "0",
      comments:
        "Não precisa de poda, apenas cortar folhas escuras e queimadas. Usar borrifador de água uma vez por semana nas folhas para evitar que elas fiquem com aspecto queimada nas pontas.",
      description:
        "É uma família de plantas com flor monocotiledóneas da ordem Arecales, também conhecida pelo nome obsoleto de Palmae, que inclui as espécies conhecidas pelo nome comum de palmeiras. Na sua actual circunscrição taxonómica a família inclui 183 géneros com cerca de 2600 espécies extantes validamente descritas, entre as quais plantas muito conhecidas, como o coqueiro e a tamareira.",
    },
  ]);
}
