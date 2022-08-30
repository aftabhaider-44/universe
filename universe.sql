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
    name character varying,
    abbrevation text,
    galaxy_type character varying NOT NULL,
    stars_in_galaxy character varying
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
    name character varying,
    planet_id integer,
    gravity_meter_per_second_square numeric NOT NULL,
    size_in_miles numeric
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    contains_moon integer NOT NULL
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
-- Name: small_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.small_bodies (
    name character varying NOT NULL,
    about text,
    present_in_numbers integer,
    small_bodies_id integer NOT NULL
);


ALTER TABLE public.small_bodies OWNER TO freecodecamp;

--
-- Name: small_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.small_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.small_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: small_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.small_bodies_id_seq OWNED BY public.small_bodies.small_bodies_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    galaxy_id integer,
    distance_from_earth character varying,
    constellation character varying NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: small_bodies small_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_bodies ALTER COLUMN small_bodies_id SET DEFAULT nextval('public.small_bodies_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'MW', 'Spiral Galaxy', '100 thousand million');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'AG', 'Spiral Galaxy', '1 Trillion');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Virgo A', 'Elliptical Galaxy', '1 Trillion');
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'LMC', 'Irregular Galaxies', '30 Billion');
INSERT INTO public.galaxy VALUES (6, 'Maffei I', 'MI', 'Elliptical Galaxy', 'Billions of');
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Cyg', 'Elliptical Galaxy', 'Hundred');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth moon', 1, 1.622, 1079.57);
INSERT INTO public.moon VALUES (2, 'Deimos', 2, 0.003, 3.85);
INSERT INTO public.moon VALUES (3, 'Phobos', 2, 0.0057, 7.00);
INSERT INTO public.moon VALUES (4, 'Callisto', 3, 1.236, 1497.67);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1.315, 969.83);
INSERT INTO public.moon VALUES (6, 'Ganymeda', 3, 1.428, 1636.75);
INSERT INTO public.moon VALUES (7, 'Io', 3, 1.796, 1131.88);
INSERT INTO public.moon VALUES (8, 'Ariel', 5, 0.249, 719.42);
INSERT INTO public.moon VALUES (9, 'Oberon', 5, 0.354, 473.11);
INSERT INTO public.moon VALUES (10, 'Puck', 5, 0.028, 50.33);
INSERT INTO public.moon VALUES (11, 'Titlania', 5, 0.367, 489.88);
INSERT INTO public.moon VALUES (12, 'Proteus', 7, 0.07, 130.48);
INSERT INTO public.moon VALUES (13, 'Naiad', 7, 0.012, 20.50);
INSERT INTO public.moon VALUES (14, 'Triton', 7, 0.779, 1681.92);
INSERT INTO public.moon VALUES (15, 'Nereid', 7, 0.071, 105.63);
INSERT INTO public.moon VALUES (16, 'Enceladus', 8, 0.113, 313.29);
INSERT INTO public.moon VALUES (17, 'Calypso', 8, 0.001, 6.64);
INSERT INTO public.moon VALUES (18, 'Methone', 8, 0.00023, 0.900);
INSERT INTO public.moon VALUES (19, 'Charon', 9, 0.288, 376.55);
INSERT INTO public.moon VALUES (20, 'Nix', 9, 0.000163, 30.94);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, false, 79);
INSERT INTO public.planet VALUES (4, 'Venus', 1, false, true, 0);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, false, true, 27);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, false, 0);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, false, false, 14);
INSERT INTO public.planet VALUES (8, 'Saturn', 1, false, false, 82);
INSERT INTO public.planet VALUES (9, 'Pluto(dwarf)', 1, false, false, 5);
INSERT INTO public.planet VALUES (10, 'Eris(dwarf)', 1, false, true, 1);
INSERT INTO public.planet VALUES (11, 'Ceres(dwarf)', 1, true, true, 0);
INSERT INTO public.planet VALUES (12, 'Haumea(dwarf)', 1, false, false, 2);


--
-- Data for Name: small_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.small_bodies VALUES ('Asteroids', 'Aseroids are metallic or roocky bodies with no atmosphere', 26115, 1);
INSERT INTO public.small_bodies VALUES ('Comets', 'Comets are cosmic snowballs of frozen gases and rock and dust that orbit the sun', 4584, 2);
INSERT INTO public.small_bodies VALUES ('Meteors', 'A meteor is a streak of light in the sky caused by a meteoroid crashing through Earth atmosphere', 17000, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, '149.6 million KM', 'No');
INSERT INTO public.star VALUES (2, 'Sirius', 1, '8.611 Light Year', 'Canis Major');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, '149.6 million KM', 'Orion');
INSERT INTO public.star VALUES (4, 'Vega', 1, '25.05 Light Years', 'Lyra');
INSERT INTO public.star VALUES (5, 'Alpharatz', 2, '96.87 Light Years', 'Andromeda');
INSERT INTO public.star VALUES (6, 'Mirach', 2, '199 Light Years', 'Andromeda');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: small_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.small_bodies_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: small_bodies small_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_bodies
    ADD CONSTRAINT small_bodies_pkey PRIMARY KEY (small_bodies_id);


--
-- Name: small_bodies small_bodies_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_bodies
    ADD CONSTRAINT small_bodies_type_key UNIQUE (name);


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

