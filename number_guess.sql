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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL,
    secret_number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 46, 45);
INSERT INTO public.games VALUES (2, 1, 587, 586);
INSERT INTO public.games VALUES (3, 2, 675, 674);
INSERT INTO public.games VALUES (4, 2, 116, 115);
INSERT INTO public.games VALUES (5, 1, 728, 725);
INSERT INTO public.games VALUES (6, 1, 549, 547);
INSERT INTO public.games VALUES (7, 1, 478, 477);
INSERT INTO public.games VALUES (8, 3, 799, 798);
INSERT INTO public.games VALUES (9, 3, 352, 351);
INSERT INTO public.games VALUES (10, 4, 671, 670);
INSERT INTO public.games VALUES (11, 4, 822, 821);
INSERT INTO public.games VALUES (12, 3, 956, 953);
INSERT INTO public.games VALUES (13, 3, 693, 691);
INSERT INTO public.games VALUES (14, 3, 155, 154);
INSERT INTO public.games VALUES (15, 5, 214, 213);
INSERT INTO public.games VALUES (16, 5, 676, 675);
INSERT INTO public.games VALUES (17, 6, 412, 411);
INSERT INTO public.games VALUES (18, 6, 224, 223);
INSERT INTO public.games VALUES (19, 5, 695, 692);
INSERT INTO public.games VALUES (20, 5, 306, 304);
INSERT INTO public.games VALUES (21, 5, 707, 706);
INSERT INTO public.games VALUES (22, 7, 681, 680);
INSERT INTO public.games VALUES (23, 7, 974, 973);
INSERT INTO public.games VALUES (24, 8, 720, 719);
INSERT INTO public.games VALUES (25, 8, 293, 292);
INSERT INTO public.games VALUES (26, 7, 360, 357);
INSERT INTO public.games VALUES (27, 7, 662, 660);
INSERT INTO public.games VALUES (28, 7, 778, 777);
INSERT INTO public.games VALUES (29, 9, 267, 266);
INSERT INTO public.games VALUES (30, 9, 640, 639);
INSERT INTO public.games VALUES (31, 10, 721, 720);
INSERT INTO public.games VALUES (32, 10, 61, 60);
INSERT INTO public.games VALUES (33, 9, 738, 735);
INSERT INTO public.games VALUES (34, 9, 57, 55);
INSERT INTO public.games VALUES (35, 9, 605, 604);
INSERT INTO public.games VALUES (36, 11, 521, 520);
INSERT INTO public.games VALUES (37, 11, 308, 307);
INSERT INTO public.games VALUES (38, 12, 224, 223);
INSERT INTO public.games VALUES (39, 12, 217, 216);
INSERT INTO public.games VALUES (40, 11, 319, 316);
INSERT INTO public.games VALUES (41, 11, 66, 64);
INSERT INTO public.games VALUES (42, 11, 315, 314);
INSERT INTO public.games VALUES (43, 13, 993, 992);
INSERT INTO public.games VALUES (44, 13, 930, 929);
INSERT INTO public.games VALUES (45, 14, 235, 234);
INSERT INTO public.games VALUES (46, 14, 905, 904);
INSERT INTO public.games VALUES (47, 13, 454, 451);
INSERT INTO public.games VALUES (48, 13, 479, 477);
INSERT INTO public.games VALUES (49, 13, 672, 671);
INSERT INTO public.games VALUES (50, 15, 24, 451);
INSERT INTO public.games VALUES (51, 16, 999, 998);
INSERT INTO public.games VALUES (52, 16, 665, 664);
INSERT INTO public.games VALUES (53, 17, 960, 959);
INSERT INTO public.games VALUES (54, 17, 820, 819);
INSERT INTO public.games VALUES (55, 16, 229, 226);
INSERT INTO public.games VALUES (56, 16, 278, 276);
INSERT INTO public.games VALUES (57, 16, 675, 674);
INSERT INTO public.games VALUES (58, 15, 10, 128);
INSERT INTO public.games VALUES (59, 18, 3, 2);
INSERT INTO public.games VALUES (60, 18, 30, 29);
INSERT INTO public.games VALUES (61, 19, 216, 215);
INSERT INTO public.games VALUES (62, 19, 773, 772);
INSERT INTO public.games VALUES (63, 18, 424, 421);
INSERT INTO public.games VALUES (64, 18, 983, 981);
INSERT INTO public.games VALUES (65, 18, 803, 802);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1719492592493', 2, 116);
INSERT INTO public.users VALUES (1, 'user_1719492592494', 5, 46);
INSERT INTO public.users VALUES (12, 'user_1719493887795', 2, 217);
INSERT INTO public.users VALUES (11, 'user_1719493887796', 5, 66);
INSERT INTO public.users VALUES (4, 'user_1719492606977', 2, 671);
INSERT INTO public.users VALUES (3, 'user_1719492606978', 5, 155);
INSERT INTO public.users VALUES (14, 'user_1719493944202', 2, 235);
INSERT INTO public.users VALUES (6, 'user_1719493045450', 2, 224);
INSERT INTO public.users VALUES (5, 'user_1719493045451', 5, 214);
INSERT INTO public.users VALUES (13, 'user_1719493944203', 5, 454);
INSERT INTO public.users VALUES (8, 'user_1719493071747', 2, 293);
INSERT INTO public.users VALUES (7, 'user_1719493071748', 5, 360);
INSERT INTO public.users VALUES (17, 'user_1719494023951', 2, 820);
INSERT INTO public.users VALUES (10, 'user_1719493810292', 2, 61);
INSERT INTO public.users VALUES (9, 'user_1719493810293', 5, 57);
INSERT INTO public.users VALUES (16, 'user_1719494023952', 5, 229);
INSERT INTO public.users VALUES (15, 'pepe', 2, 10);
INSERT INTO public.users VALUES (19, 'user_1719494606697', 2, 216);
INSERT INTO public.users VALUES (18, 'user_1719494606698', 5, 3);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 65, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

