--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: result; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE result (
    goals_against integer,
    id character varying(50) NOT NULL,
    team character varying(50),
    rev character varying(50),
    goals_for integer,
    points integer,
    goal_diff integer,
    draw integer,
    loss integer,
    games integer,
    win integer
);


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: -
--

COPY result (goals_against, id, team, rev, goals_for, points, goal_diff, draw, loss, games, win) FROM stdin;
3	Afghanistan	Afghanistan	\N	1	2	-2	1	1	2	0
11	Albania	Albania	\N	9	20	-2	2	5	10	3
9	Algeria	Algeria	\N	16	31	7	1	3	9	5
1	American Samoa	American Samoa	\N	0	0	-1	0	1	1	0
30	Andorra	Andorra	\N	0	0	-30	0	10	10	0
6	Angola	Angola	\N	8	14	2	4	1	6	1
2	Anguilla	Anguilla	\N	0	0	-2	0	1	1	0
9	Antigua and Barbuda	Antigua and Barbuda	\N	3	3	-6	0	3	3	0
21	Argentina	Argentina	\N	47	92	26	5	3	23	15
12	Armenia	Armenia	\N	10	19	-2	1	5	9	3
2	Aruba	Aruba	\N	4	6	2	0	0	1	1
20	Australia	Australia	\N	25	48	5	4	5	16	7
10	Austria	Austria	\N	17	27	7	2	3	9	4
10	Azerbaijan	Azerbaijan	\N	6	14	-4	5	3	9	1
0	Bahamas	Bahamas	\N	6	6	6	0	0	1	1
7	Bahrain	Bahrain	\N	13	15	6	3	1	6	2
4	Bangladesh	Bangladesh	\N	5	12	1	1	1	4	2
10	Barbados	Barbados	\N	2	2	-8	0	5	5	0
16	Belarus	Belarus	\N	7	11	-9	1	6	8	1
7	Belgium	Belgium	\N	23	58	16	2	1	14	11
13	Belize	Belize	\N	15	23	2	1	3	7	3
9	Benin	Benin	\N	8	16	-1	2	2	6	2
6	Bermuda	Bermuda	\N	8	18	2	1	1	5	3
30	Bolivia	Bolivia	\N	17	28	-13	6	8	16	2
5	Bosnia-Herzegovina	Bosnia-Herzegovina	\N	17	23	12	1	2	7	4
4	Botswana	Botswana	\N	7	14	3	1	1	4	2
15	Brazil	Brazil	\N	13	25	-2	1	2	7	4
9	Bulgaria	Bulgaria	\N	14	23	5	3	3	9	3
1	Burkina Faso	Burkina Faso	\N	1	4	0	0	1	2	1
3	Burundi	Burundi	\N	2	3	-1	1	1	2	0
2	Cambodia	Cambodia	\N	4	6	2	0	0	1	1
12	Cameroon	Cameroon	\N	9	21	-3	0	4	8	4
11	Canada	Canada	\N	14	29	3	2	2	9	5
3	Cape Verde	Cape Verde	\N	0	0	-3	0	1	1	0
1	Cayman Islands	Cayman Islands	\N	0	0	-1	0	1	1	0
5	Central African Republic	Central African Republic	\N	2	2	-3	0	2	2	0
2	Chad	Chad	\N	2	5	0	0	1	2	1
31	Chile	Chile	\N	36	69	5	1	8	20	11
9	China	China	\N	23	30	14	0	3	8	5
17	Colombia	Colombia	\N	39	77	22	3	5	21	13
5	Comoros	Comoros	\N	1	1	-4	0	2	2	0
2	Congo-Brazzaville	Congo-Brazzaville	\N	2	4	0	2	0	2	0
4	Congo-Kinshasa	Congo-Kinshasa	\N	4	8	0	1	2	4	1
5	Cook Islands	Cook Islands	\N	3	3	-2	0	2	2	0
10	Costa Rica	Costa Rica	\N	14	25	4	3	3	9	3
15	Croatia	Croatia	\N	18	37	3	2	5	13	6
10	Cuba	Cuba	\N	1	2	-9	1	5	6	0
2	Curaçao	Curaçao	\N	2	3	0	1	0	1	0
15	Cyprus	Cyprus	\N	4	9	-11	2	7	10	1
3	Czech Republic	Czech Republic	\N	9	18	6	1	1	5	3
8	Côte d'Ivoire	Côte d'Ivoire	\N	11	17	3	1	2	5	2
12	Denmark	Denmark	\N	14	24	2	4	2	9	3
8	Djibouti	Djibouti	\N	0	0	-8	0	2	2	0
11	Dominica	Dominica	\N	0	0	-11	0	4	4	0
1	Dominican Republic	Dominican Republic	\N	5	11	4	0	0	2	2
2	East Timor	East Timor	\N	1	1	-1	0	1	1	0
19	Ecuador	Ecuador	\N	23	51	4	5	6	19	8
7	Egypt	Egypt	\N	16	32	9	0	0	6	6
5	El Salvador	El Salvador	\N	6	12	1	0	1	3	2
8	England	England	\N	25	38	17	4	2	11	5
5	Equatorial Guinea	Equatorial Guinea	\N	2	2	-3	0	2	2	0
4	Eritrea	Eritrea	\N	2	3	-2	1	1	2	0
20	Estonia	Estonia	\N	6	13	-14	1	7	10	2
4	Ethiopia	Ethiopia	\N	10	21	6	1	1	6	4
16	Faroe Islands	Faroe Islands	\N	1	1	-15	0	5	5	0
9	Finland	Finland	\N	5	14	-4	3	3	8	2
9	France	France	\N	25	49	16	3	2	13	8
4	Gabon	Gabon	\N	5	11	1	1	1	4	2
8	Gambia	Gambia	\N	4	8	-4	1	3	5	1
10	Georgia	Georgia	\N	3	8	-7	2	5	8	1
14	Germany	Germany	\N	50	79	36	2	0	15	13
9	Ghana	Ghana	\N	22	33	13	1	3	9	5
5	Greece	Greece	\N	13	42	8	2	1	12	9
12	Grenada	Grenada	\N	6	9	-6	1	3	5	1
8	Guatemala	Guatemala	\N	23	43	15	1	1	9	7
8	Guinea	Guinea	\N	12	19	4	1	2	6	3
1	Guinea-Bissau	Guinea-Bissau	\N	0	0	-1	0	1	1	0
18	Guyana	Guyana	\N	12	25	-6	1	4	9	4
3	Haiti	Haiti	\N	10	14	7	1	0	3	2
21	Honduras	Honduras	\N	26	47	5	5	5	17	7
5	Hongkong	Hongkong	\N	0	0	-5	0	1	1	0
20	Hungary	Hungary	\N	21	34	1	2	3	10	5
15	Iceland	Iceland	\N	17	33	2	2	3	10	5
2	India	India	\N	2	3	0	1	0	1	0
30	Indonesia	Indonesia	\N	8	11	-22	1	6	8	1
8	Iran	Iran	\N	29	55	21	5	3	17	9
12	Iraq	Iraq	\N	20	40	8	3	6	16	7
16	Ireland	Ireland	\N	12	23	-4	2	4	9	3
14	Israel	Israel	\N	17	25	3	5	2	9	2
12	Italy	Italy	\N	21	45	9	3	2	12	7
14	Jamaica	Jamaica	\N	14	27	0	5	4	12	3
11	Japan	Japan	\N	31	50	20	4	3	15	8
25	Jordan	Jordan	\N	29	50	4	3	6	17	8
20	Kazakhstan	Kazakhstan	\N	5	9	-15	1	7	9	1
5	Kenya	Kenya	\N	11	22	6	3	2	8	3
6	Kuwait	Kuwait	\N	10	21	4	2	1	6	3
7	Kyrgyzstan	Kyrgyzstan	\N	0	0	-7	0	2	2	0
17	Laos	Laos	\N	5	5	-12	0	3	3	0
16	Latvia	Latvia	\N	9	17	-7	2	5	9	2
15	Lebanon	Lebanon	\N	15	32	0	3	5	13	5
18	Lesotho	Lesotho	\N	7	16	-11	3	3	8	2
10	Liberia	Liberia	\N	4	8	-6	1	4	6	1
3	Libya	Libya	\N	5	13	2	2	1	5	2
21	Liechtenstein	Liechtenstein	\N	3	5	-18	2	7	9	0
8	Lithuania	Lithuania	\N	9	20	1	2	4	9	3
25	Luxembourg	Luxembourg	\N	6	11	-19	2	6	9	1
13	Macao	Macao	\N	1	1	-12	0	2	2	0
16	Macedonia	Macedonia	\N	7	14	-9	1	7	10	2
1	Madagascar	Madagascar	\N	2	5	1	0	0	1	1
5	Malawi	Malawi	\N	4	11	-1	4	1	6	1
10	Malaysia	Malaysia	\N	8	12	-2	1	2	4	1
5	Maldives	Maldives	\N	0	0	-5	0	2	2	0
7	Mali	Mali	\N	7	15	0	2	2	6	2
25	Malta	Malta	\N	4	7	-21	0	8	9	1
9	Mexico	Mexico	\N	22	50	13	6	2	16	8
17	Moldova	Moldova	\N	10	16	-7	2	5	9	2
2	Mongolia	Mongolia	\N	1	4	-1	0	1	2	1
17	Montenegro	Montenegro	\N	12	24	-5	3	3	9	3
8	Montserrat	Montserrat	\N	3	3	-5	0	2	2	0
7	Morocco	Morocco	\N	8	16	1	2	1	5	2
11	Mozambique	Mozambique	\N	7	15	-4	3	3	8	2
5	Myanmar	Myanmar	\N	2	5	-3	0	3	4	1
4	Namibia	Namibia	\N	10	19	6	2	3	8	3
11	Nepal	Nepal	\N	3	7	-8	1	1	3	1
16	Netherlands	Netherlands	\N	55	90	39	1	1	17	15
0	New Caledonia	New Caledonia	\N	4	6	4	0	0	1	1
0	New Zealand	New Zealand	\N	2	5	2	0	0	1	1
7	Nicaragua	Nicaragua	\N	5	11	-2	0	2	4	2
7	Niger	Niger	\N	6	10	-1	1	2	4	1
8	Nigeria	Nigeria	\N	10	26	2	4	2	10	4
3	North Korea	North Korea	\N	1	2	-2	1	2	3	0
9	Northern Ireland	Northern Ireland	\N	4	6	-5	2	3	5	0
13	Norway	Norway	\N	10	22	-3	3	4	10	3
16	Oman	Oman	\N	14	36	-2	4	5	15	6
3	Pakistan	Pakistan	\N	0	1	-3	1	1	2	0
4	Palestine	Palestine	\N	5	10	1	2	1	4	1
14	Panama	Panama	\N	31	58	17	7	3	18	8
31	Paraguay	Paraguay	\N	17	28	-14	3	10	16	3
26	Peru	Peru	\N	17	32	-9	3	9	16	4
5	Philippines	Philippines	\N	5	7	0	0	2	3	1
11	Poland	Poland	\N	13	21	2	4	3	9	2
12	Portugal	Portugal	\N	18	39	6	3	2	11	6
0	Puerto Rico	Puerto Rico	\N	0	1	0	1	0	1	0
18	Qatar	Qatar	\N	18	37	0	5	5	15	5
12	Romania	Romania	\N	19	36	7	1	3	10	6
7	Russia	Russia	\N	22	43	15	3	2	12	7
13	Rwanda	Rwanda	\N	7	13	-6	3	4	8	1
4	Saint Kitts and Nevis	Saint Kitts and Nevis	\N	0	0	-4	0	1	1	0
8	Saint Lucia	Saint Lucia	\N	3	3	-5	0	2	2	0
6	Saint Vincent and the Grenadines	Saint Vincent and the Grenadines	\N	2	4	-4	2	1	3	0
3	Samoa	Samoa	\N	5	12	2	1	0	3	2
25	San Marino	San Marino	\N	0	0	-25	0	5	5	0
4	Saudi Arabia	Saudi Arabia	\N	7	10	3	2	1	4	1
12	Scotland	Scotland	\N	8	19	-4	2	5	10	3
4	Senegal	Senegal	\N	9	21	5	3	0	6	3
11	Serbia	Serbia	\N	18	27	7	2	4	10	4
7	Seychelles	Seychelles	\N	0	0	-7	0	2	2	0
2	Sierra Leone	Sierra Leone	\N	1	1	-1	0	1	1	0
24	Singapore	Singapore	\N	8	10	-16	1	6	8	1
10	Slovakia	Slovakia	\N	10	20	0	4	3	9	2
11	Slovenia	Slovenia	\N	14	28	3	0	5	10	5
2	Solomon Islands	Solomon Islands	\N	0	0	-2	0	1	1	0
5	Somalia	Somalia	\N	0	1	-5	1	1	2	0
3	South Africa	South Africa	\N	2	3	-1	1	1	2	0
9	South Korea	South Korea	\N	10	16	1	4	2	7	1
10	Spain	Spain	\N	18	40	8	2	2	11	7
4	Sri Lanka	Sri Lanka	\N	0	0	-4	0	1	1	0
11	Sudan	Sudan	\N	7	12	-4	2	3	6	1
6	Suriname	Suriname	\N	3	6	-3	0	2	3	1
3	Swaziland	Swaziland	\N	1	1	-2	0	1	1	0
13	Sweden	Sweden	\N	17	33	4	2	2	9	5
13	Switzerland	Switzerland	\N	24	53	11	3	2	14	9
6	Syria	Syria	\N	0	0	-6	0	2	2	0
6	Tahiti	Tahiti	\N	2	5	-4	0	2	3	1
4	Taiwan	Taiwan	\N	4	7	0	0	1	2	1
17	Tajikistan	Tajikistan	\N	7	14	-10	1	4	7	2
12	Tanzania	Tanzania	\N	10	19	-2	0	4	7	3
7	Thailand	Thailand	\N	7	15	0	2	3	7	2
9	Togo	Togo	\N	5	12	-4	1	3	6	2
2	Tonga	Tonga	\N	3	7	1	1	0	2	1
4	Trinidad and Tobago	Trinidad and Tobago	\N	4	7	0	0	2	3	1
2	Tunisia	Tunisia	\N	8	17	6	0	0	3	3
9	Turkey	Turkey	\N	16	30	7	1	4	10	5
5	Turkmenistan	Turkmenistan	\N	4	5	-1	1	1	2	0
6	Turks and Caicos Islands	Turks and Caicos Islands	\N	0	0	-6	0	1	1	0
6	US Virgin Islands	US Virgin Islands	\N	0	0	-6	0	1	1	0
6	Uganda	Uganda	\N	5	13	-1	2	2	6	2
4	Ukraine	Ukraine	\N	20	31	16	3	1	9	5
7	United Arab Emirates	United Arab Emirates	\N	4	5	-3	1	2	3	0
11	United States	United States	\N	11	22	0	2	3	8	3
31	Uruguay	Uruguay	\N	29	57	-2	4	7	20	9
7	Uzbekistan	Uzbekistan	\N	26	57	19	4	1	15	10
20	Venezuela	Venezuela	\N	14	34	-6	5	6	16	5
5	Vietnam	Vietnam	\N	15	17	10	0	1	4	3
20	Wales	Wales	\N	9	19	-11	1	6	10	3
2	Yemen	Yemen	\N	0	1	-2	1	1	2	0
7	Zambia	Zambia	\N	8	15	1	2	2	6	2
9	Zimbabwe	Zimbabwe	\N	4	6	-5	2	4	6	0
\.


--
-- Name: pk_result; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY result
    ADD CONSTRAINT pk_result PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM brett;
GRANT ALL ON SCHEMA public TO brett;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

