const List<Map<String, dynamic>> questions = [{
  "id":"Cat_via",
  "name":"Categoria da via Urbana:",
  "isMulti": false,
  "options":["local, 30km/h", "coletora, 40km/h", "arterial, ligam bairros, avenida, 60km/h", "trânsito rápido, 80km/h", "rodovia, 110km/h"],
},
{
  "id":"Sit_pav",
  "name":"Situação da Pavimentação:",
  "isMulti": false,
  "options":["Asfaltada", "Asfalto Baixo Conforto", "Concreto", "Concreto Baixo Conforto", "Terra/Cascalho/Pedregosa"],
},
{
  "id":"Sit_urb",
  "name":"Sinalização Urbana:",
  "isMulti": true,
  "options":["Ciclofaixa", "Faixa de Pedestre", "Horizontal/Chão", "logradouro/Rua", "Placa Trânsito", "Semáforo", "Sinalização Tátil"],
},
{
  "id":"Cal_Pass",
  "name":"Calçadas/Passeio:",
  "isMulti": true,
  "options":["Calçamento", "Calçamento Baixo Conforto", "Obstáculo", "Ponto Ônibus", "Rampa Acessibilidade", "Sem Acessibilidade", "Terra/Cascalho"],
},
{
  "id":"Ilu_Pub",
  "name":"Iluminação Pública:",
  "isMulti": false,
  "options":["Sim", "Não", "Inadequada"],
},
{
  "id":"Arb",
  "name":"Arborização:",
  "isMulti": true,
  "options":["Sim", "Não", "Obstáculo", "Canteiro Adequado", "Canteiro Inadequado", "Conforto Ambiental", "Necessidade de poda", "Raízes Expostas"],
},
{
  "id":"Sis_Dre",
  "name":"Sistema de Drenagem:",
  "isMulti": true,
  "options":["Boca de lobo", "Bueiro", "Obstáculo", "Canteiro Adequado", "Canteiro Inadequado", "Conforto Ambiental", "Necessidade de Poda", "Raízes Expostas"],
},
{
  "id":"Esgo_Sani",
  "name":"Esgotamento Sanitário:",
  "isMulti": true,
  "options":["Com Rede Pública", "Bueiro", "Canaleta", "Poço de Visita", "Sem Sistema"],
},
];