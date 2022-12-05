--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    distance_from_earth_m_l_y numeric NOT NULL,
    diameter integer NOT NULL,
    number_stars integer,
    connected boolean,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    mean_distance_from_primary integer NOT NULL,
    gravity numeric NOT NULL,
    temperature integer,
    note text,
    atmosphere boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: other_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_object (
    name character varying(40),
    other_object_id integer NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.other_object OWNER TO freecodecamp;

--
-- Name: other_object_other_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_object_other_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_object_other_object_id_seq OWNER TO freecodecamp;

--
-- Name: other_object_other_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_object_other_object_id_seq OWNED BY public.other_object.other_object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    mass integer NOT NULL,
    teq integer NOT NULL,
    distance_ly numeric,
    atmo_composition text,
    station boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    distance_from_earth_ly numeric NOT NULL,
    mass integer NOT NULL,
    magnitute integer,
    constellation text,
    explored boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_object other_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_object ALTER COLUMN other_object_id SET DEFAULT nextval('public.other_object_other_object_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Ursa Major II', 0.098, 1800, NULL, true, 'satellite of Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Reticulum II', 0.102, 378, NULL, false, 'satellite of Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 0.163, 14000, NULL, true, 'satellite of Milky Way');
INSERT INTO public.galaxy VALUES (6, 'NGC 2403', 9.92, 50000, NULL, false, 'Inner Edge of M81 Group');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0265, 100000, NULL, true, 'home galaxy of earth barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf', 0.078, 10000, NULL, true, 'partial accretion of Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Selene', 384399, 0.165, 220, 'Explored...', true, 1);
INSERT INTO public.moon VALUES (2, 'Io', 421600, 0.18, 130, NULL, true, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 670900, 0.13, 102, NULL, true, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1070000, 0.15, 100, NULL, true, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1882000, 0.13, 134, NULL, true, 5);
INSERT INTO public.moon VALUES (6, 'Mimas', 185200, 0.01, 64, NULL, false, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', 230000, 0.01, 75, NULL, false, 6);
INSERT INTO public.moon VALUES (8, 'Tethys', 294600, 0.01, 64, NULL, false, 6);
INSERT INTO public.moon VALUES (9, 'Dione', 377400, 0.02, 87, NULL, false, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 527108, 0.03, 76, NULL, false, 6);
INSERT INTO public.moon VALUES (11, 'Titan', 1221870, 0.13, 94, NULL, true, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 3560820, 0.02, 130, NULL, false, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 129390, 0.01, 50, NULL, false, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 190900, 0.03, 58, NULL, false, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 366000, 0.02, 61, NULL, false, 7);
INSERT INTO public.moon VALUES (16, 'Titriel', 436300, 0.04, 60, NULL, false, 7);
INSERT INTO public.moon VALUES (17, 'Oberiel', 583500, 0.04, 61, NULL, false, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 354800, 0.08, 38, NULL, true, 8);
INSERT INTO public.moon VALUES (20, 'Ember', 373000, 0.195, 254, 'Explored...', true, 10);
INSERT INTO public.moon VALUES (19, 'Khalifa', 175000, 0.03, 153, NULL, false, 10);


--
-- Data for Name: other_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_object VALUES ('PSR BO531', 1, 'pulsar');
INSERT INTO public.other_object VALUES ('NGC 4889', 2, 'black hole');
INSERT INTO public.other_object VALUES ('APM 08279', 3, 'black hole');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 100, 287, NULL, 'N2, O2, CO2, Ar', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 5, 440, NULL, 'He, Na, K', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 81, 730, NULL, 'CO2, N2, SO2', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 11, 227, NULL, 'CO2, N2, Ar', true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 31800, 152, NULL, 'H2 He', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9500, 134, NULL, 'H2 He', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1450, 76, NULL, 'H2, He, CH4', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 1700, 73, NULL, 'H2, He, CH4', false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 127, 260, 4.25, 'CO2, N2, O2, Ar', true, 2);
INSERT INTO public.planet VALUES (10, 'Teegarden b', 105, 296, 12.58, 'CO2, N2, O2, Ar', true, 8);
INSERT INTO public.planet VALUES (11, 'Teegarden c', 111, 231, 12.58, 'CO2, N2, O2, Ar', false, 8);
INSERT INTO public.planet VALUES (12, 'Trappist-1 d', 30, 290, 39, 'CO2, N2, O2, Ar', false, 7);
INSERT INTO public.planet VALUES (13, 'Trappist-1 e', 77, 262, 39, 'CO2, N2, O2, Ar', true, 7);
INSERT INTO public.planet VALUES (14, 'Trappist-1 f', 93, 232, 39, 'CO2, N2, O2, Ar', true, 7);
INSERT INTO public.planet VALUES (15, 'Trappist-1 g', 115, 204, 39, 'CO2, N2, O2, Ar', false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.2465, 108, 438, 'Centaurus', true, 1);
INSERT INTO public.star VALUES (3, 'Lalande', 8.3044, 39, 1044, 'Ursa Major', true, 1);
INSERT INTO public.star VALUES (4, 'Lacaille', 10.7241, 48, 975, 'Piscis Austrinus', false, 1);
INSERT INTO public.star VALUES (5, 'Wolf-359', 7.8558, 9, 1655, 'Leo', false, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 8.7094, 206, 1134, 'Canis Major', false, 1);
INSERT INTO public.star VALUES (7, 'Trappist-1', 39.5, 9, 1840, 'Aquarius', true, 1);
INSERT INTO public.star VALUES (8, 'Teegarden', 12.497, 9, 1722, 'Aries', true, 1);
INSERT INTO public.star VALUES (1, 'Sun', 0.0000158, 100, 485, NULL, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_object_other_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_object_other_object_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_object other_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_object
    ADD CONSTRAINT other_object_name_key UNIQUE (name);


--
-- Name: other_object other_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_object
    ADD CONSTRAINT other_object_pkey PRIMARY KEY (other_object_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
