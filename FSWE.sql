--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('allergies_id_seq', 5, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('categories_id_seq', 11, true);


--
-- Name: conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('conversions_id_seq', 12, true);


--
-- Name: ingredient_allergy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('ingredient_allergy_id_seq', 92, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('ingredients_id_seq', 29, true);


--
-- Name: menue_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('menue_recipe_id_seq', 21, true);


--
-- Name: menues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('menues_id_seq', 4, true);


--
-- Name: recipe_allergy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('recipe_allergy_id_seq', 62, true);


--
-- Name: recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('recipe_ingredient_id_seq', 46, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('recipes_id_seq', 32, true);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('units_id_seq', 8, true);


--
-- Data for Name: allergies; Type: TABLE DATA; Schema: public; Owner: max
--

COPY allergies (id, name) FROM stdin;
2	Vegan
3	Vegetarisch
4	Laktosefrei
5	Glutenfrei
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: max
--

COPY categories (id, name) FROM stdin;
4	Gemüse
5	Obst
6	Fleisch
7	Konserven
8	Gewürze
9	Fisch
10	Nudeln & Getreide
11	Milchprodukte
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: max
--

COPY units (id, name) FROM stdin;
1	g
4	ml
5	Stück
6	Zehe
7	Prise
8	Bund
\.


--
-- Data for Name: conversions; Type: TABLE DATA; Schema: public; Owner: max
--

COPY conversions (id, unit1, unit2, ingredient, factor) FROM stdin;
8	6	1	14	2.5
9	7	1	18	0.005
10	7	1	19	0.005
11	7	1	20	0.005
12	5	1	21	40.0
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: max
--

COPY ingredients (id, name, favored_unit, category) FROM stdin;
12	Nudeln	1	10
13	Reis	1	10
14	Knoblauch	1	4
15	Sahne	4	11
16	Gorgonzola	1	11
17	Schinkenspeck	1	6
18	Pfeffer - Weiß	1	8
20	Muskatnuss	1	8
19	Salz	1	8
21	Zwiebeln	1	4
22	Tomaten - getrocknet	1	7
23	Sahne - Soja	4	11
24	Champignons	1	4
25	Suppengrün	8	4
26	Mehl	1	10
27	Spargel	1	4
28	Milch	4	11
29	Eier	5	11
\.


--
-- Data for Name: ingredient_allergy; Type: TABLE DATA; Schema: public; Owner: max
--

COPY ingredient_allergy (id, ingredient, allergy) FROM stdin;
24	12	4
25	12	2
26	12	3
27	13	5
28	13	4
29	13	2
30	13	3
31	14	5
32	14	4
33	14	2
34	14	3
35	15	5
36	15	3
37	16	5
38	16	3
39	17	5
40	17	4
45	18	5
46	18	4
47	18	2
48	18	3
53	20	5
54	20	4
55	20	2
56	20	3
57	19	5
58	19	4
59	19	2
60	19	3
61	21	5
62	21	4
63	21	2
64	21	3
65	22	5
66	22	4
67	22	2
68	22	3
69	23	5
70	23	4
71	23	2
72	23	3
73	24	5
74	24	4
75	24	2
76	24	3
77	25	5
78	25	4
79	25	2
80	25	3
81	26	4
82	26	2
83	26	3
84	27	5
85	27	4
86	27	2
87	27	3
88	28	5
89	28	3
90	29	5
91	29	4
92	29	3
\.


--
-- Data for Name: menues; Type: TABLE DATA; Schema: public; Owner: max
--

COPY menues (id, name, created, people) FROM stdin;
4	FSWE SS14	2014-10-14 21:32:43	25
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: max
--

COPY recipes (id, name, comment, image) FROM stdin;
30	Grogonzolasauce	Speck in einem Topf anbraten. Sahne dazugeben und zum köcheln bringen. Knoblauch fein gehackt dazugeben und Gorgonzola etwas kleingewürftelt in der Sahne schmelzen. Würzen und etwas einkochen lassen.	\N
31	Pilzsauce		\N
32	Spargelsuppe		\N
\.


--
-- Data for Name: menue_recipe; Type: TABLE DATA; Schema: public; Owner: max
--

COPY menue_recipe (id, menue, recipe, factor) FROM stdin;
21	4	32	1.0
19	4	30	0.5
20	4	31	0.5
\.


--
-- Data for Name: recipe_allergy; Type: TABLE DATA; Schema: public; Owner: max
--

COPY recipe_allergy (id, recipe, allergy) FROM stdin;
58	31	4
59	31	2
60	31	3
62	32	3
\.


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: max
--

COPY recipe_ingredient (id, ingredient, recipe, unit, amount) FROM stdin;
28	12	30	1	125.0
29	14	30	6	0.6
30	15	30	4	120.0
31	16	30	1	120.0
32	17	30	1	40.0
33	18	30	7	1.0
34	19	30	7	1.0
35	20	30	7	1.0
36	12	31	1	125.0
37	21	31	1	30.0
38	14	31	1	1.5
39	22	31	1	10.0
40	24	31	1	200.0
41	23	31	4	65.0
42	27	32	1	50.0
43	25	32	8	0.15
44	26	32	1	12.5
45	28	32	4	25.0
46	29	32	5	0.25
\.


--
-- PostgreSQL database dump complete
--

