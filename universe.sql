--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    number_of_stars integer NOT NULL,
    area_in_square_degrees numeric NOT NULL,
    visible_from_earth boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    distance_from_earth integer NOT NULL,
    galaxy_types character varying(50) NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    moon_types character varying(50)
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
    name character varying(100) NOT NULL,
    star_id integer,
    is_spherical boolean NOT NULL,
    planet_types character varying(50),
    distance_from_star numeric NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    star_types character varying(50)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orión', 'Constelación famosa por su caza', 80, 594, true);
INSERT INTO public.constellation VALUES (2, 'Casiopea', 'Constelación en forma de W', 50, 598, true);
INSERT INTO public.constellation VALUES (3, 'La Osa Mayor', 'Constelación que contiene la estrella polar', 100, 1280, true);
INSERT INTO public.constellation VALUES (4, 'Escorpio', 'Constelación con forma de escorpión', 40, 497, true);
INSERT INTO public.constellation VALUES (5, 'Cenit', 'Constelación del sur', 30, 903, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Nuestra galaxia', 0, 'Espiral');
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Galaxia cercana', 2500000, 'Espiral');
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 'Galaxia irregular', 3000000, 'Irregular');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Galaxia activa', 12000000, 'Elíptica');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxia con forma de sombrero', 10000000, 'Espiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Galaxia en colisión', 23000000, 'Espiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, true, 4500, 'Terrestre');
INSERT INTO public.moon VALUES (2, 'Fobos', 9, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (3, 'Deimos', 9, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (4, 'Europa', 5, false, 4500, 'Gélido');
INSERT INTO public.moon VALUES (5, 'Ganimedes', 5, false, 4500, 'Gélido');
INSERT INTO public.moon VALUES (6, 'Calisto', 5, false, 4500, 'Gélido');
INSERT INTO public.moon VALUES (7, 'Titan', 6, true, 4500, 'Gélido');
INSERT INTO public.moon VALUES (8, 'Rhea', 6, false, 4500, 'Gélido');
INSERT INTO public.moon VALUES (9, 'Jápeto', 6, false, 4500, 'Gélido');
INSERT INTO public.moon VALUES (10, 'Miranda', 7, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (11, 'Ariel', 7, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (12, 'Umbriel', 7, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (13, 'Tritón', 8, true, 4500, 'Gélido');
INSERT INTO public.moon VALUES (14, 'Nereida', 8, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (15, 'Proteo', 8, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (16, 'Charon', 9, true, 4500, 'Irregular');
INSERT INTO public.moon VALUES (17, 'Dactyl', 9, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (18, 'Haumea I', 11, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (19, 'Haumea II', 11, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (20, 'Haumea III', 11, false, 4500, 'Irregular');
INSERT INTO public.moon VALUES (21, 'Haumea IV', 11, false, 4500, 'Irregular');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, true, 'Terrestre', 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, true, 'Terrestre', 0.72);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, true, 'Terrestre', 1.00);
INSERT INTO public.planet VALUES (4, 'Marte', 1, true, 'Terrestre', 1.52);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, true, 'Gaseoso', 5.20);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, true, 'Gaseoso', 9.58);
INSERT INTO public.planet VALUES (7, 'Urano', 1, true, 'Gaseoso', 19.22);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, true, 'Gaseoso', 30.05);
INSERT INTO public.planet VALUES (9, 'Plutón', 1, true, 'Enano', 39.48);
INSERT INTO public.planet VALUES (10, 'Eris', 1, true, 'Enano', 96.36);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, true, 'Enano', 2.77);
INSERT INTO public.planet VALUES (13, 'Haumea', 1, true, 'Enano', 43.43);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, true, 4600, 'Enana amarilla');
INSERT INTO public.star VALUES (2, 'Sirius', 1, false, 200, 'Enana blanca');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, false, 10000, 'Supergigante roja');
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, true, 4500, 'Enana amarilla');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, true, 4500, 'Enana roja');
INSERT INTO public.star VALUES (6, 'Rigel', 1, false, 800000, 'Supergigante azul');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

