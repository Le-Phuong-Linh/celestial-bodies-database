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
    name character varying(40) NOT NULL,
    age_in_billions numeric(4,2),
    stars_amount_in_billions integer,
    year_of_discovery integer,
    distance_to_earth_in_mly numeric(4,2),
    picture_id integer
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
    name character varying(40) NOT NULL,
    radius_in_miles integer,
    planet_id integer,
    visited_by_humans boolean,
    age_in_billions numeric(4,1),
    year_of_discovery integer
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
-- Name: picture; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.picture (
    picture_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    filename text,
    name character varying(40)
);


ALTER TABLE public.picture OWNER TO freecodecamp;

--
-- Name: picture_picture_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.picture_picture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.picture_picture_id_seq OWNER TO freecodecamp;

--
-- Name: picture_picture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.picture_picture_id_seq OWNED BY public.picture.picture_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius_in_miles integer,
    star_id integer,
    has_life boolean,
    year_of_discovery integer,
    age_in_billions numeric(4,1)
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
    radius_in_miles integer,
    year_of_discovery integer,
    age_in_billions numeric(4,1),
    galaxy_id integer,
    name character varying(40) NOT NULL
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
-- Name: picture picture_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.picture ALTER COLUMN picture_id SET DEFAULT nextval('public.picture_picture_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 100, 1610, 0.00, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10.01, 1000, 1612, 2.54, 2);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 0.40, 100, 1773, 23.16, 3);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1.10, 30, 1764, 0.16, 4);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 13.31, 250, 1774, 11.74, 5);
INSERT INTO public.galaxy VALUES (6, 'Seague 1', 0.08, NULL, 2006, 0.19, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1080, 3, true, 4.5, 1609);
INSERT INTO public.moon VALUES (3, 'Iapetus', 456, 6, false, 4.6, 1671);
INSERT INTO public.moon VALUES (4, 'Mimas', 123, 6, false, 4.1, 1789);
INSERT INTO public.moon VALUES (5, 'Tethys', 329, 6, false, 4.6, 1684);
INSERT INTO public.moon VALUES (6, 'Epimetheus', 36, 6, false, 4.0, 1966);
INSERT INTO public.moon VALUES (7, 'Thebe', 30, 5, false, 4.5, 1979);
INSERT INTO public.moon VALUES (8, 'Carme', 14, 5, false, 4.0, 1938);
INSERT INTO public.moon VALUES (9, 'Erriapus', 3, 6, false, 4.0, 2000);
INSERT INTO public.moon VALUES (10, 'Bestla', 2, 6, false, 4.0, 2004);
INSERT INTO public.moon VALUES (11, 'Themisto', 2, 5, false, 4.0, 1975);
INSERT INTO public.moon VALUES (12, 'Paaliaq', 7, 6, false, 4.0, 2000);
INSERT INTO public.moon VALUES (13, 'Europa', 969, 5, false, 4.5, 1610);
INSERT INTO public.moon VALUES (14, 'Titan', 1600, 6, false, 4.0, 1655);
INSERT INTO public.moon VALUES (15, 'Enceladus', 310, 6, false, 1.0, 1789);
INSERT INTO public.moon VALUES (16, 'Hyperion', 84, 6, false, 4.0, 1848);
INSERT INTO public.moon VALUES (17, 'Daphnis', 2, 6, false, 4.0, 2005);
INSERT INTO public.moon VALUES (18, 'Ganymede', 1637, 5, false, 4.5, 1610);
INSERT INTO public.moon VALUES (19, 'Io', 1132, 5, false, 4.5, 1610);
INSERT INTO public.moon VALUES (20, 'Dione', 349, 6, false, 4.0, 1684);
INSERT INTO public.moon VALUES (2, 'Callisto', 1497, 5, false, 4.5, 1610);


--
-- Data for Name: picture; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.picture VALUES (1, 1, 'milky_way.jpg', NULL);
INSERT INTO public.picture VALUES (2, 2, 'andromeda.jpg', NULL);
INSERT INTO public.picture VALUES (3, 3, 'whirlpool.jpg', NULL);
INSERT INTO public.picture VALUES (4, 4, 'magellanic_cloud.jpg', NULL);
INSERT INTO public.picture VALUES (5, 5, 'messier_81.jpg', NULL);
INSERT INTO public.picture VALUES (6, 6, 'seague_1.jpg', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1516, 1, false, 1631, 4.5);
INSERT INTO public.planet VALUES (3, 'Earth', 3963, 1, true, NULL, 4.5);
INSERT INTO public.planet VALUES (4, 'Mars', 2106, 1, false, 1609, 4.6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 43440, 1, false, 1610, 4.6);
INSERT INTO public.planet VALUES (6, 'Saturn', 36184, 1, false, 1610, 4.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 15759, 1, false, 1781, 4.5);
INSERT INTO public.planet VALUES (8, 'Neptune', 15299, 1, false, 1849, 4.5);
INSERT INTO public.planet VALUES (9, 'Venus', 3760, 1, false, 1639, 4.5);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 9501, 7, false, 2011, 4.0);
INSERT INTO public.planet VALUES (11, 'Kepler-69c', 6769, 8, false, 2013, 9.8);
INSERT INTO public.planet VALUES (12, 'Kepler-62F', 5581, 9, false, 2013, 7.0);
INSERT INTO public.planet VALUES (2, 'Imaginary-Planet', 3760, 1, false, 1962, 4.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 435000, 1609, 4.6, 1, 'The Sun');
INSERT INTO public.star VALUES (3, 740000, 1862, 0.2, 1, 'Sirius');
INSERT INTO public.star VALUES (4, 3804000, 2006, 0.7, 1, 'Pollux Star');
INSERT INTO public.star VALUES (5, NULL, 1718, 7.1, 1, 'Arcturus Star');
INSERT INTO public.star VALUES (6, NULL, 1782, 6.4, 1, 'Eye of Taurus');
INSERT INTO public.star VALUES (7, NULL, 1780, 0.1, 1, 'The North Star');
INSERT INTO public.star VALUES (8, 9431, 2013, 4.0, 1, 'Kepler-22');
INSERT INTO public.star VALUES (9, 404550, 2013, 9.8, 1, 'Kepler-69');
INSERT INTO public.star VALUES (10, 276660, 2013, 7.0, 1, 'Kepler-62');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: picture_picture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.picture_picture_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_picture_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_picture_id_key UNIQUE (picture_id);


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
-- Name: picture picture_filename_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.picture
    ADD CONSTRAINT picture_filename_key UNIQUE (filename);


--
-- Name: picture picture_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.picture
    ADD CONSTRAINT picture_pkey PRIMARY KEY (picture_id);


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
-- Name: galaxy galaxy_picture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_picture_id_fkey FOREIGN KEY (picture_id) REFERENCES public.picture(picture_id);


--
-- PostgreSQL database dump complete
--

