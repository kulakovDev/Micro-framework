--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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

--
-- Name: delete_book(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_book() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM book WHERE id = OLD.book_id;
    DELETE FROM author WHERE id = OLD.author_id;
    RETURN OLD;
END;
    $$;


ALTER FUNCTION public.delete_book() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.author ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    description text NOT NULL,
    image_cdn_id character varying(255) NOT NULL,
    genre json NOT NULL,
    isbn bigint NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_author (
    id integer NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL,
    created_at date DEFAULT '2024-04-18'::date NOT NULL
);


ALTER TABLE public.book_author OWNER TO postgres;

--
-- Name: book_genre_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.book_author ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.book_genre_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.book ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, first_name, last_name) FROM stdin;
45	Joan	Rowling
46	Joan	Rowling
47	Joan	Rowling
48	Joan	Rowling
49	Joan	Rowling
50	Joan	Rowling
51	Joan	Rowling
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, title, year, description, image_cdn_id, genre, isbn) FROM stdin;
53	Harry Potter and he Philosopher's Stone	1997	It is a story about Harry Potter, an orphan brought up by his aunt and uncle because his parents were killed when he was a baby. Harry is unloved by his uncle and aunt but everything changes when he is invited to join Hogwarts School of Witchcraft and Wizardry and he finds out he's a wizard.\r\n                    	ed22e2e9-2f0b-4b6f-b0d6-a1b0e2dcc5a6	["fantasy","adventure"]	3234567891234
54	Harry Potter and the Chamber of Secrets	1998	Harry Potter and the Chamber of Secrets is a fantasy novel written by British author J. K. Rowling and the second novel in the Harry Potter series. The plot follows Harry's second year at Hogwarts School of Witchcraft and Wizardry, during which a series of messages on the walls of the school's corridors warn that the "Chamber of Secrets" has been opened and that the "heir of Slytherin" would kill all pupils who do not come from all-magical families. These threats are found after attacks that leave residents of the school petrified. Throughout the year, Harry and his friends Ron and Hermione investigate the attacks. The book was published in the United Kingdom on 2 July 1998 by Bloomsbury and later in the United States on 2 June 1999 by Scholastic Inc.\r\n                    	4a86ce3d-0ee1-4ff8-bb03-c3d5d2a2e2e1	["fantasy","adventure","documentary"]	234567891234
55	Harry Potter and the Prisoner of Azkaban	1997	Harry Potter & The Prisoner of Azkaban is about Harry’s 3rd year at Hogwarts. Along with friends Ron and Hermione, Harry investigates the case of Sirius Black, an escaped prisoner from Azkaban, the wizard prison. Sirius Black is believed to be one of Voldemort's allies, and he is the only wizard ever to escape Azkaban, so he is definitely powerful. Harry Potter then overhears that Sirius Black wants to kill him. This book is full of creeps and chills, like in one part, the train to Hogwarts is stopped because of terrible flying things that can suck out your soul. Because of these soul-suckers, Harry almost dies, but in the end, Harry learns a lot about himself, his parents, and friends (both of his, and his parents’). But this book is still full of interest. In a memorable moment, Harry Potter flies on a Hippogriff, which is a hybrid between a horse and eagle. In another part, The Prisoner of Azkaban goes from fantasy to sci-fi, because of time travel, where Harry goes back in time to save himself. With the adventurous and scary parts in perfect balance, this book is a good read, and personally, it is my favorite book in the whole series. 	5f1e759e-a9a9-4678-88e2-2a836573dd89	["drama","adventure","documentary"]	1234567891234
56	Harry Potter and the Goblet of Fire	2000	Harry Potter and the Goblet of Fire is a fantasy novel written by British author J. K. Rowling and the fourth novel in the Harry Potter series. It follows Harry Potter, a wizard in his fourth year at Hogwarts School of Witchcraft and Wizardry, and the mystery surrounding the entry of Harry's name into the Triwizard Tournament, in which he is forced to compete. The book was published in the United Kingdom by Bloomsbury and in the United States by Scholastic. In both countries, the release date was 8 July 2000. This was the first time a book in the series was published in both countries at the same time. Over the summer, the Weasleys invite Harry Potter to attend the Quidditch World Cup final, played between Bulgaria and Ireland. The match ends in a victory for the Irish, but the campsite is attacked by Voldemort's former followers called the Death Eaters. Nobody is killed, but the Dark Mark is set off and is believed to have been cast by Barty Crouch's house-elf, Winky. \r\n                    	4dfe4f13-5252-4bb8-8262-87380d2b538b	["drama","fantasy"]	234567891434
57	Harry Potter and the Order of the Phoenix	2003	Harry Potter and the Order of the Phoenix is a fantasy novel written by British author J. K. Rowling and the fifth novel in the Harry Potter series. It follows Harry Potter's struggles through his fifth year at Hogwarts School of Witchcraft and Wizardry, including the surreptitious return of the antagonist Lord Voldemort, O.W.L. exams, and an obstructive Ministry of Magic. The novel was published on 21 June 2003 by Bloomsbury in the United Kingdom, Scholastic in the United States, and Raincoast in Canada. It sold five million copies in the first 24 hours of publication. Harry Potter and the Order of the Phoenix won several awards, including the American Library Association Best Book Award for Young Adults in 2003. The book was also made into a 2007 film, and a video game by Electronic Arts. During the summer, Harry Potter is frustrated by his friends' non-communication and with Dumbledore barring him from helping combat a newly-resurgent Lord Voldemort. One evening, Dementors attack him and cousin Dudley, but Harry fends them off using the Patronus Charm. 	b51396f3-b60f-4782-9c64-bcd55c35e3da	["fantasy","adventure"]	234547891834
58	Harry Potter and the Half-Blood Prince	2005	Harry Potter and the Half-Blood Prince is a fantasy novel written by British author J. K. Rowling and the sixth and penultimate novel in the Harry Potter series. Set during Harry Potter's sixth year at Hogwarts, the novel explores the past of the boy wizard's nemesis, Lord Voldemort, and Harry's preparations for the final battle against Voldemort alongside his headmaster and mentor Albus Dumbledore. The book was published in the United Kingdom by Bloomsbury and in the United States by Scholastic on 16 July 2005, as well as in several other countries. It sold almost seven million copies in the first 24 hours after its release,[1] a record eventually broken by its sequel, Harry Potter and the Deathly Hallows. There were many controversies before and after it was published, including the right-to-read copies delivered before the release date in Canada. Reception to the novel was generally positive, and it won several awards and honours, including the 2006 British Book of the Year award. Reviewers noted that the book had a darker tone than its predecessors, though it did contain some humour. Some considered the main themes love, death, trust, and redemption. The considerable character development of Harry and many other teenage characters also drew attention. \r\n                    	24f55a90-f9a6-474e-ac74-b2d5d97336cf	["drama","fantasy","adventure"]	7234567891034
13	Harry Potter and he Philosopher's 1Stone	1997	                        It is a story about Harry Potter, an orphan brought up by his aunt and uncle because his parents were killed when he was a baby. Harry is unloved by his uncle and aunt but everything changes when he is invited to join Hogwarts School of Witchcraft and Wizardry and he finds out he's a wizard.\r\n                    	66218c9e691794.02470625855	["fantasy","roman"]	4134567891234
59	Harry Potter and the Deathly Hallows	2006	Harry Potter and the Deathly Hallows is a fantasy novel written by British author J. K. Rowling and the seventh and final novel in the Harry Potter series. It was released on 21 July 2007 in the United Kingdom by Bloomsbury Publishing, in the United States by Scholastic, and in Canada by Raincoast Books. The novel chronicles the events directly following Harry Potter and the Half-Blood Prince (2005) and the final confrontation between the wizards Harry Potter and Lord Voldemort. Deathly Hallows shattered sales records upon release, surpassing marks set by previous titles of the Harry Potter series. It holds the Guinness World Record for most novels sold within 24 hours of release, with 8.3 million sold in the US and 2.65 million in the UK.[1][2] Reception to the book was generally positive, and the American Library Association named it a "Best Book for Young Adults". A film adaptation of the novel was released in two parts: Harry Potter and the Deathly Hallows – Part 1 in November 2010 and Part 2 in July 2011. \r\n                    	42f24961-3c53-44fb-b775-482f4b8914b0	["adventure","documentary"]	9234567891230
\.


--
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_author (id, book_id, author_id, created_at) FROM stdin;
45	53	45	2024-04-18
46	54	46	2024-04-18
47	55	47	2024-04-18
48	56	48	2024-04-18
49	57	49	2024-04-18
50	58	50	2024-04-18
51	59	51	2024-04-18
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, created_at) FROM stdin;
1	2024-04-16-16:11:29-UTC.php	2024-04-18 15:03:12
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 59, true);


--
-- Name: book_genre_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_genre_author_id_seq', 59, true);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 72, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: book_author book_genre_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_genre_author_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: idx_ffd22b016a2b381; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ffd22b016a2b381 ON public.book_author USING btree (book_id);


--
-- Name: idx_ffd22b0f675f31b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ffd22b0f675f31b ON public.book_author USING btree (author_id);


--
-- Name: uniq_cbe5a331cc1cf4e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_cbe5a331cc1cf4e6 ON public.book USING btree (isbn);


--
-- Name: book_author delete_book_author; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_book_author AFTER DELETE ON public.book_author FOR EACH ROW EXECUTE FUNCTION public.delete_book();


--
-- Name: book_author fk_ffd22b016a2b381; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_ffd22b016a2b381 FOREIGN KEY (book_id) REFERENCES public.book(id) ON DELETE CASCADE;


--
-- Name: book_author fk_ffd22b0f675f31b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_ffd22b0f675f31b FOREIGN KEY (author_id) REFERENCES public.author(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
