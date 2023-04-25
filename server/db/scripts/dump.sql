--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: coin_tracker; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE coin_tracker WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE coin_tracker OWNER TO postgres;

\connect coin_tracker

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coins (
    coin_id character varying(255) NOT NULL,
    coin_symbol character varying(255) NOT NULL,
    coin_name character varying(255) NOT NULL
);


ALTER TABLE public.coins OWNER TO postgres;

--
-- Name: user_coins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_coins (
    id integer NOT NULL,
    coins text[] NOT NULL,
    user_id uuid
);


ALTER TABLE public.user_coins OWNER TO postgres;

--
-- Name: user_coins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_coins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_coins_id_seq OWNER TO postgres;

--
-- Name: user_coins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_coins_id_seq OWNED BY public.user_coins.id;


--
-- Name: user_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_transactions (
    transaction_id bigint NOT NULL,
    date date DEFAULT CURRENT_DATE NOT NULL,
    coin character varying(255) NOT NULL,
    quantity numeric NOT NULL,
    user_id uuid,
    note character varying(255),
    price character varying(255)
);


ALTER TABLE public.user_transactions OWNER TO postgres;

--
-- Name: user_transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_transactions_transaction_id_seq OWNER TO postgres;

--
-- Name: user_transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_transactions_transaction_id_seq OWNED BY public.user_transactions.transaction_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: user_coins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coins ALTER COLUMN id SET DEFAULT nextval('public.user_coins_id_seq'::regclass);


--
-- Name: user_transactions transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.user_transactions_transaction_id_seq'::regclass);


--
-- Data for Name: coins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coins (coin_id, coin_symbol, coin_name) FROM stdin;
orbitcoin	orb	Orbitcoin
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_coins (id, coins, user_id) FROM stdin;
1	{hello}	2b2dd2cf-94bd-4f3c-885c-c5897cc46cef
2	{"{\\"bitcoin\\"}"}	75635f8b-4c99-4f31-a070-8b3c78cf1105
3	{"{\\"bitcoin\\"}"}	63520c60-7bdf-4f03-933d-898760cd8c69
4	{bitcoin}	14dc2fac-1877-48f6-a6a3-166dcd68f41c
5	{"{\\"bitcoin\\",\\"ethereum\\",\\"dogecoin\\"}"}	8da1e152-0961-4d4b-9179-fb9bfba5e8e2
6	{bitcoin}	6d7a363c-2b91-4454-9f3d-c331ab293ada
7	{bitcoin,ethereum,dogecoin}	d7560697-17b2-4429-913d-ad294792ff16
34	{bitcoin,ethereum,dogecoin}	9f4e92f4-2734-4dbb-abc4-f2c3f7aeff05
35	{bitcoin,ethereum,dogecoin}	e6117641-5825-4c0e-a0b2-b74f44af1ec3
36	{bitcoin,ethereum,dogecoin}	416c9793-7155-4171-9df1-2502fcd52052
8	{bitcoin,ethereum,dogecoin,aga-carbon-credit,aga-rewards,h2finance,graft-blockchain,anarchy,era}	0aa783b7-925c-4b30-a69b-229c1ffebbd5
37	{bitcoin,ethereum,dogecoin}	0447579b-2729-4911-b200-372787b0f0de
38	{bitcoin,ethereum,dogecoin}	fa8a8e5f-3868-4421-8104-ad678bba2e41
39	{bitcoin,ethereum,dogecoin,1337}	2d50c975-6adf-4b05-9f43-88f10412b92d
40	{bitcoin,ethereum,dogecoin}	10c89e29-98f5-4e33-bd13-676fd88ff0d0
9	{bitcoin,ethereum,dogecoin,bondly,gear,1337,biblecoin,biblepay,anarchy,ahatoken}	c41094e7-fe68-44ee-b5f4-c036e928d114
10	{bitcoin,ethereum,dogecoin,era,blockchain-certified-data-token}	f3ed05cb-286b-4db4-91ea-9247b6448d20
12	{bitcoin,ethereum,dogecoin}	fbfc321a-1313-4d03-a89c-be5bf7fe301b
13	{bitcoin,ethereum,dogecoin}	4f7e55e3-dcbe-4ab8-bbc8-fd185e8fa647
15	{bitcoin,ethereum,dogecoin}	bcc29fb2-f829-44a9-a571-96cd787a18ba
16	{bitcoin,ethereum,dogecoin}	f78905f2-ff72-425e-ad36-5b1495777646
17	{bitcoin,ethereum,dogecoin}	95a0b623-65f7-40ea-80f1-bef41372fd11
18	{bitcoin,ethereum,dogecoin}	aa8f358f-076f-45b9-aa4d-3710b8ab32f4
19	{bitcoin,ethereum,dogecoin}	4745bb11-1e54-4a8e-84d1-0856bfc61560
20	{bitcoin,ethereum,dogecoin}	39c31901-2397-40a0-8891-37312843dfc2
21	{bitcoin,ethereum,dogecoin}	17d29868-41ed-4b42-abb7-fabb67b9aead
22	{bitcoin,ethereum,dogecoin}	98efe37d-1df1-497a-a122-7e0fb8d2a8e8
23	{bitcoin,ethereum,dogecoin}	891c47b5-643c-4e2f-9461-e73981488f37
24	{bitcoin,ethereum,dogecoin}	7a68238b-3058-4a43-9a2d-e41e564eed83
25	{bitcoin,ethereum,dogecoin}	ad12793c-19be-4676-90c9-27404bd4ca38
26	{bitcoin,ethereum,dogecoin}	1d772427-0514-4fa7-97ec-95a4706afd99
27	{bitcoin,ethereum,dogecoin}	1bff322b-8251-4f5f-90fc-2f037acfc926
11	{bitcoin,ethereum,dogecoin,jackal-protocol,egg-n-partners}	b8579086-35b6-4fc2-8e66-8a71a808f835
28	{bitcoin,ethereum,dogecoin}	8aed2197-e6c4-4da8-a0c0-45d00674320d
29	{bitcoin,ethereum,dogecoin}	6c4c3d79-e56b-45a2-856b-2ecb5c1b5eb4
30	{bitcoin,ethereum,dogecoin}	f8ff7160-f56f-4104-850e-3af78ccde68f
14	{ethereum}	cd432492-7220-44e8-a2f4-88a55427d174
31	{cranx-chain}	8da5f05a-5b44-469b-bc13-7a213160ced8
32	{bitcoin,ethereum,dogecoin}	6d661b74-f382-47b6-98d3-9644b0aeaa77
33	{bitcoin,ethereum,dogecoin}	b48f26d1-fa4b-4481-9bf7-4a6de286b4d4
\.


--
-- Data for Name: user_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_transactions (transaction_id, date, coin, quantity, user_id, note, price) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, password, email) FROM stdin;
0bea2d2a-aff3-4ee2-a1b6-4449a738e925	111@gmail.com	$2b$10$nyURB/ej9ZF9NbxQah44nO	111@gmail.com
b64b7758-d638-47fd-8065-1f7d1a4ca324	111@gmail.com	$2b$10$yxjgmKJ/2tgeze810iMeZ.	111@gmail.com
363ca7ad-84c7-42da-865e-2ec60b924d16	111@gmail.com	$2b$10$o7Pp0lJbC4fPI06.4itOmu	111@gmail.com
2c779b46-c385-46ac-814d-a1f3862f7df0	gggg@gmail.com	$2b$10$778IH.5j.YjzCSMHR59Hye	gggg@gmail.com
24e5367d-b9d7-450c-8266-26c5231dda2b	gggg@gmail.com	$2b$10$UGClOMS9tt6pggFv3p4qN.	gggg@gmail.com
c49ca2b9-7f53-4e4c-a1e4-a4262c106278	gg@gmail.com	$2b$10$bEKM4NRLyuWwX24oRL8O8O	gg@gmail.com
f95007ad-5d7e-4232-b69f-f16a46dc8eed	matthewjcrosby1@gmail.com	$2b$10$MErHm8NTfbbhcFLKThCKoe	matthewjcrosby1@gmail.com
4091c118-1af5-4d7b-a477-2e3f16b875f2	moo2	$2b$10$pQY/TCeWG.NQwGOpcok5rO	abcd@gmail.com
3464c740-d4be-4ab8-9423-0587b1ab44f9	booty	$2b$10$YUQJCsMo/iWbvU15nXm/K.	anemail@gmail.com
91e53b41-a434-40aa-a517-11ea9f99d426	bootty	$2b$10$Vpij93DEJFBHcZEi1z5dFO/KkOVFnKFtlt777DeB5EXPkc8rMxr3C	anemaittl@gmail.com
5b12d81f-9108-4d6c-8dff-ae65ad328a07	ausername	$2b$10$fhWyz8mHNlwCPcEnSfr2QOoiUAyTdo5KJPR3OxKk1AU4a9zRkhYYW	matthewjcrosby1@gmail.com
62c3816d-15ec-4930-9a97-b0233fbeba8b	eas	$2b$10$yOHRvAm3UeE2wNsz9Yd0m.oXOLt7W5Cqde71zdM95ilaVBl.N/Y4G	g@ga
6f31629c-a8eb-4d2a-85e5-0010f1491699	easter	$2b$10$6HqdQWoMBAtSGiO.W6qXHehATOY/ZtoQaLS73ZQXpRTDNB49PY7/S	g@ga
ed469e9b-341f-4af1-828a-0b8eefc13097	oooo	$2b$10$6RsR095jVApei/ZloUiJ2OHBVE.c.3/AmLB74qPUO5df9rTlgSAJ2	b@gmail.ccom
3015b967-2fd3-44fe-9e21-42d83b017b79	easter	$2b$10$.8FSRtqbj80U.nO4Y3UFXeg69Y/Ek8dDFQvwf1a6Rab8AZkR/N2Rm	b@gmail.ccom
46d7b70e-ce9e-43ed-8985-83b4f36f4489	3	$2b$10$4JLl5PLBlTtj4P4to/Hb0O3M6WSVt2r781oEmaobFmpBB4Iz.aj16	matthewjcrosby1@gmail.com
0bd6c961-c922-44ae-80f3-fda1d6ae6735	e	$2b$10$mvvfIH.ADsBdrN4b51ORO.4jlMtvccuMeTDlhohGKDJ25pFjw5OWK	111@gmail.cpm
00aa9087-d8db-4ab4-9351-3c68e0017e0e	2	$2b$10$RZUX.vfBdGz0Lk8zqVDIkeRN2xDKqPmr/aGiPLcF/E16ViZyhd1R6	222@gmail.com
5965a5fb-b761-4c39-9bdc-360cb8073ee3	ordinaryusername	$2b$10$CWkCWssmfKXGunrp1KaGQOMM13IaiXS.ER/bh/0aLVy8Tm8UjsgH2	newEmail@gmail.com
e8c09e7a-6dff-471f-81b8-4170a62fb567	great	$2b$10$HYuL4UOEYEroHJL1K75QC.jKB2dVbpyWSthcCqrbPFmWHpVec0lqW	makenewuser@gmailcom
e7099c04-3c1e-4e35-ac58-96584b74b122	t2t2t2t2	$2b$10$5T1w3cyRM7aPqX6hwkjOe.bUV/RMFOFpr6f6qB/ISudHDm6XNIE26	ggggg@gmagil.com
994ed724-a054-4e5a-b6d5-54c2fa43c947	test-account-1	$2b$10$pwg3rnNDmdQfewJM9U9oCuyQhvdsHfKN9ZpQchH7QUJhOQAKpB8qy	testaccount@gmail.com
9d98c090-7a33-4fda-9073-03a123f2b31b	tt	$2b$10$nJIyu8Skbpf9fxk9MkYYGebOuJ5PRghIcteQ5zkhub6/kT7yBPvdK	tt@gmail.com
455a753c-56eb-47db-be29-0b410b059883	geege	$2b$10$LBGFni1yKyCOkDEDE09NC.gqc7046Mwi9Q.hHml2Qp2DcXKwyMEW.	2t2t2t2@gmailc.om
71778ff0-ce1e-4612-9a50-e2b159988c7a	4444	$2b$10$BTnO7PdVAlBk4arA1Wd2huOk5n61H74vYxzEYg61Kwz/KP59yzLu2	tes2222t
2b2dd2cf-94bd-4f3c-885c-c5897cc46cef	44aedg44	$2b$10$ejqQgq87OgdYdZkr4zuC2..5TwhcL5T9BEMMb8mjfTSZTdhT5Egci	afgeadgaedg@
baa36818-0557-44f2-891d-e105aad76d01	rg	$2b$10$5zG0jVSlVDzwqzyW0.u0ROqQZ/87XO5Y2ov5lKre5Ui9Sl.ix7/7i	ggerg@
c3fd4afd-a2ff-41e4-b589-40146b37f136	asdgadsgsdagearg	$2b$10$Jz8iS3XS4URomwb8d/8wOeSDfkUth5Nk1UY4h1QPqjWt1qJeRR0ea	asfasfasfd@
75635f8b-4c99-4f31-a070-8b3c78cf1105	deagdeagaedg	$2b$10$nMuR0tD9BTFhJZVtRvHvF.XW1uytEjEEj7QNR4FlELaxfbo33MhIO	daegdeadgaedg@
1158977c-79c0-42ef-a101-a623f06ea19b	aedg	$2b$10$/iYEvNxs4fY2kzsBTLhgreqE4xf50K/.nT1QlaIWUFuAOaBsrHI6G	aedg@
63520c60-7bdf-4f03-933d-898760cd8c69	gggg	$2b$10$ezIs33W/dbf6NueepyP7.upgpmJcqZ3tktRM3GA.fOLnCRd7H4cAG	ggggggg
14dc2fac-1877-48f6-a6a3-166dcd68f41c	33333	$2b$10$KH6apm4UvEFt9buF87uKauyvznavn9ammc7M5.usUa2VsbZm3WHay	3333
8da1e152-0961-4d4b-9179-fb9bfba5e8e2	amazing	$2b$10$axuxrdBW4xR1x5t7l/9RQOerSo6GYONOSNehrHhXabdVYx0FWyAki	Amazing@gmail.com
7552fd6d-6c28-4b90-b4fc-85b43dd76ee5	amazing2	$2b$10$T.Gsu7CDIX5CmtMChEGXP.6l2BsUf3cGuWnf0H0O9J5hk94se.a7S	amazing2@gmail.com
6d7a363c-2b91-4454-9f3d-c331ab293ada	aedgaed	$2b$10$uhPYtS6nTL/bs8Afz5wJJuWZr3nDSxVzaBZnD4K2WW.ASPRn8f6Bu	gaedg
ffb3f40d-d37d-4799-8bdb-e86fedc1f917	eeddd	$2b$10$DkvxWvdRWPNAm4Jn0FS.KeTP84s3nZ5v9WwivIXafdUSXeb3NpovW	eddee
d7560697-17b2-4429-913d-ad294792ff16	sdg	$2b$10$fikIs9ikl7TInAmFKirSqOU1Y3wGibwqqyFYNwfWjNnOYSnoL38Zu	sdgds
0aa783b7-925c-4b30-a69b-229c1ffebbd5	wow1	$2b$10$UoOnLIuq/5/4234flfTaxOV2G4cA7VeDjvd1AWma8JMs3VKutIPva	wow1@gmail.com
c41094e7-fe68-44ee-b5f4-c036e928d114	account@account.gmail.com	$2b$10$LRHNHhoaaO2zxdYvua6Cs.k2hOD90cy.0io3Q24VNAlLLf2wWNFV.	account@account.gmail.com
f3ed05cb-286b-4db4-91ea-9247b6448d20	tesla	$2b$10$mGPTyN0y6yeSkNzQQ9mhCeopszpZBIzO6LOfxoNGQOwZUF/1i1/Hi	tesla@gmail.com
b8579086-35b6-4fc2-8e66-8a71a808f835	ab	$2b$10$bOx0mySJ40ZOsUg0U0AxLe5qipTj9RHZBtl2tRtlsmi02Cvxac7Ni	ab@gmail.com
fbfc321a-1313-4d03-a89c-be5bf7fe301b	ee33	$2b$10$5UhxL7xe3fzyFtdeQse.k.rTYTSpKWOQQMi1rpKCaRjCmQ0JDZ4Zm	ee33@gmail.com
4f7e55e3-dcbe-4ab8-bbc8-fd185e8fa647	wow	$2b$10$IBFi9YEqpglekaugL1kd/ObZEccovCr9mkNWOJAdaVUQ4cC7xey3C	eee3@gmail.com
cd432492-7220-44e8-a2f4-88a55427d174	be	$2b$10$bRLDMzQMbwqopGxBtkiTMOYY.Kw9Sj1ib6ygRoZdqFl2tgKhcS5Re	be@gmail.com
bcc29fb2-f829-44a9-a571-96cd787a18ba	aergaerg	$2b$10$vqEheaJQydEuYoj1v5A6HeSjDM2hzr6KCUx3AS7MeqUUkRxywqJdm	eeee3@gmail.com
f78905f2-ff72-425e-ad36-5b1495777646	ge	$2b$10$GAbwoGwheHPm2a9u.zFSZO9FZWXWePfplk8/PLUaDO1XVHoWnBSsO	ge@gmail.com
95a0b623-65f7-40ea-80f1-bef41372fd11	gg2@gmaierg	$2b$10$phK.FoQ7kcegmgPkHUNfAOJsuKvfrQOY5DKJAfYZN9N1yrv4G.szy	gggggr@geg
aa8f358f-076f-45b9-aa4d-3710b8ab32f4	aerga	$2b$10$7bpI9vOSX23CVQumNKv/K.GIYvSxehMOn3V8fy85efS9QDkAUu.Kq	ergerg@gg
4745bb11-1e54-4a8e-84d1-0856bfc61560	geg2	$2b$10$2jtwLFSaT9RGzXMDO81DxOd0huyBhzzwwrzveSFS3WGibYVjQNv4u	4442@gmail.com
39c31901-2397-40a0-8891-37312843dfc2	555555	$2b$10$WhqVEA9nNg0hNqw8tp3yheA2VJQ6JvtvNW3ZYB4bHZjhRB0a/8HA6	ergaergaerg@gmegim
17d29868-41ed-4b42-abb7-fabb67b9aead	etetttet	$2b$10$NlAfrDxprQwAHW13VG7HoOU2mDbi5ARAn1oGLO3wJh1giI3udKGwG	eeeeee22@gmail.com
98efe37d-1df1-497a-a122-7e0fb8d2a8e8	gagag	$2b$10$KYEwDvvpjn.GiRQJmQEGnebIDsXfcX3djv9itsVzEW1sS99oBeNHG	gg34g43g@gmail.com
891c47b5-643c-4e2f-9461-e73981488f37	baba	$2b$10$sOVrSxYQplmXI/1aeN/5Tu6JWqej9l9Ax03oFIexuSZsAt9tW8Tt6	baba@gmail.com
7a68238b-3058-4a43-9a2d-e41e564eed83	mouse	$2b$10$GpRE2oQU090BPedON41VfOeM7xvfzWxhuV0j/l4Jgjydvz1aVZPvi	ebearbaerber@gmail.com
ad12793c-19be-4676-90c9-27404bd4ca38	mouser	$2b$10$Byol4TvJFi7/fZT0etRuh.QkcizhblpmG9q8dryMRiNax09OEFVV6	ebearbaerber@gbgemail.com
1d772427-0514-4fa7-97ec-95a4706afd99	bebebe	$2b$10$N5cJmk0r8Jl/0i1N2B3R/.GuPm.vyTGHiVrydZ9PxiRtG5j8L/pQ6	beb@gmail.com
1bff322b-8251-4f5f-90fc-2f037acfc926	abeb	$2b$10$yVRhrks5K/35hvXK9ZnyJ.4w/1zZIdsyEI8MamfntbdbaR1rQ.W16	geagag@ghmaig
8aed2197-e6c4-4da8-a0c0-45d00674320d	123	$2b$10$7L0XvhGk9xb5rwQgO.258OWZvkAMy6MJFiB.pHQP6NCZHVnUDXZtC	123@gmail.com
6c4c3d79-e56b-45a2-856b-2ecb5c1b5eb4	hello123	$2b$10$aWr1XHUx7ZIN7YrGAX/wq.BHB5zrO/F.Mphcy9Sx1Xr28.W7Kazpu	hello@gmail.com
f8ff7160-f56f-4104-850e-3af78ccde68f	wowow	$2b$10$5KoxO6097LWipUXXCevdc.HeIphonR8uTuwv4QqGUtCcXJvls3zFG	wow@gmail.com
8da5f05a-5b44-469b-bc13-7a213160ced8	hello123123	$2b$10$Y/kfLNEO7Wkk0CB3.sqE..G8vE145WvcwdEiMtB8UBBeKfgSuZNWG	hello123@gmail.com
6d661b74-f382-47b6-98d3-9644b0aeaa77	agagagaga	$2b$10$M/w5rzVuOviuIg8xNwkRfetKzmI12oQ1CiYuGPhWsZxj4DZzknXDO	agagagag@gmail.com
b48f26d1-fa4b-4481-9bf7-4a6de286b4d4	123123123	$2b$10$hdmgpgo1Q3Nj1rXO0S0P8eWerey0wYCc3ZnnbK0VMswU90jl.rypG	aergaergae@gmail.com
9f4e92f4-2734-4dbb-abc4-f2c3f7aeff05	booty1234	$2b$10$UxczS7jES5AjsDHOt.Ad1.3Dv/nZPvTpcmGbUxGjq6MQhXE000Mve	ok2222@gmail.com
e6117641-5825-4c0e-a0b2-b74f44af1ec3	user11	$2b$10$tOu4Ssxo01OhqlwU7BX9secm/93W3ntfdGJrOR2fBkiq8iVkX9Hh6	user11@gmail.com
416c9793-7155-4171-9df1-2502fcd52052	eeeeeeeeee	$2b$10$iRtRKB1MRCGnq/J33ocA2eB/R8zO5JNns5nqx/QS/UHW/8DfBXX3q	feff2@gmail.com
0447579b-2729-4911-b200-372787b0f0de	aedgaedgaedg	$2b$10$XH/CMsCSThcZQizcsG.3muYnGP./.tP.vmR/EphlTyrxgjAT1RZVC	aedgaedgaedg@gna
fa8a8e5f-3868-4421-8104-ad678bba2e41	agagag	$2b$10$eX3Qvv5c3MDvQdHRMNkQd.XZEu.WvHHEQxOp6yr.qW8H1tINHJpsm	agagag@gmail.com
2d50c975-6adf-4b05-9f43-88f10412b92d	aha123	$2b$10$VySTojaJL4pTxICOPiX.5.TSVMGyyAdriJHLRHYeDtPl06eUB98yu	ahahahah@gmail.com
10c89e29-98f5-4e33-bd13-676fd88ff0d0	wow4444	$2b$10$h864oj819YI5bpB9cWkICeeniqVQHxTXBVpT7cLkdYLdveVVUkXUq	aaaaaaaaaa@gmail.com
\.


--
-- Name: user_coins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_coins_id_seq', 40, true);


--
-- Name: user_transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_transactions_transaction_id_seq', 47, true);


--
-- Name: coins coins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coins
    ADD CONSTRAINT coins_pkey PRIMARY KEY (coin_id);


--
-- Name: user_coins user_coins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coins
    ADD CONSTRAINT user_coins_pkey PRIMARY KEY (id);


--
-- Name: user_transactions user_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_transactions
    ADD CONSTRAINT user_transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: user_coins user_coins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coins
    ADD CONSTRAINT user_coins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_transactions user_transactions_coin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_transactions
    ADD CONSTRAINT user_transactions_coin_fkey FOREIGN KEY (coin) REFERENCES public.coins(coin_id);


--
-- Name: user_transactions user_transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_transactions
    ADD CONSTRAINT user_transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

