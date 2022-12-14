USE db_agregacao;

INSERT INTO classe(nome_classe)
VALUES('perfumaria'),
  ('construcao'), 
  ('alimento'), 
  ('limpeza'),
  ('higiene'), 
  ('eletrodomesticos'),
  ('informatica'),
  ('saude'),
  ('telefonia'),
  ('esporte');
  
  INSERT INTO produto(cod_classe, tipo_produto, nome_produto, quantidade_produto, valor_produto)
  VALUE(1, 'perfume', 'silver_scent', 10, '150,00'), 
  (1, 'perfumaria', 'million',15 , '485,00'), 
  (1, 'perfumaria', 'billion', 21, '145,00'), 
  (2, 'construcao', 'tijolo_6_furo', 50.000, '1050,00'),
  (2, 'construcao', 'areia_media', 200, '165,00'),
  (2, 'construcao', 'telha_cimento', 30.000, '3,00'), 
  (3, 'alimento', 'bife', 150, '30,00'), 
  (3, 'alimento', 'picanha', 200, '65,00'), 
  (3, 'alimento', 'file', 165, '31,00'),
  (3, 'alimento', 'feijao_preto', 300, '12,00'), 
  (3, 'alimento', 'farinha_trigo', 500, '7,00'),
  (4, 'limpeza', 'desinfetante', 120, '8,00'),
  (4, 'limpeza', 'sabão_em_po', 145, '21,00'),
  (4, 'limpeza', 'detergente', 160, '4,00'),
  (4, 'limpeza', 'amaciante', 104, '12,00'),
  (5, 'higiene', 'shampoo', 230, '18,00'),
  (5, 'higiene', 'sabonete', 340, '2,00'),
  (5, 'higiene', 'condicionador', 260, '15,00'),
  (5, 'higiene', 'escova_detal', 350, '13,00'),
  (6, 'eletrodomestico', 'forno_eletrico', 15, '410,00'),
  (6, 'eletrodomestico', 'microondas', 12, '395,00'),
  (6, 'eletrodomestico', 'geladeira', 9, '2500,00'),
  (6, 'eletrodomestico', 'cafeteira', 14, '130,00'),
  (7, 'infromatica', 'mouse', 18, '60,00'),
  (7, 'informatica', 'teclado', 10, '50,00'),
  (7, 'informatica', 'fonte', 6, '180,00'), 
  (8, 'saude', 'soro', 10, '11,00'),
  (8, 'saude', 'esparadrapo', 21, '19,00'),
  (8, 'saude', 'gazes_curativo', 40, '9,00'),
  (9, 'telefonia', 'telefone', 8, '145,00'),
  (10, 'esporte', 'bola_futebol', 10, '80,00'),
  (10, 'esporte', 'bola_voeibol', 15, '65,00'),
  (10, 'esporte', 'bola_handebol', 8, '61,00');
  