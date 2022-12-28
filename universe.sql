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

ASET default_tablespace = '';


SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy ( galaxy_id integer NOT NULL,
                                               name character varying(40) NOT NULL,
                                                                          number_of_planets integer NOT NULL,
                                                                                                    number_of_stars integer, number_of_moons integer);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_details; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_details ( galaxy_id integer NOT NULL,
                                                       star_id integer NOT NULL,
                                                                       planet_id integer NOT NULL,
                                                                                         moon_id integer NOT NULL,
                                                                                                         name character varying(40),
                                                                                                                        galaxy_details_id integer NOT NULL);

LTER TABLE public.galaxy_details OWNER TO freecodecamp;

--
-- Name: galaxy_details_galaxy_details_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_details_galaxy_details_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.galaxy_details_galaxy_details_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_details_galaxy_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_details_galaxy_details_id_seq OWNED BY public.galaxy_details.galaxy_details_id;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon ( moon_id integer NOT NULL,
                                           name character varying(40) NOT NULL,
                                                                      distance_to_the_planet_ua numeric(10,5) NOT NULL,
                                                                                                              planet_id integer, comments text);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet ( planet_id integer NOT NULL,
                                               name character varying(40) NOT NULL,
                                                                          number_of_moons integer NOT NULL,
                                                                                                  more_than_one_moon boolean NOT NULL,
                                                                                                                             star_id integer);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star ( star_id integer NOT NULL,
                                           name character varying(40) NOT NULL,
                                                                      description text, is_it_clese_to_a_planet boolean NOT NULL,
                                                                                                                        galaxy_id integer);


ALTER TABLE public.star OWNER TO freecodecamp;

--
 --
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);

--
-- Name: galaxy_details galaxy_details_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
 ATER TABLE ONLY public.galaxy_details
ALTER COLUMN galaxy_details_id
SET DEFAULT nextval('public.galaxy_details_galaxy_details_id_seq'::regclass);

L ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy
VALUES (1,
        'galaxy 2',
        10000,
        1000,
        1000);


INSERT INTO public.galaxy
VALUES (2,
        'galaxy 3',
        1000,
        1000,
        1000);


INSERT INTO public.galaxy
VALUES (3,
        'the milky Way',
        100,
        100000,
        100000);


INSERT INTO public.galaxy
VALUES (4,
        'galaxy 4',
        10000,
        1000,
        1000);


INSERT INTO public.galaxy
VALUES (5,
        'galaxy 5',
        10000,
        1000,
        1000);


INSERT INTO public.galaxy
VALUES (6,
        'galaxy 6',
        10000,
        1000,
        1000);

--
-- Data for Name: galaxy_details; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_details
VALUES (3,
        1,
        4,
        1,
        'The milky Way',
        1);


INSERT INTO public.galaxy_details
VALUES (4,
        1,
        4,
        1,
        'i have no idea',
        2);


INSERT INTO public.galaxy_details
VALUES (2,
        1,
        4,
        1,
        'i have no idea 2',
        6);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon
VALUES (1,
        'The moon',
        38440.00000,
        4,
        'is wonderful');


INSERT INTO public.moon
VALUES (3,
        'The moon 2',
        38440.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (4,
        'The moon 2',
        38440.13000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (5,
        'The moon 2',
        38440.13330,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (6,
        'The moon 2',
        384.13330,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (7,
        'The moon 2',
        384.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (8,
        'The moon 2',
        3814.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (10,
        'The moon 2',
        38014.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (11,
        'The moon 2',
        3801.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (12,
        'The moon 2',
        1201.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (13,
        'The moon 2',
        1301.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (14,
        'The moon 2',
        1401.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (15,
        'The moon 2',
        1501.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (16,
        'The moon 2',
        1601.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (17,
        'The moon 2',
        1701.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (18,
        'The moon 2',
        1801.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (19,
        'The moon 2',
        1901.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (20,
        'The moon 2',
        2001.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (21,
        'The moon 2',
        2101.10000,
        1,
        'is wonderful');


INSERT INTO public.moon
VALUES (22,
        'last moon',
        200.00000,
        2,
        'I have finished');

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet
VALUES (1,
        'Mescury',
        0,
        false,
        1);


INSERT INTO public.planet
VALUES (2,
        'Mercury',
        0,
        false,
        1);


INSERT INTO public.planet
VALUES (3,
        'Venus',
        0,
        false,
        1);


INSERT INTO public.planet
VALUES (4,
        'Earth',
        1,
        false,
        1);


INSERT INTO public.planet
VALUES (5,
        'Mars',
        2,
        true,
        1);


INSERT INTO public.planet
VALUES (6,
        'Jupiter',
        79,
        true,
        1);


INSERT INTO public.planet
VALUES (7,
        'Saturn',
        53,
        true,
        3);


INSERT INTO public.planet
VALUES (8,
        'Uranus',
        27,
        true,
        3);


INSERT INTO public.planet
VALUES (10,
        'Neptune',
        14,
        true,
        2);


INSERT INTO public.planet
VALUES (11,
        'Pluto',
        3,
        true,
        2);


INSERT INTO public.planet
VALUES (12,
        'planet x',
        0,
        false,
        1);


INSERT INTO public.planet
VALUES (45,
        'Areca',
        0,
        false,
        2);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star
VALUES (1,
        'Altar',
        'is a wonderful star',
        true,
        3);


INSERT INTO public.star
VALUES (2,
        'Andromeda',
        'is a wonderful star',
        true,
        3);


INSERT INTO public.star
VALUES (3,
        'Aquarius',
        'is a wonderful star',
        true,
        3);


INSERT INTO public.star
VALUES (4,
        'Archer',
        'good look',
        false,
        3);


INSERT INTO public.star
VALUES (5,
        'Arrow',
        'good look',
        false,
        3);


INSERT INTO public.star
VALUES (6,
        'Balance',
        'good look',
        false,
        3);

--
-- Name: galaxy_details_galaxy_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_details_galaxy_details_id_seq', 6, true);

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 45, true);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

--
-- Name: galaxy_details galaxy_details_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details ADD CONSTRAINT galaxy_details_name_key UNIQUE (name);

--
-- Name: galaxy_details galaxy_details_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details ADD CONSTRAINT galaxy_details_pkey PRIMARY KEY (galaxy_details_id);

--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);

--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_name_key UNIQUE (name);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: moon moon_distance_to_the_planet_ua_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_distance_to_the_planet_ua_key UNIQUE (distance_to_the_planet_ua);

--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);

--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_planet_name_key UNIQUE (name);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_star_id_key UNIQUE (star_id);

--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_star_name_key UNIQUE (name);

--
-- Name: galaxy_details galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details ADD CONSTRAINT galaxy_id_fkey
FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- Name: galaxy_details moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details ADD CONSTRAINT moon_id_fkey
FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_planet_id_fkey
FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: galaxy_details planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details ADD CONSTRAINT planet_id_fkey
FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_star_id_fkey
FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_galaxy_id_fkey
FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- Name: galaxy_details star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details ADD CONSTRAINT star_id_fkey
FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- PostgreSQL database dump complete
--
