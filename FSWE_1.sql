--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

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
-- Name: allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('allergies_id_seq', 5, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: max
--

COPY categories (id, name, niceness) FROM stdin;
4	Gemüse	\N
5	Obst	\N
6	Fleisch	\N
7	Konserven	\N
9	Fisch	\N
10	Nudeln & Getreide	\N
11	Milchprodukte	\N
12	Sonstiges	\N
13	Flüssigkeiten	\N
14	Nüsse	\N
15	Backwaren	\N
16	Tiefkühlkost	\N
8	Gewürze & Kräuter	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('categories_id_seq', 17, true);


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
9	El
10	Tl
11	Pkg
12	Beutel
13	l
14	Tasse
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
13	5	1	57	50.0
15	9	4	61	15.0
16	10	4	61	5.0
17	10	1	62	5.0
18	9	1	62	9.0
19	10	1	63	5.0
20	9	1	63	15.0
21	10	1	26	3.0
22	9	1	26	10.0
23	9	4	28	15.0
24	10	4	28	5.0
14	9	4	42	10.0
25	10	4	42	3.0
26	9	4	31	10.0
27	10	4	31	3.0
28	10	4	15	5.0
29	9	4	15	13.0
30	9	4	51	13.0
31	10	4	51	5.0
32	10	1	33	5.0
33	9	1	33	15.0
34	9	4	70	15.0
35	10	4	70	5.0
36	5	1	71	180.0
37	10	4	72	5.0
38	9	4	72	15.0
39	13	4	28	1000.0
40	4	13	40	0.001
41	4	13	74	0.001
42	14	1	80	9.0
43	10	1	81	3.0
44	10	1	82	5.0
45	4	1	83	1.0
46	9	1	84	15.0
\.


--
-- Name: conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('conversions_id_seq', 46, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: max
--

COPY ingredients (id, name, favored_unit, category, comment) FROM stdin;
12	Nudeln	1	10	\N
13	Reis	1	10	\N
14	Knoblauch	1	4	\N
15	Sahne	4	11	\N
16	Gorgonzola	1	11	\N
17	Schinkenspeck	1	6	\N
20	Muskatnuss	1	8	\N
19	Salz	1	8	\N
21	Zwiebeln	1	4	\N
22	Tomaten - getrocknet	1	7	\N
24	Champignons	1	4	\N
25	Suppengrün	8	4	\N
26	Mehl	1	10	\N
27	Spargel	1	4	\N
28	Milch	4	11	\N
29	Eier	5	11	\N
30	Tomaten - gehackt	1	7	\N
32	Chilischote	5	4	\N
33	Tomatenmark	1	7	\N
31	Olivenöl	4	13	\N
34	Grappa	4	13	\N
35	Basilikum - getrocknet	1	8	\N
37	Petersilie - frisch	8	4	\N
38	Petersilie - getrocknet	1	8	\N
39	Pfeffer - schwarz	1	8	\N
41	Mandeln 	1	14	\N
42	Öl	4	13	\N
43	Zitrone	5	5	\N
18	Pfeffer - weiß	1	8	\N
45	Chilischote - grün	5	4	\N
47	Ingewer	1	4	\N
48	Kurkuma	1	8	\N
49	Erbsen - gefroren	1	16	\N
50	Cummin	1	8	\N
46	Koreander - frisch	8	4	\N
53	Steinpilze - getrocknet	1	8	\N
54	Kürbis	1	4	\N
55	Kartoffeln	1	4	\N
56	Karotten	1	4	\N
57	Schalotten	1	4	\N
58	Weisswein	4	13	\N
59	Gemüsebrühe	4	13	\N
60	Feldsalat	1	4	\N
61	Balsamico	4	13	\N
62	Senf	1	7	\N
63	Zucker	1	15	\N
64	Kräuter - gemischt TK 	1	16	\N
44	Vanillezucker	11	15	\N
65	Strudelteig	11	15	\N
66	Semmelbrösel	1	15	\N
67	Butter - vegan	1	11	\N
68	Zimt	1	8	\N
69	Rosinen	1	15	\N
70	Zitronensaft	4	13	\N
71	Äpfel	1	5	\N
72	Rum	4	13	\N
73	Puderzucker	1	15	\N
75	Orangensaft	4	13	\N
76	Apfelsaft	4	13	\N
77	Cola	4	13	\N
78	Eisteekonzentrat	11	13	\N
79	Tee	12	13	\N
40	Wasser	13	13	\N
74	Wasser - Sprudel	13	13	\N
80	Kaffe	1	13	\N
81	Trockenhefe	1	15	\N
82	Backpulver	1	15	\N
83	Joghurt - natur	1	11	\N
84	Seesam	1	15	\N
87	Butter	1	11	\N
88	Käse -aufschnitt	1	11	\N
90	Nutella	1	7	\N
91	Marmelade 	1	7	\N
89	Wurst - aufschnitt 	1	6	\N
92	Honig	1	7	\N
93	Müsli	1	10	\N
94	Joghurt - Frühstück	1	11	\N
86	Brot	1	15	\N
85	Brötchen	5	15	\N
95	Wasser - Still	13	13	\N
96	Aufstrich - vegan	1	7	\N
97	Agaven Dicksaft	1	7	\N
98	Schweinefleisch	1	6	\N
51	Sojasahne	4	11	test2
36	Basilikum - frisch	8	4	
100	Paprika	1	4	
101	Gouda	1	11	
102	Mais	1	4	
103	Kidneybohnen	1	7	
104	ddd	12	15	
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
93	30	5
94	30	4
95	30	2
96	30	3
101	32	5
102	32	4
103	32	2
104	32	3
105	33	5
106	33	4
107	33	2
108	33	3
109	31	5
110	31	4
111	31	2
112	31	3
113	34	5
114	34	4
115	34	2
116	34	3
117	35	5
118	35	4
119	35	2
120	35	3
125	37	5
126	37	4
127	37	2
128	37	3
129	38	5
130	38	4
131	38	2
132	38	3
133	39	5
134	39	4
135	39	2
136	39	3
141	41	5
142	41	4
143	41	2
144	41	3
145	42	5
146	42	4
147	42	2
148	42	3
149	43	5
150	43	4
151	43	2
152	43	3
157	18	5
158	18	4
159	18	2
160	18	3
161	45	5
162	45	4
163	45	2
164	45	3
169	47	5
170	47	4
171	47	2
172	47	3
173	48	5
174	48	4
175	48	2
176	48	3
177	49	5
178	49	4
179	49	2
180	49	3
181	50	5
182	50	4
183	50	2
184	50	3
193	46	5
194	46	4
195	46	2
196	46	3
201	53	5
202	53	4
203	53	2
204	53	3
205	54	5
206	54	4
207	54	2
208	54	3
209	55	4
210	55	2
211	55	3
212	56	5
213	56	4
214	56	2
215	56	3
216	57	5
217	57	4
218	57	2
219	57	3
220	58	5
221	58	4
222	58	2
223	58	3
224	59	5
225	59	4
226	59	2
227	59	3
228	60	5
229	60	4
230	60	2
231	60	3
232	61	5
233	61	4
234	61	2
235	61	3
236	62	5
237	62	4
238	62	2
239	62	3
240	63	5
241	63	4
242	63	2
243	63	3
244	64	5
245	64	4
246	64	2
247	64	3
248	44	5
249	44	4
250	44	2
251	44	3
252	65	3
253	66	3
254	67	5
255	67	4
256	67	2
257	67	3
258	68	5
259	68	4
260	68	2
261	68	3
262	69	5
263	69	4
264	69	2
265	69	3
266	70	5
267	70	4
268	70	2
269	70	3
270	71	5
271	71	4
272	71	2
273	71	3
274	72	5
275	72	4
276	72	2
277	72	3
278	73	5
279	73	4
280	73	2
281	73	3
286	75	5
287	75	4
288	75	2
289	75	3
290	76	5
291	76	4
292	76	2
293	76	3
294	77	5
295	77	4
296	77	2
297	77	3
298	78	5
299	78	4
300	78	2
301	78	3
302	79	5
303	79	4
304	79	2
305	79	3
306	40	5
307	40	4
308	40	2
309	40	3
310	74	5
311	74	4
312	74	2
313	74	3
314	80	5
315	80	4
316	80	2
317	80	3
322	81	5
323	81	4
324	81	2
325	81	3
326	82	5
327	82	4
328	82	2
329	82	3
330	83	5
331	83	3
332	84	5
333	84	4
334	84	2
335	84	3
338	87	5
339	87	4
340	87	3
345	90	5
346	90	3
347	91	5
348	91	4
349	91	2
350	91	3
351	89	5
352	89	4
353	88	5
354	88	3
355	92	5
356	92	4
357	92	2
358	92	3
359	93	4
360	93	2
361	93	3
362	94	5
363	94	3
364	86	3
365	85	3
366	95	5
367	95	4
368	95	2
369	95	3
370	96	5
371	96	4
372	96	2
373	96	3
374	97	5
375	97	4
376	97	2
377	97	3
378	98	5
379	98	4
384	51	5
385	51	4
386	51	2
387	51	3
392	36	5
393	36	4
394	36	2
395	36	3
396	100	5
397	100	4
398	100	2
399	100	3
400	101	5
401	101	3
402	102	5
403	102	4
404	102	2
405	102	3
406	103	5
407	103	4
408	103	2
409	103	3
410	104	5
411	104	4
412	104	2
413	104	3
\.


--
-- Name: ingredient_allergy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('ingredient_allergy_id_seq', 413, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('ingredients_id_seq', 104, true);


--
-- Data for Name: menues; Type: TABLE DATA; Schema: public; Owner: max
--

COPY menues (id, name, created, people) FROM stdin;
5	FSWE WS1415	2014-11-25 19:05:19	28
6	Fontainebleau	2015-04-26 20:46:44	14
8	Bla	2015-04-29 13:52:39	2
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: max
--

COPY recipes (id, name, image, comment) FROM stdin;
32	Spargelsuppe	\N	
34	Nudeln		\\begin{itemize}\r\n\\item Wasser zum kochen bringen und salzen\r\n\\item Nudeln kochen \r\n\\item Cthulhu beschwören\r\n\\end{itemize}
36	Reis		\\begin{itemize}\r\n\\item Reis in Topf geben. Doppelte Menge Wasser dazu\r\n\\item Etwas durchweichen lassen, dann Wasser zum kochen bringen.\r\n\\item Solange köcheln lassen bis Wasser verdampft/aufgenommen\r\n\\end{itemize}
37	Kürbiscremesuppe		Kartoffeln, Karotten, Schalotten schälen, (Hokkaido) Kürbis nicht. Alles klein würfeln. \r\n \r\n\\begin{itemize}\r\n\\item Öl erhitzen, Schalotten dünsten. Kürbis kurz mit andünsten.\r\n\\item Brühe und Sahne dazugeben, aufkochen und ca. 25 Min. köcheln lassen. Weisswein dazugeben.\r\n\\item Suppe pürieren und ggf. durch ein Sieb gießen.\r\n\\item Würzen\r\n\\end{itemize}\r\nGgf. mit Croutons, Kürbiskernen, Kürbisöl Servieren.
39	Feldsalat		Salat gründlich waschanen. Salatsauce zusammenmischen. Fertig. 
40	Apfelstrudel		
41	FSWE Getränke		
42	Naan		\\begin{itemize}\r\n\\item Milch, ein fünftel Zucker und Hefe verrühren und ca. 20 min stehen lassen.\r\n\\item Mehl, Salz und Backpulver vermischen\r\n\\item Ei und Jughurt jeweils leicht schlagen\r\n\\item Alles verrühren und dann ca. 1-2 Stunde gehen lassen. \r\n\\item Teig ca. 1 cm dick ausrollen und seesam drauf streuen\r\n\\item Backofen möglist heiß vorheizen\r\n\\item ca. 10 min Backen, zwischendurch wenden und fertig backen bis oberseite braun\r\n\\end{itemize}\r\nDannach ggf. mit Butter oder Butterschmalz bepinseln
43	FSWE Frühstück		
35	Erbsen-Pilz-Curry		Pilze in Scheiben schneiden.\r\nChili, Koriander, Knoblauch, Ingwer und Kurkuma mit 2 Esslöffel Wasser im Mixer zu einer glatten Paste verarbeiten und beiseite stellen.\r\nEin Drittel der Erbsen mit 2 Esslöffeln Wasser im Mixer pürieren und auch beiseite stellen.\r\nDas Öl erhitzen und das Cumin (1/4 TL pro Person) 10 Sekunden anrösten, die Pfanne dabei rütteln. Die Pilze 1 Minute im Würzöl braten und wieder herausnehmen. Die Gewürzpaste in die Pfanne geben und 2-3 Minuten rühren. Die restlichen Erbsen, das Erbsenpüree, die Pilze, das Salz, die Sojasahne und 2 Esslöffel Wasser zufügen. Alles behutsam vermischen und bei mittlerer Hitze zugedeckt 3-4 Minuten kochen lassen.\r\n
44	Mandelmilch		\r\nDie Mandeln überbrühen, 10 min ziehen lassen und die Haut abziehen.\r\nEtwa 400 ml Wasser (oder auch alles, wenn es in den Mixer passt) in den Mixer geben und anstellen. Die Mandeln zugeben und gut pürieren. Die Flüssigkeit durch ein Küchentuch gießen und dieses gut ausdrücken.\r\nMit Vanille-Zucker abschmecken.
45	Mandelsahne		\r\nDie Mandeln überbrühen und die Haut abziehen. Aus den Zitronen Saft machen.\r\nAlle Zutaten zusammen in einen Mixer geben und glatt pürieren.\r\n
33	Tomaten-Grappa-Sauce		Aus den Zutaten für Mandelsahne ebensolche herstellen.\r\nAus dem Rest eine Tomatensauce kochen. Den Grappa nicht zum Ablöschen verwenden, sondern nachher zugießen.\r\n\r\n
31	Pilzsauce	\N	Getrocknete Tomaten mit kochendem Wasser überbrühen und weich werden lassen. Steinpilze auch überbrühen, aber in einem anderen Gefäß. Zwiebeln und Knoblauch hacken, Pilze in Scheiben schneiden. Champignons scharf anbraten. Zwiebeln in einer anderen Pfanne anbraten, Knoblauch hinzu und mit dem Wein ablöschen. Champignons und Steinpilze hinzugeben. Getrocknete Tomaten klein hacken und hinzugeben. Mit dem Einweichwasser von den Steinpilzen, dem von den Tomaten (Vorsicht, seeehr salzig) und Pfeffer würzen und köcheln lassen. Sojasahne hinzugeben. Cthulu wieder verbannen.\r\n
46	FSWE Frühstück Vegan		
47	FSWE Fleisch		
30	Gorgonzolasauce	\N	\\begin{itemize}\r\n\\item Speck in einem Topf anbraten. \r\n\\item Sahne dazugeben und zum köcheln bringen. \r\n\\item Knoblauch fein gehackt dazugeben und Gorgonzola etwas kleingewürftelt in der Sahne schmelzen. \r\n\\item Würzen und etwas einkochen lassen.\r\n\\end{itemize}
48	Bleau - Getränke		
49	Tomatensauce		
50	Käse-Sahne-Sauce		
51	Gemüsereis		
52	Foo		\\item Bar\r\n$\\Rightarrow$ bla
53	Bar		
\.


--
-- Data for Name: menue_recipe; Type: TABLE DATA; Schema: public; Owner: max
--

COPY menue_recipe (id, menue, recipe, factor) FROM stdin;
22	5	33	0.425
23	5	30	0.425
24	5	31	0.85
25	5	34	1.7
26	5	39	1.0
27	5	35	1.0
28	5	36	1.0
29	5	37	1.0
30	5	40	1.0
31	5	41	2.0
32	5	42	1.0
33	5	43	2.0
34	5	44	0.2
35	5	46	0.2
36	5	45	1.0
37	5	47	0.4
38	6	48	3.0
39	6	34	1.0
40	6	50	0.5
41	6	49	0.5
42	6	51	1.0
44	8	52	1.0
45	8	53	1.0
\.


--
-- Name: menue_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('menue_recipe_id_seq', 45, true);


--
-- Name: menues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('menues_id_seq', 9, true);


--
-- Data for Name: recipe_allergy; Type: TABLE DATA; Schema: public; Owner: max
--

COPY recipe_allergy (id, recipe, allergy) FROM stdin;
245	46	5
246	46	4
247	46	2
62	32	3
248	46	3
163	36	5
164	36	4
165	36	2
166	36	3
253	33	5
254	33	4
255	33	2
256	33	3
257	30	5
258	30	3
259	41	5
260	41	3
261	47	5
262	47	4
273	48	5
274	48	3
275	49	5
276	49	4
277	49	2
278	49	3
279	50	5
280	50	3
195	37	4
196	37	2
197	37	3
198	39	5
199	39	4
200	39	2
201	39	3
202	40	3
281	51	5
282	51	4
283	51	2
284	51	3
210	42	3
211	35	5
212	35	4
213	35	2
214	35	3
289	52	5
290	52	4
291	52	2
292	52	3
293	53	5
294	53	4
295	53	2
296	53	3
219	44	5
220	44	4
221	44	2
222	44	3
227	45	5
228	45	4
229	45	2
230	45	3
156	34	4
157	34	2
158	34	3
241	31	5
242	31	4
243	31	2
244	31	3
\.


--
-- Name: recipe_allergy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('recipe_allergy_id_seq', 296, true);


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: max
--

COPY recipe_ingredient (id, ingredient, recipe, unit, amount) FROM stdin;
30	15	30	4	120.0
31	16	30	1	120.0
33	18	30	7	1.0
34	19	30	7	1.0
35	20	30	7	1.0
37	21	31	1	30.0
39	22	31	1	10.0
40	24	31	1	200.0
42	27	32	1	50.0
43	25	32	8	0.15
44	26	32	1	12.5
45	28	32	4	25.0
46	29	32	5	0.25
48	21	33	5	0.5
50	31	33	4	5.0
51	32	33	5	0.2
47	30	33	1	275.0
52	33	33	1	35.0
53	34	33	4	50.0
54	36	33	8	0.2
55	37	33	8	0.2
56	41	33	1	40.0
57	42	33	4	5.0
49	14	33	6	0.5
60	19	34	1	5.0
61	45	35	5	0.5
62	46	35	1	15.0
64	47	35	1	15.0
65	48	35	7	1.0
66	49	35	1	200.0
67	42	35	4	5.0
68	50	35	1	0.1
69	24	35	1	60.0
70	19	35	1	3.0
71	51	35	4	20.0
72	13	36	1	80.0
38	14	31	6	0.6
73	51	31	4	65.0
74	53	31	1	10.0
29	14	30	6	1.0
59	12	34	1	150.0
63	14	35	6	0.75
77	56	37	1	10.0
78	57	37	5	0.3
79	58	37	4	15.0
81	42	37	9	0.3
82	51	37	4	30.0
75	54	37	1	150.0
76	55	37	1	40.0
80	59	37	4	150.0
84	19	37	7	1.0
85	39	37	7	1.0
86	20	37	7	1.0
87	37	37	1	5.0
88	60	39	1	80.0
89	61	39	9	2.5
90	31	39	9	0.5
91	62	39	10	1.0
92	63	39	10	0.5
93	64	39	11	0.1
94	19	39	7	1.0
95	39	39	7	1.0
96	65	40	11	0.2
97	66	40	1	20.0
98	67	40	1	15.0
99	63	40	1	28.0
100	68	40	1	2.0
101	69	40	1	34.0
102	70	40	4	2.0
103	71	40	1	220.0
104	72	40	4	10.0
105	73	40	1	10.0
112	79	41	12	2.0
113	28	41	4	500.0
106	74	41	13	1.0
151	17	47	1	50.0
108	75	41	13	0.4
109	76	41	13	0.2
110	77	41	13	0.4
114	80	41	1	27.0
115	26	42	1	85.0
116	28	42	4	25.0
117	63	42	9	0.4
118	81	42	10	0.3
119	82	42	10	0.17
120	42	42	9	0.33
121	83	42	4	25.0
122	29	42	5	0.15
123	19	42	7	1.0
124	84	42	9	0.2
125	85	43	5	2.0
126	86	43	1	50.0
127	87	43	1	25.0
129	89	43	1	30.0
130	90	43	1	20.0
131	91	43	1	20.0
132	92	43	1	10.0
133	93	43	1	45.0
134	94	43	1	180.0
135	29	43	5	1.0
136	40	44	4	500.0
137	41	44	1	100.0
138	44	44	11	0.5
139	41	45	1	45.0
140	42	45	9	0.5
141	43	45	5	0.1
142	19	45	7	1.0
143	44	45	11	0.25
144	63	45	1	10.0
145	95	41	13	0.5
152	98	47	1	75.0
147	58	31	4	25.0
128	88	43	1	75.0
148	97	46	1	20.0
149	67	46	1	25.0
150	96	46	1	50.0
153	74	48	13	1.0
58	43	33	5	0.03
111	78	41	13	0.2
154	77	48	13	0.5
155	75	48	13	0.5
157	79	48	12	1.0
177	14	52	6	5.0
156	80	48	1	12.0
158	28	48	13	0.3
159	30	49	1	200.0
160	33	49	1	30.0
161	21	49	5	0.3
162	42	49	4	5.0
163	14	49	6	0.3
164	100	49	1	50.0
165	56	49	1	50.0
166	15	50	4	120.0
167	16	50	1	50.0
168	101	50	1	50.0
169	14	50	6	0.5
170	13	51	1	80.0
171	100	51	1	100.0
172	102	51	1	50.0
173	103	51	1	80.0
174	33	51	1	50.0
175	14	51	6	0.3
176	21	51	5	0.5
179	14	53	5	10.0
\.


--
-- Name: recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('recipe_ingredient_id_seq', 179, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('recipes_id_seq', 53, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: max
--

--COPY schema_migrations (version) FROM stdin;
--\.


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('units_id_seq', 14, true);


--
-- PostgreSQL database dump complete
--

