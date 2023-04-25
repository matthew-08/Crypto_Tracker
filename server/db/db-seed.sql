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
01coin	zoc	01coin
0chain	zcn	Zus
0x	zrx	0x
0xcert	zxc	0xcert
0xdao	oxd	0xDAO
0xdao-v2	oxd v2	0xDAO V2
0xmonero	0xmr	0xMonero
0xpad	0xpad	0xPAD
0xtrade	0xt	0xTrade
0xwallet-token	0xw	0xWallet Token
11957-olga	realt-s-11957-olga-st-detroit-mi	RealT - 11957 Olga St, Detroit, MI 48213
12405-santa-rosa	realt-s-12405-santa-rosa-dr-detroit-mi	RealT - 12405 Santa Rosa Dr, Detroit, MI 48204
12ships	tshp	12Ships
1337	1337	Elite
14066-santa-rosa	realt-s-14066-santa-rosa-dr-detroit-mi	RealT - 14066 Santa Rosa Dr, Detroit, MI 48238
1617-s-avers	realt-s-1617-s.avers-ave-chicago-il	RealT - 1617 S Avers Ave, Chicago, IL 60623
1815-s-avers	realt-s-1815-s.avers-ave-chicago-il	RealT - 1815 S Avers Ave, Chicago, IL 60623
1art	1art	OneArt
1bch	1bch	1BCH
1box	1box	1BOX
1doge	1doge	1Doge
1eco	1eco	1eco
1eth	1eth	1ETH
1hive-water	water	1Hive Water
1inch	1inch	1inch
1inch-yvault	yv1inch	1INCH yVault
1million-nfts	1mil	1MillionNFTs
1million-token	1mt	1Million
1move token	1mt	1Move Token
1peco	1peco	1peco
1reward-token	1rt	1Reward Token
1safu	safu	1SAFU
1sol	1sol	1Sol
1sol-io-wormhole	1sol	1sol.io (Wormhole)
1tronic	1trc	1TRONIC
1-up	1-up	1-UP
1world	1wo	1World
2044-nuclear-apocalypse	2044	2044 Nuclear Apocalypse
20weth-80bal	20weth-80bal	20WETH-80BAL
28vck	vck	28VCK
2acoin	arms	2ACoin
2crazynft	2crz	2crazyNFT
2gather	two	2gather
2g-carbon-coin	2gcc	2G Carbon Coin
2key	2key	2key.network
2local-2	2lc	2local
2omb-finance	2omb	2omb
2share	2shares	2SHARE
300fit	fit	300FIT
30mb-token	3omb	3OMB
37protocol	37c	37Protocol
3air	3air	3air
3gg	3gg	3gg
3qt	3qt	3QT
3shares	3share	3Share
3xcalibur	xcal	3xcalibur Ecosystem Token
42-coin	42	42-coin
4852-4854-w-cortez	realt-s-4852-4854-w.cortez-st-chicago-il	RealT - 4852-4854 W Cortez St, Chicago, IL 60651
4artechnologies	4art	4ART Coin
4d-twin-maps	map	4D Twin Maps
4int	4int	4INT
4jnet	4jnet	4JNET
4mw	4mw	4 Meta World
4new	kwatt	4New
4play	4play	4PLAY
50cent	50c	50Cent
5g-cash	vgc	5G-CASH
5km-run	run	5KM RUN
73c9fc57-af8f-4bd8-935f-de69a853598d	mbtc	메타비트코인
7pixels	7pxs	7Pixels
7up	7up	7up
888tron	888	888tron
88mph	mph	88mph
8bit-doge	bitd	8Bit Doge
8bitearn	8bit	8BITEARN
8pay	8pay	8Pay
8x8-protocol	exe	8X8 Protocol
99defi	99defi	99Defi
99starz	stz	99Starz
a4-finance	a4	A4 Finance
aada-finance	aada	Aada Finance
aag-ventures	aag	AAG
aave	aave	Aave
aave-aave	aaave	Aave AAVE
aave-amm-bptbalweth	aammbptbalweth	Aave AMM BptBALWETH
aave-amm-bptwbtcweth	aammbptwbtcweth	Aave AMM BptWBTCWETH
aave-amm-dai	aammdai	Aave AMM DAI
aave-amm-uniaaveweth	aammuniaaveweth	Aave AMM UniAAVEWETH
aave-amm-unibatweth	aammunibatweth	Aave AMM UniBATWETH
aave-amm-unicrvweth	aammunicrvweth	Aave AMM UniCRVWETH
aave-amm-unidaiusdc	aammunidaiusdc	Aave AMM UniDAIUSDC
aave-amm-unidaiweth	aammunidaiweth	Aave AMM UniDAIWETH
aave-amm-unilinkweth	aammunilinkweth	Aave AMM UniLINKWETH
aave-amm-unimkrweth	aammunimkrweth	Aave AMM UniMKRWETH
aave-amm-unirenweth	aammunirenweth	Aave AMM UniRENWETH
aave-amm-unisnxweth	aammunisnxweth	Aave AMM UniSNXWETH
aave-amm-uniuniweth	aammuniuniweth	Aave AMM UniUNIWETH
aave-amm-uniusdcweth	aammuniusdcweth	Aave AMM UniUSDCWETH
aave-amm-uniwbtcusdc	aammuniwbtcusdc	Aave AMM UniWBTCUSDC
aave-amm-uniwbtcweth	aammuniwbtcweth	Aave AMM UniWBTCWETH
aave-amm-uniyfiweth	aammuniyfiweth	Aave AMM UniYFIWETH
aave-amm-usdc	aammusdc	Aave AMM USDC
aave-amm-usdt	aammusdt	Aave AMM USDT
aave-amm-wbtc	aammwbtc	Aave AMM WBTC
aave-amm-weth	aammweth	Aave AMM WETH
aave-bal	abal	Aave BAL
aave-balancer-pool-token	abpt	Aave Balancer Pool Token
aave-bat	abat	Aave BAT
aave-bat-v1	abat	Aave BAT v1
aave-busd	abusd	Aave BUSD
aave-busd-v1	abusd	Aave BUSD v1
aave-crv	acrv	Aave CRV
aave-dai	adai	Aave DAI
aave-dai-v1	adai	Aave DAI v1
aave-enj	aenj	Aave ENJ
aave-enj-v1	aenj	Aave ENJ v1
aave-eth-v1	aeth	Aave ETH v1
aavegotchi	ghst	Aavegotchi
aavegotchi-alpha	alpha	Aavegotchi ALPHA
aavegotchi-fomo	fomo	Aavegotchi FOMO
aavegotchi-fud	fud	Aavegotchi FUD
aavegotchi-kek	kek	Aavegotchi KEK
aave-gusd	agusd	Aave GUSD
aave-interest-bearing-steth	asteth	Aave Interest Bearing STETH
aave-knc	aknc	Aave KNC
aave-knc-v1	aknc	Aave KNC v1
aave-link	alink	Aave LINK
aave-link-v1	alink	Aave LINK v1
aave-mana	amana	Aave MANA
aave-mana-v1	amana	Aave MANA v1
aave-mkr	amkr	Aave MKR
aave-mkr-v1	amkr	Aave MKR v1
aave-polygon-aave	amaave	Aave Polygon AAVE
aave-polygon-dai	amdai	Aave Polygon DAI
aave-polygon-usdc	amusdc	Aave Polygon USDC
aave-polygon-usdt	amusdt	Aave Polygon USDT
aave-polygon-wbtc	amwbtc	Aave Polygon WBTC
aave-polygon-weth	amweth	Aave Polygon WETH
aave-polygon-wmatic	amwmatic	Aave Polygon WMATIC
aave-rai	arai	Aave RAI
aave-ren	aren	Aave REN
aave-ren-v1	aren	Aave REN v1
aave-snx	asnx	Aave SNX
aave-snx-v1	asnx	Aave SNX v1
aave-susd	asusd	Aave SUSD
aave-susd-v1	asusd	Aave SUSD v1
aave-tusd	atusd	Aave TUSD
aave-tusd-v1	atusd	Aave TUSD v1
aave-uni	auni	Aave UNI
aave-usdc	ausdc	Aave USDC
aave-usdc-v1	ausdc	Aave USDC v1
aave-usdt	ausdt	Aave USDT
aave-usdt-v1	ausdt	Aave USDT v1
aave-wbtc	awbtc	Aave WBTC
aave-wbtc-v1	awbtc	Aave WBTC v1
aave-weth	aweth	Aave WETH
aave-xsushi	axsushi	Aave XSUSHI
aave-yfi	ayfi	Aave YFI
aave-yvault	yvaave	Aave yVault
aave-zrx	azrx	Aave ZRX
aave-zrx-v1	azrx	Aave ZRX v1
aax-token	aab	AAX
abachi	abi	Abachi
abcc-token	at	ABCC
abc-floor-index	abc	ABC Floor Index
abcmeta	meta	ABCMETA
abel-finance	abel	ABEL Finance
abell-coin	abc	Abell Coin
abey	abey	Abey
abitshadow-token	abst	Abitshadow
able-finance	able	Able Finance
aboat-token	aboat	Aboat Token
absolute-sync-token	ast	Absolute Sync
acala	aca	Acala
acala-dollar	ausd	Acala Dollar (Karura)
acala-dollar-acala	ausd	Acala Dollar (Acala)
aca-token	aca	ACA
accel-defi	accel	Accel Defi
accesslauncher	acx	AccessLauncher
access-protocol	acs	Access Protocol
ace-cash	acec	Ace Cash
aced	aced	Aced [OLD]
acent	ace	Acent
acestarter	astar	AceStarter
acetoken	ace	ACEToken
acet-token	act	Acet
ac-exchange-token	acxt	ACDX Exchange
achain	act	Achain
acknoledger	ack	AcknoLedger
ac-milan-fan-token	acm	AC Milan Fan Token
acoconut	ac	ACoconut
acoin	acoin	Acoin
acquire-fi	acq	Acquire.Fi
acreage-coin	acr	Acreage Coin
acria	acria	Acria.AI
across-protocol	acx	Across Protocol
acryptos	acs	ACryptoS
acryptosi	acsi	ACryptoSI
actinium	acm	Actinium
action-coin	actn	Action Coin
active-world-rewards-token	awrt	Active World Rewards
acute-angle-cloud	aac	Double-A Chain
acy-finance	acy	ACY Finance
adaboy	adaboy	ADABoy
adacash	adacash	ADAcash
adadao	adao	ADADao
adaflect	adaflect	ADAFlect
adalend	adal	Adalend
adam	adam	ADAM
adamant	addy	Adamant
adamant-messenger	adm	ADAMANT Messenger
adana-demirspor	demir	Adana Demirspor
adanaspor-fan-token	adana	Adanaspor Fan Token
adapad	adapad	ADAPad
adappter-token	adp	Adappter
adaswap	asw	AdaSwap
adax	adax	ADAX
adbank	adb	adbank
add-xyz-new	add	Add.xyz (NEW)
adene	aden	Adene
adex	adx	Ambire AdEx
ad-flex-token	adf	Ad Flex
aditus	adi	Aditus
admonkey	admonkey	AdMonkey
ado-network	ado	ADO.Network
adonis-2	adon	Adonis
adora-token	ara	Adora
adroverse	adr	Adroverse
adshares	ads	Adshares
adtoken	adt	adChain
adv3nture-xyz-gemstone	gem	Adv3nture.xyz Gemstone
advanced-internet-block	aib	Advanced Integrated Blocks
advanced-united-continent	auc	Advanced United Continent
advantis	advt	Advantis
adventure-gold	agld	Adventure Gold
adventurer-gold	gold	Adventurer Gold
adventure-token	twa	Adventure
advertise-coin	adco	Advertise Coin
aegis	ags	Aegis
aegis-launchpad	agspad	Aegis Launchpad
aelf	elf	aelf
aelin	aelin	Aelin
aelysir	ael	Aelysir
aen-smart-token	aens	AEN Smart
aeon	aeon	Aeon
aerarium-fi	aera	Aerarium Fi
aerdrop	aer	Aerdrop
aergo	aergo	Aergo
aerochain	aero-v2	Aerochain Coin V2
aeron	arnx	Aeron
aerotyne	atyne	Aerotyne
aerovek-aviation	aero	Aerovek Aviation
aeternity	ae	Aeternity
aetherius	aeth	Aetherius
aeur	aeur	AEUR
aezora	azr	Azzure
afen-blockchain	afen	AFEN Blockchain
affinity	afnty	Affinity
affyn	fyn	Affyn
afin-coin	afin	Asian Fintech
afkdao	afk	AFKDAO
afrep	afrep	Afrep
afreum	afr	Afreum
afrix	afx	Afrix
afrostar	afro	Afrostar
afyonspor-fan-token	afyon	Afyonspor Fan Token
aga-carbon-credit	agac	AGA Carbon Credit
aga-carbon-rewards	acar	AGA Carbon Rewards
agame	ag	AGAME
aga-rewards	edc	Edcoin
aga-rewards-2	agar	AGA Rewards
aga-token	aga	AGA
agavecoin	agvc	AgaveCoin
agave-token	agve	Agave
agenor	age	Agenor
ageofgods	aog	AgeOfGods
age-of-knights	gem	Age Of Knights
age-of-tanks	a.o.t	Age Of Tanks
age-of-zalmoxis-koson	koson	Age of Zalmoxis KOSON
ageur	ageur	agEUR
aggle-io	aggl	aggle.io
aggregated-finance	agfi	Aggregated Finance
agile	agl	Agile
agora-defi	agora	Agora Defi
agoras-currency-of-tau	agrs	Agoras: Currency of Tau
agoric	bld	Agoric
agpc	agpc	AGPC
agrello	dlt	Agrello
agricoin	agn	Agricoin
agrinoble	agn	Agrinoble
agrinode	agn	AgriNode
agrinovuscoin	agri	AgriNovusCoin
agro-global	agro	Agro Global
agronomist	agte	Agronomist
agx-coin	agx	AGX Coin
ahatoken	aht	AhaToken
a-hunters-dream	caw	A Hunters Dream
aibra	abr	AIBRA
aichain	ait	AICHAIN
aicon	aico	Aicon
aidcoin	aid	AidCoin
aidi-finance	aidi	Aidi Finance
aidi-inu	aidi	Aidi Inu
ai-doctor	aidoc	AI Doctor
aidos-kuneen	adk	Aidos Kuneen
ailink-token	ali	AiLink
aimedis-2	aimx	Aimedis
ai-network	ain	AI Network
ainu-token	ainu	Ainu
aion	aion	Aion
aioz-network	aioz	AIOZ Network
aipad	aipad	AIPad
aipro	aipro	AIPRO
airbloc-protocol	abl	Airbloc
aircoin-2	air	AirCoin
aircoins	airx	Aircoins
airight	airi	aiRight
airnft-token	airt	AirNFT
airpay	airpay	AirPay
airswap	ast	AirSwap
airtnt	airtnt	AirTnT
ai-smart-chain	aisc	Ai Smart Chain
aitravis	tai	AITravis
aiwork	awo	AiWork
ajeverse	aje	Ajeverse
ajuna-network	baju	Ajuna Network
akash-network	akt	Akash Network
aki-inu	aki	Aki Inu
akil-coin	akl	Akil Coin
akita-dao	hachi	Akita DAO
akita-inu	akita	Akita Inu
akita-inu-asa	akta	Akita Inu ASA
akitavax	akitax	Akitavax
akitsuki	aki	Akitsuki
akoin	akn	Akoin
akroma	aka	Akroma
akropolis	akro	Akropolis
akropolis-delphi	adel	Delphi
aktio	aktio	Aktio
aladdin-cvxcrv	acrv	Aladdin cvxCRV
aladdin-dao	ald	Aladdin DAO
alanyaspor-fan-token	ala	Alanyaspor Fan Token
alaya	atp	Alaya
albedo	albedo	ALBEDO
alcazar	alcazar	Alcazar
alchemist	mist	Alchemist
alchemix	alcx	Alchemix
alchemix-eth	aleth	Alchemix ETH
alchemix-usd	alusd	Alchemix USD
alchemy-pay	ach	Alchemy Pay
aldrin	rin	Aldrin
aleph	aleph	Aleph.im
alephium	alph	Alephium
aleph-zero	azero	Aleph Zero
alert	alert	ALERT
alethea-artificial-liquid-intelligence-token	ali	Artificial Liquid Intelligence
alex	alex	Alex
alexgo	alex	ALEX Lab
alfa-romeo-racing-orlen-fan-token	sauber	Alfa Romeo Racing ORLEN Fan Token
algebra	algb	Algebra
algoblocks	algoblk	AlgoBlocks
algodao	adao	AlgoDAO
algofund	algf	AlgoFund
algogems	gems	AlgoGems
algomint	gomint	Algomint
algopad	algopad	AlgoPad
algopainter	algop	AlgoPainter
algorand	algo	Algorand
algory	alg	Algory
algostable	stbl	AlgoStable
algostake	stke	AlgoStake
algovest	avs	AlgoVest
alibabacoin	abbc	ABBC
alibaba-tokenized-stock-defichain	dbaba	Alibaba Tokenized Stock Defichain
alien-chicken-farm	acf	Alien Chicken Farm
alien-inu	alien	Alien Inu
alienswap	alien	AlienSwap
alien-wars-gold	awg	Alien Wars Gold
alien-worlds	tlm	Alien Worlds
alita	ali	Alita
alitas	alt	Alitas
alium-finance	alm	Alium Finance
alkemi-network-dao-token	alk	Alkemi Network DAO
alkimi	$ads	Alkimi
all-art	aart	ALL.ART
all-best-ico-satoshi	allbi	All Best ICO
allbridge	abr	Allbridge
all-coins-yield-capital	acyc	All Coins Yield Capital
alldex-alliance	axa	Alldex Alliance
allianceblock	albt	AllianceBlock
alliance-fan-token	all	Alliance Fan Token
alliance-x-trading	axt	Alliance X Trading
all-in	allin	All In
allium-finance	alm	Allium Finance
all-me	me	All.me
alloy-project	xao	Alloy Project
allpaycoin	apcg	ALLPAYCOIN
allsafe	asafe	AllSafe
all-sports-2	soc	All Sports
allstars	asx	AllStars
all-time-high	ath	All Time High
alluo	alluo	Alluo
ally	aly	Ally
ally-direct	drct	Ally Direct
almond	alm	Almond
alnair-finance-nika	nika	Alnair Finance NIKA
alnassr-fc-fan-token	nassr	Alnassr FC Fan Token
aloha	aloha	Aloha
alongside-crypto-market-index	amkt	Alongside Crypto Market Index
alpaca	alpa	Alpaca City
alpaca-finance	alpaca	Alpaca Finance
alpha5	a5t	Alpha5
alpha-brain-capital-2	acap	Alpha Capital
alphacoin	alpha	AlphaCoin
alpha-coin	apc	Alpha Coin
alphadex	dex	AlphaDex
alpha-dex	roar	Alpha DEX
alphafi	alf	ALPHAFI
alpha-finance	alpha	Alpha Venture DAO
alpha-labz	$alpha	Alpha Labz
alphalink	ank	AlphaLink
alpha-pad	apad	Alpha Pad
alpha-quark-token	aqt	Alpha Quark
alpha-shares-v2	$alpha	Alpha Shares V2
alphatoken	.alpha	.Alpha
alphr	alphr	Alphr
alpine-f1-team-fan-token	alpine	Alpine F1 Team Fan Token
alrihla	alrihla	Alrihla
altair	air	Altair
altava	tava	ALTAVA
altbase	altb	Altbase
altcommunity-coin	altom	ALTOM
alter	alter	Alter
altered-state-token	asto	Altered State Machine
alternatemoney	am	AlternateMoney
altfins	afins	altFINS
altfolio	alt	altfolio
altimatum	$alti	Altimatum
altpay-finance	altpay	ALTPAY FINANCE
altrucoin-2	altrucoin	Altrucoin
altswitch	alts	AltSwitch
altura	alu	Altura
aluna	aln	Aluna
alvey-chain	walv	Alvey Chain
alyattes	alya	Alyattes
amasa	amas	Amasa
amaten	ama	Amaten
amateras	amt	Amateras
amaterasufi-izanagi	iza	AmaterasuFi Izanagi
amatsu-mikaboshi	mikaboshi	Amatsu-Mikaboshi
amaurot	ama	AMAUROT
amax-network	amax	AMAX Network
amazingdoge	adoge	AmazingDoge
amazingteamdao	amazingteam	AmazingTeamDAO
amazonacoin	amz	AmazonasCoin
amazon-tokenized-stock-defichain	damzn	Amazon Tokenized Stock Defichain
amazy	azy	Amazy
amazy-move-token	amt	Amazy Move Token
amber	amb	AirDAO
ambire-wallet	wallet	Ambire Wallet
amc-entertainment-preferred-tokenized-stock-on-ftx	apeamc	AMC Entertainment Preferred Tokenized Stock on FTX
amc-fight-night	amc	AMC Fight Night
amdg-token	amdg	AMDG
amepay	ame	AME Chain
american-shiba	ushiba	American Shiba
ameta	$aplus	AMETA
amgen	amg	Amgen
amis	amis	AMIS
amlp	amlp	aMLP
ammf	ammf	aMMF
ammyi-coin	ami	AMMYI Coin
amnext	amc	Amnext
amo	amo	AMO Coin
amon	amn	Amon
amond	amon	AmonD
amoveo	veo	Amoveo
ampleforth	ampl	Ampleforth
ampleforth-governance-token	forth	Ampleforth Governance
ampleswap	ample	AmpleSwap
amplifi	amplifi	AmpliFi
ampnet	aapx	AMPnet
amp-token	amp	Amp
amulet-staked-sol	amtsol	Amulet Staked SOL
amun-defi-index	dfi	Amun DeFi Index
amz-coin	amz	AMZ Coin
anarchy	anarchy	Anarchy
a-nation	anation	A-Nation
anchor-beth-token	beth	Anchor bETH Token
anchor-neural-world-token	anw	Anchor Neural World
anchor-protocol	anc	Anchor Protocol
anchorswap	anchor	AnchorSwap
anchorust	aust	AnchorUST
ancient-kingdom	dom	Ancient Kingdom
ancient-raid	raid	Ancient Raid
andronodes	andro	AndroNodes
anduschain	deb	Anduschain
angel-dust	ad	Angel Dust
angel-nodes	angel	Angel Nodes
angelscreed	angel	AngelsCreed
angle-protocol	angle	ANGLE
angola	agla	Angola
angryb	anb	Angryb
angry-doge	anfd	Angry Doge
anifi-world	anifi	AniFi World
animal-concerts-token	anml	Animal Concerts
animal-farm	afd	Animal Farm Dogs
animecoin	ani	Animecoin
anime-token	ani	Anime
animverse	anm	Animverse
aniverse	anv	Aniverse
anji	anji	Anji
ankaragucu-fan-token	anka	Ankaragücü Fan Token
ankr	ankr	Ankr Network
ankreth	ankreth	Ankr Staked ETH
ankr-reward-earning-matic	ankrmatic	Ankr Staked MATIC
ankr-staked-avax	ankravax	Ankr Staked AVAX
ankr-staked-bnb	ankrbnb	Ankr Staked BNB
anomus-coin	anom	Anomus Coin
anon	anon	ANON
anonfloki	anonfloki	AnonFloki
anon-inu	ainu	Anon Inu
anonydoxx	adxx	AnonyDoxx
anonymous-bsc	anon	Anonymous BSC
another-world	awm	Another World
anrkey-x	$anrx	AnRKey X
answer-governance	agov	Answer Governance
answerly	ansr	Answerly
antalyaspor	akrep	Antalyaspor
antedao	ante	AnteDAO
antex	antex	Antex
antfarm-governance-token	agt	Antfarm Governance Token
antfarm-token	atf	Antfarm Token
antgold	antg	AntGold
antiample	xamp	Antiample
antimatter	matter	AntiMatter
antnetworx	antx	AntNetworX
anubit	anb	Anubit
any-blocknet	ablock	ANY Blocknet
anypad	apad	Anypad
anyswap	any	Anyswap
aok	aok	AOK
aonea-coin	a1a	Aonea Coin
aos	aos	AOS
apass-coin	apc	APass Coin
apch	apch	APCH
ape	ape	APE
apecoin	ape	ApeCoin
apedoge	aped	Apedoge
ape-finance	apefi	Ape Finance
apefund	apefund	ApeFund
ape-fun-token	aft	Ape Fun
apegrow	apegrow	ApeGrow
ape-in	apein	Ape In
ape_in_records	air	Ape In Records
apejet	jet	ApeJet
ape-king	apk	Ape King
apemove	ape	APEmove
apenft	nft	APENFT
apeparkdao	apd	ApeParkDAO
ape-punk	ape$	APE Punk
apes-token	apes	Apes
apeswap-finance	banana	ApeSwap
ape-universe	apeu	Ape Universe
apeusd	apeusd	ApeUSD
apexit-finance	apex	ApeXit Finance
apex-predator	apex	Apex Predator
apex-protocol	apxp	APEX Protocol
apex-token-2	apex	ApeX
api3	api3	API3
apidae	apt	Apidae
apish-me	apish	Apish Me
apix	apix	APIX
apm-coin	apm	apM Coin
apocalypse	apoc	Apocalypse
apollo	apl	Apollo
apollo-coin	apx	Apollo Coin
apollo-crypto	apollo	Apollo Crypto
apollon-limassol	apl	Apollon Limassol Fan Token
apollox-2	apx	ApolloX
appcoins	appc	AppCoins
appics	apx	Appics
apple	apple	Apple
apple-binemon	amb	Apple (Binemon)
apple-fruit	apple	Apple Fruit
appleswap	apple	AppleSwap
apple-tokenized-stock-defichain	daapl	Apple Tokenized Stock Defichain
apricot	aprt	Apricot
april	april	April
aprobit	abt	Aprobit
apron	apn	Apron
aptoge	aptoge	Aptoge
aptos	apt	Aptos
aptos-launch-token	alt	AptosLaunch Token
apwine	apw	APWine
apy-finance	apy	APY.Finance
apyswap	apys	APYSwap
apy-vision	vision	APY.vision
aqar-chain	aqr	Aqar Chain
aquachain	aqua	Aquachain
aquadao	$aqua	AquaDAO
aqua-goat	aquagoat	Aqua Goat
aquanee	aqdc	Aquanee
aquari	aquari	Aquari
aquarius	aqua	Aquarius
aquariuscoin	arco	AquariusCoin
aquarius-fi	aqu	Aquarius.Fi
aquatank	aqua	AquaTank
aqua-unicorn	auni	Aqua Unicorn
arabella	ablc	ARABELLA
arabian-doge	$adoge	Arabian Doge
arabic	abic	Arabic
arable-protocol	acre	Arable Protocol
arable-usd	arusd	Arable USD
aragon	ant	Aragon
arata	arata	Arata
ara-token	ara	Ara
arbidex	abx	Arbidex
arbidoge	adoge	ArbiDoge
arbinu	arbinu	ArbInu
arbinyan	nyan	ArbiNYAN
arbis-finance	arbis	Arbis Finance
arbismart-token	rbis	ArbiSmart
arbitrage-token	rbtr	Arbitrage Token
arb-protocol	arb	ARB Protocol
arbucks	buck	Arbucks
arbys	arbys	Arbys
arc	arc	Arc
arcade	arc	Arcade
arcade2earn	arcade	Arcade2Earn
arcade-canine	okinu	Arcade Canine
arcade-kingdoms	ack	Arcade Kingdoms
arcadenetwork	arc	ArcadeNetwork
arcadia-token	$arc	Arcadia Token
arcadium	arcadium	Arcadium
arcblock	abt	Arcblock
arcc	arcc	ARCC
arc-finance	arc	Arc Finance
archangel-token	archa	ArchAngel
arch-blockchains	chain	Arch Blockchains
archer-dao-governance-token	arch	Archer DAO Governance
arch-ethereum-web3	web3	Arch Ethereum Web3
archethic	uco	Archethic
archie-neko	archie	Archie Neko
archive-ai	archai	Archive AI
archloot	alt	ArchLoot
arcona	arcona	Arcona
arcs	arx	ARCS
arcticcoin	arc	Advanced Technology Coin
arc-token	arc	Arc Protocol
ardana	dana	Ardana
ardcoin	ardx	ArdCoin
ardor	ardr	Ardor
aree-shards	aes	Aree Shards
arenaplay	apc	ArenaPlay
arena-token	arena	ArenaSwap
arenum	arnm	Arenum
areon-network	area	Areon Network
ares-protocol	ares	Ares Protocol
argentine-football-association-fan-token	arg	Argentine Football Association Fan Token
argo	argo	ArGoApp
argo-2	argo	Argo
argo-finance	argo	Argo Finance
argon	argon	Argon
argonon-helium	arg	Argonon Helium
ari10	ari10	Ari10
aria-currency	ria	aRIA Currency
ariadne	ardn	Ariadne
arianee	aria20	Arianee
aries-financial-token	afib	Aries Financial
arion	arion	Arion
arionum	aro	Arionum
ari-swap	ari	Ari Swap
ariva	arv	Ariva
arix	arix	Arix
arize	arz	ARize
ark	ark	ARK
arkadiko-usda	usda	Arkadiko USDA
arkania-protocol	ania	Arkania Protocol
arkarus	aks	Arkarus
arker-2	arker	Arker
auditchain	audt	Auditchain
ark-innovation-etf-defichain	darkk	ARK Innovation ETF Defichain
ark-rivals	arkn	Ark Rivals
arkworld	akw	ArkWorld
armor	armor	ARMOR
armor-nxm	arnxm	Armor NXM
army-node-finance	army	Army Node Finance
arnoya-classic	arnc	Arnoya classic
arora	aror	Arora
arowana-token	arw	Arowana
arpa	arpa	ARPA
arqma	arq	ArQmA
arrow	arw	Arrow
arsenal-fan-token	afc	Arsenal Fan Token
artax	xax	ARTAX
artbyte	aby	ArtByte
artcoin	ac	ArtCoin
arte	arte	ARTE
artem	artem	Artem
artemis	mis	Artemis
artemis-vision	arv	Artemis Vision
arteq-nft-investment-fund	arteq	artèQ NFT Investment Fund
artery	artr	Artery
artfinity-token	at	Artfinity
art-gobblers-goo	goo	Art Gobblers Goo
arth	arth	ARTH
arthswap	arsw	ArthSwap
artic-foundation	artic	ARTIC Foundation
articoin	atc	ArtiCoin
artificial-intelligence	ai	Artificial Intelligence
artificial-intelligence-technology-network	aitn	Artificial Intelligence Technology Network
artii-token	artii	ARTII
artik	artk	Artik
arti-project	arti	Arti Project
artizen	atnt	Artizen
artkit	arti	ArtKit
artl	artl	ARTL
artm	artm	ARTM
artmeta	$mart	ArtMeta
artonline	art	ArtOnline
artrade	atr	Artrade
artube	att	Artube
artx	artx	ARTX
arweave	ar	Arweave
aryacoin	aya	Aryacoin
asan-verse	asan	ASAN VERSE
ascension	asn	Ascension
ascension-protocol	ascend	Ascension Protocol
asd	asd	AscendEx
asgard-games	asg	Asgard Games
asgardian-aereus	volt	Asgardian Aereus
ash	ash	ASH
ashera	ash	Ashera
ashswap	ash	AshSwap
ash-token	ash	Ash Token
asia-coin	asia	Asia Coin
asic-token	asic	ASIC Token
asimi	asimi	ASIMI
asix	asix	ASIX
asixplus	asix+	AsixPlus
askobar-network	asko	Asko
as-monaco-fan-token	asm	AS Monaco Fan Token
aspire	asp	Aspire
aspo-world	aspo	ASPO World
as-roma-fan-token	asr	AS Roma Fan Token
assangedao	justice	AssangeDAO
assaplay	assa	AssaPlay
assemble-protocol	asm	Assemble Protocol
assent-protocol	asnt	Assent Protocol
assetmantle	mntl	AssetMantle
asta	asta	ASTA
astar	astr	Astar
aster	atc	Aster
ast-finance	ast	AST.finance
aston-martin-cognizant-fan-token	am	Aston Martin Cognizant Fan Token
aston-villa-fan-token	avl	Aston Villa Fan Token
astra-dao	astra	Astra DAO
astrafer	astrafer	Astrafer
astra-guild-ventures	agv	Astra Guild Ventures
astrals-glxy	glxy	Astrals GLXY
astra-nova	$rvv	Astra Nova
astrapad	astra	AstraPad
astra-protocol-2	astra	Astra Protocol
astrazion	aznt	AstraZion
astriddao-token	atid	AstridDAO
astro-babies	abb	Astro Babies
astrobirdz	abz	AstroBirdz
astro-cash	astro	Astro Cash
astrodonkey	dnky	AstroDonkey
astroelon	elonone	AstroElon
astrogrow	atg	AstroGrow
astronaut	naut	Astronaut
astroport	astroc	Astroport Classic
astroport-fi	astro	Astroport.fi
astrospaces-io	spaces	AstroSpaces.io
astroswap	astro	AstroSwap
astrotools	astro	AstroTools
astro-verse	asv	Astro Verse
asuna-inu	asunainu	Asuna Inu
asva	asva	Asva Labs
asward-coin	asc	Ashward Coin
asyagro	asy	ASYAGRO
atari	atri	Atari
atbcoin	atb	ATBCoin
atheios	ath	Atheios
athenas	athenasv2	Athenas
atheneum	aem	Atheneum
athens	ath	Athens
ath-games	athd	ATH Games
athos-finance	ath	Athos Finance
athos-finance-usd	athusd	Athos Finance USD
athos-meta	atm	Athos Meta
atlantis	atlas	Atlantis
atlantis-coin	atc	Atlantis Coin
atlantis-finance	atls	Atlantis Finance
atlantis-loans	atl	Atlantis Loans
atlantis-loans-polygon	atlx	Atlantis Loans Polygon
atlantis-metaverse	tau	Atlantis Metaverse
atlantis-token	atis	Atlantis ATIS
atlantis-universe-money	aum	Atlantis Universe Money
atlas-dex	ats	Atlas DEX
atlas-fc-fan-token	atlas	Atlas FC Fan Token
atlas-navi	navi	Atlas Navi
atlas-protocol	atp	Atlas Protocol
atlas-usv	usv	Atlas USV
atletico-madrid	atm	Atletico Madrid Fan Token
atmos	atmos	Atmos
atomic-wallet-coin	awc	Atomic Wallet Coin
atompad	atpad	AtomPad
atpay	atpay	AtPay
atrollcity	pine	Atrollcity
atromg8	ag8	ATROMG8
attack-wagon	atk	Attack Wagon
attila	att	Attila
attrace	attr	Attrace
auction	auction	Bounce
auctus	auc	Auctus
audiocoin	adc	AudioCoin
audius	audio	Audius
audius-wormhole	audio	Audius (Wormhole)
augmented-finance	agf	Augmented Finance
augur	rep	Augur
augury-finance	omen	Augury Finance
aura-bal	aurabal	Aura BAL
aura-finance	aura	Aura Finance
aura-network	aura	Aura Network
aureo	aur	AUREO
aureus-nummus-gold	ang	Aureus Nummus Gold
auric-network	auscm	Auric Network
aurigami	ply	Aurigami
aurix	aur	Aurix
aurora	aoa	Aurora Chain
auroracoin	aur	Auroracoin
aurora-dao	idex	IDEX
aurora-near	aurora	Aurora
auroratoken	aurora	AuroraToken
aurora-token	$adtx	Aurora Dimension
aurory	aury	Aurory
aurusx	ax	AurusX
ausdc	ausdc	SpaceShipX aUSDC
australian-crypto-coin-green	accg	Australian Crypto Coin Green
australian-safe-shepherd	ass	Australian Safe Shepherd
autentica	aut	Autentica
authencity	auth	Authencity
auto	auto	Auto
autobahn-network	txl	Autobahn Network
autocrypto	au	AutoCrypto
automata	ata	Automata
autominingtoken	amt	AutoMiningToken
autonio	niox	Autonio
autoshark	jaws	AutoShark
autosingle	autos	AutoSingle
auto-staked-alex	atalex	Auto Staked ALEX
autumn	autumn	Autumn
aux-coin	aux	AUX Coin
auxilium	aux	Auxilium
avadex-token	avex	AvaDex Token
avalanche-2	avax	Avalanche
avalanche-hills	ahill	Avalanche Hills
avalanche-wormhole	avax	Avalanche (Wormhole)
avalaunch	xava	Avalaunch
avaocado-dao	avg	Avocado DAO
avapay	avapay	AvaPay
avara	avr	AVARA
avastr-vault-nftx	avastr	AVASTR Vault (NFTX)
avata-network	avat	AVATA Network
avatara-nox	nox	AVATARA NOX
avaterra	terra	Avaterra
avatly	ava	Avatly
avaware	ave	Avaware
avaxlauncher	avxl	Avaxlauncher
avaxtars	avxt	Avaxtars
avefarm	ave	AveFarm
aventus	avt	Aventus
avenue-hamilton-token	aht	Avenue Hamilton Token
avenue-university-token	aut	Avenue University Token
avian-network	avn	AVIAN
avinoc	avinoc	AVINOC
avme	avme	AVME
avnrich	avn	AVNRich
avocado	avo	Avocado
avocadocoin	avdo	AvocadoCoin
avoteo	avo	Avoteo
avweth	avweth	avWETH
axe	axe	Axe
axel	axel	AXEL
axelar	axl	Axelar
axia	axiav3	Axia
axial-token	axial	Axial Token
axie-infinity	axs	Axie Infinity
axie-infinity-shard-wormhole	axset	Axie Infinity Shard (Wormhole)
axioms	axi	Axioms
axion	axn	Axion
axis-defi	axis	Axis DeFi
axis-token	axis	AXIS
axle-games	axle	Axle Games
axl-inu	axl	AXL INU
axlusdc	axlusdc	Axelar USDC
axlwbtc	axlwbtc	axlWBTC
axlweth	axlweth	axlWETH
axpire	axpr	Moola
azacoin	aza	AzaCoin
azbit	az	Azbit
azit	azit	azit
aztec-nodes-sun	sun	Aztec Nodes SUN
azuki	azuki	Azuki
azuma-coin	azum	Azuma Coin
az-world-socialfi	azw	AZ World SocialFi
b20	b20	B20
b21	b21	B21
b8dex	b8t	B8DEX
baanx	bxx	Baanx
baasid	baas	BaaSid
babacoin	bbc	Babacoin
babb	bax	BABB
babil-token	babil	BABIL TOKEN
baboon-financial	boon	Baboon Financial
baby-ada	babyada	Baby ADA
baby-alvey	balvey	Baby Alvey
babyapefunclub	bafc	BabyApeFunClub
baby-bali	bb	Baby Bali
baby-bitburnreflect	bbbr	Baby BitBurnReflect
baby-bitcoin	bbtc	Baby Bitcoin
babybnb	babybnb	BabyBNB
babyboo	babyboo	BabyBoo
baby-boxer	bboxer	Baby Boxer
babybusd	babybusd	BabyBUSD
baby-cake	babycake	Baby Cake
baby-catcoin	babycats	Baby Catcoin
baby-cheems-inu	bci	Baby Cheems Inu
babydogecake	bdc	BabyDogeCake
baby-doge-cash	babydogecash	Baby Doge Cash
baby-doge-coin	babydoge	Baby Doge Coin
babydoge-coin-eth	babydoge	BabyDoge ETH
baby-doge-inu	$babydogeinu	Baby Doge Inu
baby-doge-money-maker	babydogemm	Baby Doge Money Maker
babydogezilla	babydogezilla	BabyDogeZilla
baby-dogo-coin	babydogo	Baby Dogo Coin
babydot	bdot	BabyDot
baby-doug	babydoug	Baby Doug
babyeth	babyeth	BabyEth
babyethereum	bbeth	BabyEthereum
baby-everdoge	baby everdoge	Baby EverDoge
babyfeg	bbfeg	Babyfeg
babyfloki	babyfloki	BabyFloki
baby-floki	babyfloki	Baby Floki
baby-floki-coin	babyflokicoin	Baby Floki Coin
baby-floki-doge	babyfd	Baby Floki Doge
baby-floki-inu	bfloki	Baby Floki Inu
babyfootball	cup	BabyFootball
baby-fps-token	bfps	Baby FPS
baby-g	babyg	Baby G
baby-kishu	babykishu	Baby Kishu
babykitty	babykitty	BabyKitty
babykraken	krakbaby	BabyKraken
baby-kshark	bks	Baby KShark
baby-lambo-inu	blinu	Baby Lambo Inu
babyllama	babyllama	Babyllama
babylon-finance	babl	Babylon Finance
babylons	babi	Babylons
baby-loop	bloop	Baby Loop
baby-lovely-inu	blovely	Baby Lovely Inu
baby-moon-floki	floki	Baby Moon Floki
babyokx	babyokx	BABYOKX (BSC)
babyokx-2	babyokx	BABYOKX
baby-panda	bpanda	Baby Panda
baby-pig-token	babypig	Baby Pig
baby-pokemoon	bpm	Baby Pokemoon
babypumpkin-finance	bump	BabyPumpkin Finance
babyquick	babyquick	BabyQuick
babyrabbit	babyrabbit	Babyrabbit
baby-ripple	babyxrp	Baby Ripple
baby-saitama	babysaitama	Baby Saitama
baby-samo-coin	baby	Baby Samo Coin
baby-satoshi	sats	Baby Satoshi
baby-shark	shark	Baby Shark
baby-shark-tank	bashtank	Baby Shark Tank
baby-shiba-coin	babyshiba	Baby Shiba Coin
baby-shiba-inu	babyshibainu	Baby Shiba Inu
babyshibby-inu	babyshib	BabyShibby Inu
baby-soulja-boy	draco	Baby Soulja Boy
babyswap	baby	BabySwap
baby-tether	babytether	BABY TETHER
babytigergold	babytiger	BabyTigerGold
baby-trump	babytrump	Baby Trump
baby-uniwswap	$buniw	Baby Uniwswap
babywhale	bbw	BabyWhale
baby-woj	bwj	Baby WOJ
babyxrp	bbyxrp	BabyXrp
babyzoro-inu	babyzoroinu	Babyzoro Inu
backed-protocol	bakt	Backed Protocol
bacon-coin	bacon	Bacon Coin
bacondao	bacon	BaconDAO
bacon-protocol-home	home	Bacon Protocol Home
baconswap	bacon	BaconSwap
baddest-alpha-ape-bundle	aped	Baddest Alpha Ape Bundle
badger-dao	badger	Badger DAO
badger-sett-badger	bbadger	Badger Sett Badger
badger-sett-digg	bdigg	Badger Sett Digg
baepay	baepay	BAEPAY
bafe-io	bafe	Bafe.io
bafi-finance-token	bafi	Bafi Finance
bagus-wallet	bg	Bagus Wallet
bahtcoin	bht	Bahtcoin
bai-stablecoin	bai	BAI Stablecoin
baitcoin	bait	Baitcoin
baj	bjt	BAJ
bakc-vault-nftx	bakc	BAKC Vault (NFTX)
bake-coin	bakecoin	Bake Coin
baked-token	baked	Baked
bakerytoken	bake	BakerySwap
bakerytools	tbake	BakeryTools
baklava	bava	Baklava
balanced-dollars	bnusd	Balanced Dollars
balance-network	bln	Balance Network
balancer	bal	Balancer
balancer-80-bal-20-weth	b-80bal-20weth	Balancer 80 BAL 20 WETH
balancer-boosted-aave-dai	bb-a-dai	Balancer Boosted Aave DAI
balancer-boosted-aave-usdc	bb-a-usdc	Balancer Boosted Aave USDC
balancer-boosted-aave-usdt	bb-a-usdt	Balancer Boosted Aave USDT
balance-tokens	baln	Balanced Network
balicoin	bali	Bali Coin
balikesirspor-token	blks	Balıkesirspor Token
balisari	bst	Balisari
bali-social-integrated	bsi	Bali Social Integrated
bali-token	bli	Bali Token
balkari-token	bkr	Balkari
ball-coin	ball	BALL Coin
balloonsville-air	air	Balloonsville AIR
ballswap	bsp	BallSwap
ball-token	ball	Ball
balpha	balpha	bAlpha
balto-token	balto	Balto Token
bamboo-coin	bmbo	Bamboo Coin
bamboo-defi	bamboo	BambooDeFi
bamboonium	bamb	Bamboonium
bami	bami	Bami
banana	banana	Banana
banana-bucks	bab	Banana Bucks
bananaclubtoken	bct	BananaClubToken
banana-finance	banana	Banana Finance
banana-index	bandex	Banana Index
banana-task-force-ape	btfa	Banana Task Force Ape
bananatok	bna	BananaTok
banana-token	bnana	Chimpion
banano	ban	Banano
banca	banca	Banca
bancambios-ax	bxs	Bancambios AX
bancor	bnt	Bancor Network
bancor-governance-token	vbnt	Bancor Governance
band-protocol	band	Band Protocol
bankera	bnk	Bankera
bankers-dream	bank$	Bankers Dream
banketh	banketh	BankEth
bankless-bed-index	bed	Bankless BED Index
bankless-dao	bank	Bankless DAO
bankless-defi-innovation-index	gmi	Bankless DeFi Innovation Index
bankroll-extended-token	bnkrx	Bankroll Extended
bankroll-network	bnkr	Bankroll Network
bankroll-vault	vlt	Bankroll Vault
banksocial	bsl	BankSocial
bantu	xbn	Bantu
bao	bao	BAO
bao-finance	bao	Bao Finance
bao-finance-v2	bao	Bao Finance V2
baousd	baousd	baoUSD
barbecueswap	bbq	BarbecueSwap
barfight	bfight	BARFIGHT
barking	bark	Barking
barnbridge	bond	BarnBridge
barter	brtr	Barter
bartertrade	bart	BarterTrade
basan	basan	Basan
based-finance	based	Based Finance
based-shares	bshare	BASED Shares
based-token	bdc	Based
base-protocol	base	Base Protocol
basic	basic	BASIC
basic-attention-token	bat	Basic Attention
basid-coin	basid	Basid Coin
basilisk	bsx	Basilisk
basis-cash	bac	Basis Cash
basis-dollar-share	bsds	Basis Dollar Share
basis-gold-share-heco	bags	Basis Gold Share (Heco)
basis-markets	basis	basis.markets
basis-share	bas	Basis Share
basketball-legends	bbl	Basketball Legends
basketcoin	bskt	BasketCoin
basketdao	bask	BasketDAO
baskonia-fan-token	bkn	Baskonia Fan Token
bastion-protocol	bstn	Bastion Protocol
bata	bta	Bata
batorrent	ba	BaTorrent
battle-esports-coin	bes	battle esports coin
battlefly	gfly	BattleFly
battle-for-giostone	bfg	Battle For Giostone
battleforten	bft	BattleForTEN
battle-hero	bath	Battle Hero
battle-infinity	ibat	Battle Infinity
battle-of-guardians-share	bgs	Battle of Guardians Share
battle-pets	pet	Battle Pets
battle-saga	btl	Battle Saga
battleverse	bvc	BattleVerse
battle-world	bwo	Battle World
bayc-vault-nftx	bayc	BAYC Vault (NFTX)
baymax-finance	bay	BayMax Finance
bazaars	bzr	Bazaars
bb-gaming	bb	BB Gaming
bbscoin	bbs	BBSCoin
bbs-network	bbs	BBS Network
bcpay-fintech	bcpay	BCPAY FinTech
b-cube-ai	bcube	B-cube.ai
bdlt	bdlt	BDLT
bdollar	bdo	bDollar
beach-token	beach	Beach Token
beacon	becn	Beacon
beagle-inu	bic	Beagle Inu
beam	beam	BEAM
beamswap	glint	BeamSwap
bean	bean	Bean
bean-cash	bitb	Bean Cash
bearex	brex	BeaRex
beast-masters	master	Beast Masters
beatzcoin	btzc	BeatzCoin
beauty-bakery-linked-operation-transaction-technology	lott	Beauty Bakery Linked Operation Transaction Technology
beavis-and-butthead	bbh	Beavis and Butthead
becoswap-token	beco	BecoSwap
bedrock	rock	Bedrock
bee-capital	bee	Bee Capital
beechat	chat	BeeChat
beeco	bgc	Bee Token
beefy-escrowed-fantom	beftm	Beefy Escrowed Fantom
beefy-finance	bifi	Beefy.Finance
beenode	bnode	Beenode
beep	botz	Beep
beer-money	beer	Beer Money
beeruscat	bcat	BeerusCat
beethoven-x	beets	Beethoven X
beetlecoin	beet	Beetlecoin
befasterholdertoken	bfht	BeFaster Holder Token
befitter	fiu	beFITTER
befitter-health	hee	beFITTER Health
be-gaming-coin	bgc	Be Gaming Coin
beholder	eye	Behodler
bela	aqua	Bela Aqua
beldex	bdx	Beldex
belecx-protocol	bex	BelecX Protocol
belifex	befx	Belifex
belka-2	blk	Belka
bella-protocol	bel	Bella Protocol
bellcoin	bell	Bellcoin
belrium	bel	Belrium
belt	belt	Belt
beluga-fi	beluga	Beluga.fi
bem	bemt	BEM
be-meta-famous	bmf	Be Meta Famous
bemil-coin	bem	Bemil Coin
benchmark-protocol	mark	Benchmark Protocol
benddao	bend	BendDAO
bened	bnd	Bened
benqi	qi	BENQI
benqi-liquid-staked-avax	savax	BENQI Liquid Staked AVAX
bent-finance	bent	Bent Finance
benzene	bzn	Benzene
bep20-leo	bleo	BEP20 LEO
bepay	becoin	bePAY Finance
bepis	bepis	BEPIS
bepro-network	bepro	BEPRO Network
bergerdoge	bergerdoge	BergerDoge
bermuda	bmda	Bermuda
berry	berry	Berry
berry-data	bry	Berry Data
berryswap	berry	BerrySwap
berylbit	brb	BerylBit
beshare-token	bst	Beshare
beskar	bsk-baa025	Beskar
bestay	bsy	Bestay
beta-finance	beta	Beta Finance
beta-token	beta	Beta
betaverse	bet	Betaverse
betcoin	bet	BETCOIN
betero	bte	Betero
betgosu	gosu	BetGosu
betller-coin	btllr	Betller Coin
betswap-gg	bsgg	Betswap.gg
betswirl	bets	BetSwirl
betterfan	bff	BetterFan
betterment-digital	bemd	Betterment Digital
better-money	better	Better Money
betu	betu	Betu
beyondcoin	bynd	Beyondcoin
beyond-finance	byn	Beyondfi
beyondpay	bpay	Beyondpay
beyond-protocol	bp	Beyond Protocol
bezant	bznt	Bezant
bezoge-earth	bezoge	Bezoge Earth
bfg-token	bfg	BetFury
bficoin	bfic	Bficoin
bfk-warzone	bfk	BFK WARZONE
bgan-vault-nftx	bgan	BGAN Vault (NFTX)
bhbd	bhbd	bHBD
bhive	bhive	bHIVE
bhnetwork	bhat	BHNetwork
bho-network	bho	BHO Network
biblecoin	bibl	Biblecoin
biblepay	bbp	BiblePay
bibox-token	bix	Bibox
bib-token	bib	BIB Token
biconomy	bico	Biconomy
biconomy-exchange-token	bit	Biconomy Exchange
bictory-finance	bt	Bictory Finance
bicyclefi	bcf	BicycleFi
bidao	bid	Bidao
bidipass	bdp	BidiPass
bidz-coin	bidz	BIDZ Coin
bifi	bifi	BiFi
bifrost	bfc	Bifrost
bifrost-native-coin	bnc	Bifrost Native Coin
bigbang-core	bbc	BigBang Core
bigbang-game	bbgc	BigBang Game
big-crypto-game	crypto	Big Crypto Game
big-data-protocol	bdp	Big Data Protocol
big-defi-energy	bde	Big Defi Energy
big-digital-shares	bds	Big Digital Shares
big-dog-coin	bdog	Big Dog Coin
bigfoot	foot	BIGFOOT
biggerminds	mind+	BiggerMINDS
big-league	bglg	Big League
bigo-token	bigo	BIGOCOIN
bigshortbets	bigsb	BigShortBets
big-turn	turn	Big Turn
bigwinner	big	Bigwinner
biitgatti	bitgatti	Bitgatti
bikerush	brt	Bikerush
bilira	tryb	BiLira
billiard-crypto	bic	Billiard Crypto
billionaire-plus	bplus	Billionaire Plus
billionhappiness	bhc	BillionHappiness
bill-murray-inu	$bminu	Bill Murray Inu
bill-token	bill	Bill
binahero	hero	BinaHero
binamon	bmon	Binamon
binance-bitcoin	btcb	Binance Bitcoin
binancecoin	bnb	BNB
binance-coin-wormhole	bnb	Binance Coin (Wormhole)
binance-eth	beth	Binance ETH staking
binanceidr	bidr	BIDR
binance-multi-chain-capital	bmcc	Binance Multi-Chain Capital
binance-peg-avalanche	avax	Binance-Peg Avalanche
binance-peg-bitcoin-cash	bch	Binance-Peg Bitcoin Cash
binance-peg-cardano	ada	Binance-Peg Cardano
binance-peg-dogecoin	doge	Binance-Peg Dogecoin
binance-peg-eos	eos	Binance-Peg EOS
binance-peg-filecoin	fil	Binance-Peg Filecoin
binance-peg-firo	firo	Binance-Peg Firo
binance-peg-iotex	iotx	Binance-Peg IoTeX
binance-peg-litecoin	ltc	Binance-Peg Litecoin
binance-peg-ontology	ont	Binance-Peg Ontology
binance-peg-polkadot	dot	Binance-Peg Polkadot
binance-peg-xrp	xrp	Binance-Peg XRP
binance-smart-chain-girl	bscgirl	Binance Smart Chain Girl
binance-usd	busd	Binance USD
binance-wrapped-btc	bbtc	Binance Wrapped BTC
binance-wrapped-dot	bdot	Binance Wrapped DOT
binapet	bpet	Binapet
binarydao	byte	BinaryDAO
binaryx	bnx	BinaryX
bincentive	bcnt	Bincentive
binemon	bin	Binemon
bingdwendwen	bingdwendwen	BingDwenDwen
bingo	$bingo	Tomorrowland
binjit-coin	bnj	Binjit Coin
binopoly	bino	Binopoly
binspirit	binspirit	binSPIRIT
binstarter	bsr	BinStarter
bintex-futures	bntx	Bintex Futures
biokkoin	bkkg	Biokkoin
biometric-financial	biofi	BiometricFinancial
biopassport	biot	Bio Passport
bios	bios	0x_nodes
birake	bir	Birake
birb-2	birb	Birb
birdchain	bird	Birdchain
bird-money	bird	Bird.Money
birdtoken	birdtoken	birdToken
bishu-finance	bishufi	Bishu Finance
bismuth	bis	Bismuth
bistroo	bist	Bistroo
biswap	bsw	Biswap
biswap-token	biswap	Biswap Token
bit	bit	Bit
bit2me	b2m	Bit2Me
bitant	bitant	BitANT
bitazza	btz	Bitazza
bitball	btb	Bitball
bitball-treasure	btrs	Bitball Treasure
bitbar	btb	Bitbar
bitbase-token	btbs	BitBase Token
bitberry-token	bbr	Bitberry
bitblocks-fire	bfire	Bitblocks Fire
bitbook-token	bbt	BitBook
bitboost	bbt	BitBoost
bitbox-classic	cbitbox	Bitbox Classic
bitburn	burn	Bitburn
bitcanna	bcna	BitCanna
bitcash	bitc	BitCash
bitcastle	castle	bitcastle
bit-castle-war	bcw	Bit Castle War
bitcci-cash	bitcca	Bitcci Cash
bitcicoin	bitci	Bitcicoin
bitci-racing-token	brace	Bitci Racing Token
bitclave	cat	BitClave
bitcoin	btc	Bitcoin
bitcoin-2	btc2	Bitcoin 2
bitcoin-adult	btad	Bitcoin Adult
bitcoin-and-ethereum-standard-token	best	Bitcoin and Ethereum Standard
bitcoin-anonymous	btca	Bitcoin Anonymous
bitcoin-asia	btca	Bitcoin Asia
bitcoin-asset-2	bta	Bitcoin Asset
bitcoin-atom	bca	Bitcoin Atom
bitcoin-avalanche-bridged-btc-b	btc.b	Bitcoin Avalanche Bridged (BTC.b)
bitcoinbam	btcbam	BitcoinBam
bitcoin-bep2	btcb	Bitcoin BEP2
bitcoin-cash	bch	Bitcoin Cash
bitcoin-cash-sv	bsv	Bitcoin SV
bitcoin-city-coin	bcity	Bitcoin City Coin
bitcoin-confidential	bc	Bitcoin Confidential
bitcoin-diamond	bcd	Bitcoin Diamond
bitcoin-e-wallet	bitwallet	Bitcoin E-wallet
bitcoin-fast	bcf	Bitcoin Fast
bitcoin-free-cash	bfc	Bitcoin Free Cash
bitcoin-god	god	Bitcoin God
bitcoin-gold	btg	Bitcoin Gold
bitcoin-green	bitg	Bitcoin Green
bitcoin-hd	bhd	Bitcoin HD
bitcoin-hot	bth	Bitcoin Hot
bitcoin-international	btci	Bitcoin International
bitcoin-latinum	ltnm	Bitcoin Latinum
bitcoin-legend	bcl	Bitcoin Legend
bitcoin-lightning	bltg	Block-Logic
bitcoinmoney	bcm	BitcoinMoney
bitcoinmono	btcmz	BitcoinMono
bitcoin-one	btcone	BitCoin One
bitcoin-pay	btcpay	Bitcoin Pay
bitcoin-plus	xbc	Bitcoin Plus
bitcoinpos	btcs	BitcoinPoS
bitcoin-private	btcp	Bitcoin Private
bitcoin-pro	btcp	Bitcoin Pro
bitcoin-red	btcred	Bitcoin Red
bitcoin-scrypt	btcs	Bitcoin Scrypt
bitcoinsov	bsov	BitcoinSoV
bitcoin-subsidium	xbtx	Bitcoin Subsidium
bitcoin-trc20	btct	Bitcoin TRC20
bitcoin-trust	bct	Bitcoin Trust
bitcointry-token	btty	Bitcointry Token
bitcoin-ultra	btcu	BitcoinUltra
bitcoinv	btcv	BitcoinV
bitcoin-vault	btcv	Bitcoin Vault
bitcoin-volatility-index-token	btcv	Bitcoin Volatility Index Token
bitcoinx	bcx	BitcoinX
bitcoinx-2	btcx	BitcoinXGames
bitcoinz	btcz	BitcoinZ
bitcoiva	bca	Bitcoiva
bitcolojix	btcix	BITCOLOJIX
bitcomine	bme	BitcoMine
bitcomo	bm	Bitcomo
bitconey	bitconey	BitConey
bitconnect	bcc	Bitconnect
bitcore	btx	BitCore
bitcrex-coin	bic	Bitcrex Coin
bitdao	bit	BitDAO
bitdegree	bdg	BitDegree
bitdoge	bdoge	BitDoge
bitdollars	btcd	Bitdollars
bitenium-token	bt	Bitenium
bitfex-2	bce	Bitfex
bitflowers	petal	bitFlowers
bitforex	bf	Bitforex
bit-game-verse-token	bgvt	Bit Game Verse Token
bitgear	gear	Bitgear
bitgem	xbtg	Bitgem
bitget-token	bgb	Bitget Token
bitguild	plat	BitGuild PLAT
bithachi	bith	Bithachi
bithashex	bhax	Bithashex
bithash-token	bt	BitHash
bit-hotel	bth	Bit Hotel
bitica-coin	bdcc	BITICA COIN
bitindi-chain	bni	Bitindi Chain
bitjob	stu	bitJob
bitkub-coin	kub	Bitkub Coin
bitlevex	blex	Bitlevex
bitlocus	btl	Bitlocus
bitmark	marks	Bitmark
bitmart-token	bmx	BitMart
bitmex-token	bmex	BitMEX
bit-miner-chain	btmc	Bit Miner Chain
bitmon	bit	Bitmon
bitnautic	btntv2	BitNautic
bito-coin	bito	BITO Coin
bitone	bio	BITONE
bitonyx-token	btnyx	BitOnyx
bitorbit	bitorb	BitOrbit
bitoreum	btrm	Bitoreum
bitpaid-token	btp	Bitpaid
bitpanda-ecosystem-token	best	Bitpanda Ecosystem
bit-public-talent-network	bptn	Bit Public Talent Network
bitrent	rntb	BitRent
bit-rides	rides	Bit Rides
bitrise-token	brise	Bitgert
bitroncoin	btrn	BitronCoin
bitrue-token	btr	Bitrue Coin
bitscrow	btscrw	Bitscrow
bitshares	bts	BitShares
bitshark	btshk	Bitshark
bitshiba	shiba	BitShiba
bitsong	btsg	BitSong
bitsonic-token	bsc	Bitsonic
bitspawn	spwn	Bitspawn
bitstake	xbs	BitStake
bitsten-token	bst	Bitsten [OLD]
bit-store-coin	store	Bit Store
bitsubishi	bitsu	Bitsubishi
bitsum	mat	Matka
bitswift	bits	Bitswift
bittensor	tao	Bittensor
bitto-exchange	bitto	BITTO
bittoken	bitt	BITT
bittokens	bxt	BitTokens
bittorrent	btt	BitTorrent
bittorrent-old	bttold	BitTorrent [OLD]
bittube	tube	BitTube
bittwatt	bwt	Bittwatt
bitvalley	bitv	BitValley
bitvalve-2	btv	BitValve
bitvote	btv	Bitvote
bitwhite	btw	BitWhite
bitwin24	bwi	Bitwin24
bitz	bitz	bitz
bitzen	bzen	Bitzen
bitzipp	bzp	BitZipp
bixb-coin	bixb	BixB Coin
bizzcoin	bizz	BIZZCOIN
bkex-token	bkk	BKEX Chain
black-box	bbox	Black Box
blackcoin	blk	BlackCoin
black-diamond	diamonds	Black Diamond
black-dragon-society	bds	Black Dragon Society
blackdragon-token	bdt	BlackDragon
blackhat-coin	blkc	BlackHat Coin
blackhole-protocol	black	BlackHole Protocol
blackholeswap-compound-dai-usdc	bhsc	BlackHoleSwap-Compound DAI/USDC
black-label	klb	Black Label
blackpearl-chain	bplc	BlackPearl
black-phoenix	bpx	Black Phoenix
blackpool-token	bpt	BlackPool
blackswan-nodes	swan	BlackSwan Nodes
black-token	black	Black Token
black-whale	blk	Black Whale
blade	blade	BladeWarrior
blanc	blanc	Blanc
blank	blank	BlockWallet
blatform	bform	Blatform
blaze-network	blzn	Blaze Network
blazestake-staked-sol	bsol	BlazeStake Staked SOL
blind-boxes	bles	Blind Boxes
blin-metaverse	blin	Blin Metaverse
blithe	blt	Blithe
blitz-labs	blitz	Blitz Labs
blitzpredict	xbp	BlitzPick
blizzard	xblzd	Blizzard
blizzard-network	blizz	Blizzard Network
blizz-finance	blzz	Blizz Finance
blocery	bly	Blocery
block-ape-scissors	bas	Block Ape Scissors
blockasset	block	Blockasset
blockaura	tbac	BlockAura
blockbank	bbank	blockbank
blockbase	bbt	BlockBase
blockblend	bbl	BlockBlend
blockburn	burn	BlockBurn
blockcdn	bcdn	BlockCDN
blockchain-adventurers-guild	bag	Blockchain Adventurers Guild
blockchain-based-distributed-super-computing-platform	mbcc	Blockchain-Based Distributed Super Computing Platform
blockchain-bets	bcb	Blockchain Bets
blockchain-brawlers	brwl	Blockchain Brawlers
blockchain-certified-data-token	bcdt	EvidenZ
blockchain-cuties-universe	cute	Blockchain Cuties Universe
blockchain-cuties-universe-governance	bcug	Blockchain Cuties Universe Governance
blockchain-euro-project	bepr	Blockchain Euro Project
blockchain-exchange-alliance	bxa	Blockchain Exchange Alliance
blockchain-io	bcio	Blockchain.io
blockchain-monster-hunt	bcmc	Blockchain Monster Hunt
blockchain-of-hash-power	bhp	Blockchain of Hash Power
blockchainpoland	bcp	BlockchainPoland
blockchainspace	guild	BlockchainSpace
block-commerce-protocol	bcp	Block Commerce Protocol
block-creatures	moolah	Block Creatures
block-e	block-e	BLOCK-E
blockearth	blet	Blockearth
block-forest	bft	Block Forest
blockmason-credit-protocol	bcpt	Blockmason Credit Protocol
blockmason-link	blink	BlockMason Link
blockmax	ocb	BLOCKMAX
blockmine	gold nugget	Blockmine
block-monsters	mnstrs	Block Monsters
blocknet	block	Blocknet
blocknotex	bnox	BlockNoteX
blockpad	blos	Blockius
blockpass	pass	Blockpass
blockport	bux	BUX
blockportal	bptl	BlockPortal
blockrock	bro$	BlockRock
blocks	blocks	BLOCKS
blocksafu	bsafu	BlockSafu
blocksmith-labs-forge	$forge	Blocksmith Labs Forge
blockspace-token	bls	Blocks Space
blocksport	bspt	Blocksport
blocksquare	bst	Blocksquare
blockstack	stx	Stacks
blockster	bxr	Blockster
blockswap-network	cbsn	BlockSwap Network [OLD]
blockswap-network-2	bsn	Blockswap Network
blocksworkz	blkz	BlocksWorkz
blocktanium	bkt	Blocktanium
blockv	vee	BLOCKv
blockwrk	wrk	BlockWRK
blockx	bcx	BlockX
blockxpress	bx	BlockXpress
bloc-money	bloc	Bloc.Money
blocsport-one	bls	Metacourt
blocto-token	blt	Blocto
blokpad	bpad	BlokPad
bloktopia	blok	Bloktopia
bloody-bunny	bony	Bloody Bunny
bloom	blt	Bloom
bloomzed-token	blct	Bloomzed Loyalty Club Ticket
blossom	sakura	Blossom
blossomcoin	blosm	BlossomCoin
blowup	$blow	BlowUP
blox	cdt	Blox
bloxmove-erc20	blxm	bloXmove
blox-token	blox	Blox SDK
bluca	bluc	Bluca
blue	blue	Blue Protocol
blueart	bla	BLUEART TOKEN
blue-baikal	bbc	Blue Baikal
bluebenx	benx	BlueBenx [OLD]
bluebenx-2	benx	BlueBenx
bluebit	bbt	BlueBit
bluecoin	blu	Bluecoin
bluejay	blu	Bluejay
bluelight	kale	Bluelight
bluemove	move	BlueMove
blueshift	blues	Blueshift
bluesparrow	bluesparrow	BlueSparrow
bluesparrow-token	bluesparrow	BlueSparrow [OLD]
bluewizard	wiz	BlueWizard
blur	blur	Blur
blurt	blurt	Blurt
bluzelle	blz	Bluzelle
bmax	bmax	BMAX
bmchain-token	bmt	BMCHAIN
bnb48-club-token	koge	BNB48 Club
bnbback	bnbback	BNBBack
bnb-bank	bbk	BNB Bank
bnbdefi	$defi	BNBDeFi
bnb-diamond	bnbd	BNB Diamond
bnb-dragon	bnbdragon	BnB Dragon
bnbheroes-token	bnbh	BnbHeroes
bnbpot	bnbp	BNBPot
bnb-superheroes	bsh	BNB Superheroes
bnbtiger	bnbtiger	BNBTiger
bnext-b3x	b3x	Bnext B3X
bnktothefuture	bft	BnkToTheFuture
bnpl-pay	bnpl	BNPL Pay
bnsd-finance	bnsd	BNSD Finance
bns-token	bns	BNS
bns-token-old	bns	BNS Token [OLD]
bnx-finex	bnx	Bnx Finex
board	board	Board
bob	bob	BOB
boba-brewery	bre	Boba Brewery
bobadoge	bdoge	BobaDoge
boba-network	boba	Boba Network
bobatama	boba	Bobamask
bobcoin	bobc	Bobcoin
bobo-cash	bobo	Bobo Cash
bobs_repair	bob	Bob's Repair
bocachica	chica	BocaChica
bocoin	boc	BOCOIN
boda-token	bodav2	BODA
bodhi-network	nbot	Bodhi Network
bodrumspor-fan-token	bdrm	Bodrumspor Fan Token
bofb	bofb	bofb
bogged-finance	bog	Bogged Finance
bohr-2	br	BoHr
boid	boid	Boid
boji	boji	BOJI
boku	boku	Boryoku Dragonz
bold-point	bpt	Bold Point
bole-token	bole	Boleld
bolide	blid	Bolide
bolivarcoin	boli	Bolivarcoin
bollycoin	bolly	BollyCoin
bologna-fc-fan-token	bfc	Bologna FC Fan Token
bolt	bolt	Bolt
boltt-coin	boltt	BolttCoin
bomb	bomb	BOMB
bombcrypto-coin	bomb	Bombcrypto Coin
bomber-coin	bcoin	BombCrypto
bomb-money	bomb	Bomb Money
bomb-money-bshare	bshare	Bomb Money BShare
bondappetite-usd	usdap	BondAppetite USD
bondappetit-gov-token	bag	BondAppetit Governance
bonded-cronos	bcro	Bonded Cronos
bonded-damm	bdamm	Bonded dAMM
bondly	bondly	Forj
bondly-defi	bond	Bondly
bone-2	bone	Bone
bone-shibaswap	bone	Bone ShibaSwap
boneswap	bone	BoneSwap
bone-token	bone	PolyPup Bone
bonfi	bnf	BonFi
bonfida	fida	Bonfida
bonfire	bonfire	Bonfire
bongweedcoin	bwc	BongWeedCoin
bonk	bonk	Bonk
bonq	bnq	Bonq
bonq-euro	beur	Bonq Euro
bontecoin	bonte	Bontecoin
boo	boo	Boo
boo-finance	boofi	Boo Finance
boolean	bool	Boolean
boo-mirrorworld	xboo	Boo MirrorWorld
boop	boop	Boop
boorio	orio	Boorio
boost	boost	Boost
boosted-finance	boost	Boosted Finance
boosted-lusd	blusd	Boosted LUSD
booster	boo	Booster
boosto	bst	BOOSTO
bora	bora	BORA
borderless-money	bom	Borderless Money
borealis	brl	Borealis
bored	$bored	Bored
bored-apemove	bape	Bored APEmove
bored-ape-social-club	bape	Bored Ape Social Club
bored-candy-city	candy	Bored Candy City
bored-floki-yacht-club	bfyc	Bored Floki Yacht Club
boredmemes	boredm	BoredMemes
boringdao	boring	BoringDAO
boringdao-btc	obtc	BoringDAO BTC
boringdao-[old]	bor	BoringDAO [OLD]
boring-protocol	bop	Boring Protocol
bork	bork	Bork
bork-inu	bork	Bork Inu
boruto-inu	boruto	Boruto Inu
boryoku-genesis-dragonz-index	drgnz	Boryoku Genesis Dragonz Index
bosagora	boa	BOSagora
boson-protocol	boson	Boson Protocol
boss	boss	Boss
bossdao	boss	BossDao
bossswap	boss	Boss Swap
bostrom	boot	Bostrom
botopiafinance	btop	BotopiaFinance
bot-planet	bot	Bot Planet
botto	botto	Botto
bottos	bto	Bottos
botxcoin	botx	BOTXCOIN
boulpik-token	boulpik	Boulpik Token
bountie-hunter	bountie	Bountie Hunter
bounty	bnty	Bounty
bounty0x	bnty	Bounty0x
bountymarketcap	bmc	BountyMarketCap
boutspro	bouts	BoutsPro
bovineverse-bvt	bvt	Bovineverse BVT
bowscoin	bsc	BowsCoin
boxa	boxa	BOXA
boxaxis	baxs	BoxAxis
boxcasino	boxc	BOXCASINO
boxch	boxch	Boxch
boxerdoge	boxerdoge	BoxerDOGE
boxer-inu	boxer	Boxer Inu
bozkurt-token	bt	Bozkurt
bpm	bpm	BPM
b-protocol	bpro	B.Protocol
bracelet	brc	Bracelet
brainiac	brains	Brainiac
braintrust	btrst	Braintrust
branaverse	brana	Branaverse
brandpad-finance	brand	BrandPad Finance
brayzin-heist	brzh	Brayzin Heist
brazil-fan-token	bft	Brazil National Football Team Fan Token
brcp-token	brcp	BRCP
bread	brd	Bread
breederdao	breed	BreederDAO
breezecoin	brze	Breezecoin
brewlabs	brewlabs	Brewlabs
bribe-token-2	bribe	BRIBE Token
brick	brick	r/FortNiteBR Bricks
brick-token	brick	Brick
bridge	brg.x	Bridges Exchange
bridgecoin-2	brc	BridgeCoin
bridge-mutual	bmi	Bridge Mutual
bridge-network	brdg	Bridge Network
bridge-oracle	brg	Bridge Oracle
bridgesplit-brand-index	bbi	Bridgesplit Brand Index
bridgetech-usdt	busdt	BridgeTech USDT
bright-token	bright	BrightID
bright-union	bright	Bright Union
brightypad	byp	BrightyPad
bring	anoir	Noir
bring-finance	brng	bRing.Finance
brisepad	bpad	Brisepad
brise-paradise	prds	Brise Paradise
britto	brt	Britto
brmv-token	brmv	BRMV
brn-metaverse	brn	BRN Metaverse
brokkr	bro	Brokkr
brokoli	brkl	Brokoli
broovs-projects	brs	Broovs Projects
brother-music-platform	bmp	Brother Music Platform
bro-token	bro	Bro
browniesswap	brown	BrowniesSwap
brz	brz	Brazilian Digital
bscarmy	barmy	BscArmy
bscbay	bscb	BSCBAY
bscbets	bets	BSCBETS
bscex	bscx	BSCEX
bsclaunch	bsl	BSClaunch
bsc-memepad	bscm	BSC MemePad
bscpad	bscpad	BSCPAD
bscstarter	start	Starter.xyz
bsc-station	bscs	BSC Station
bscview	bscv	Bscview
bsdium	bscd	BSDium
bsocial	bins	BSocial
btaf-token	btaf	BTAF token
btc-2x-flexible-leverage-index	btc2x-fli	BTC 2x Flexible Leverage Index
btc-2x-flexible-leverage-index-polygon	btc2x-fli-p	BTC 2x Flexible Leverage Index (Polygon)
btcmoon	btcm	BTCMoon
btc-proxy	btcpx	BTC Proxy
btc-standard-hashrate-token	btcst	BTC Standard Hashrate Token
btf	btf	Bitcoin Faith
bt-finance	bt	BT.Finance
btmiracles	bm	BtMiracles
btour-chain	msot	BTour Chain
btrips	btr	BTRIPS
bts-chain	btsc	BTS Chain
btse-token	btse	BTSE Token
btu-protocol	btu	BTU Protocol
bubblefong	bbf	Bubblefong
buckhath-coin	bhig	BuckHath Coin
bucky-badger	bucky	Bucky Badger
buddy-dao	bdy	Buddy DAO
buff-coin	buff	Buff Coin
buff-doge-coin	dogecoin	Buff Doge Coin
buffedshiba	bshib	BuffedShiba
buff-floki	bufloki	Buff Floki
buff-samo	bsamo	Buff Samo
buff-shiba-inu	buffshiba	Buff Shiba Inu
buffswap	buffs	BuffSwap
bugg-finance	bugg	BUGG Finance
buhund	buh	Buhund
buidl-acadamey	$bdgv	BUIDL Acadamey
build	build	BUILD
buildup	bup	BuildUp
bukh	bukh	bUKHI
bulk-network	bulk	Bulk Network
bullbankers	bankers	BullBankers
bull-btc-club	bbc	Bull BTC Club
bull-coin	bull	Bull Coin
bulldog-billionaires	bone	Bulldog Billionaires
bulldog-coin	bulldog	BullDog Coin
bulldoge-chain	wbdc	BullDoge Chain
bulldog-inu	bull	BullDog Inu
bullet-2	blt	Bullet
bull-game	bgt	Bull Game ToKens
bullieverse	bull	Bullieverse
bullion	cbx	Bullion
bullionfx	bull	BullionFX
bullishapes	bullish	BullishApes
bullperks	blp	BullPerks
bullswap-protocol	bvl	Bullswap Protocol
bully-inu	binu	Bully Inu
bumoon	bumn	BUMooN
bumper	bump	Bumper
bundles	bund	Bund V2
bunicorn	buni	Bunicorn
bunnycoin	bun	Bunnycoin
bunnyducky	bud	BunnyDucky
bunny-king-metaverse	bkm	Bunny King Metaverse
bunnypark	bp	BunnyPark
bunnypark-game	bg	BunnyPark Game
bunnyrocket	bunnyrocket	BunnyRocket
bunnytoken	bunny	Bunny
bunny-token-polygon	polybunny	Pancake Bunny Polygon
bunnyverse	bnv	BunnyVerse
bunny-zilla	bunnyzilla	Bunny Zilla
bunscake	bscake	Bunscake
burency	buy	Burency
burger-swap	burger	BurgerCities
burn1coin	burn1coin	Burn1Coin
burnfloki	bfloki	BurnFloki
burningmoon	bm	BurningMoon
burnt-cake	bcake	Burnt Cake
burp	burp	Burp
burrito-boyz-floor-index	burr	Burrito Boyz Floor Index
burrow	brrr	Burrow
bursaspor-fan-token	tmsh	Bursaspor Fan Token
busdx	busdx	BUSDX
busdx-fuel	xfuel	BUSDX Fuel
busy-dao	busy	Busy
buttcoin-2	butt	Button
butterfly-protocol-2	bfly	Butterfly Protocol
buying	buy	Buying.com
buymainstreet	mainst	Main Street
buymore	more	BuyMORE
buyucoin-token	buc	BuyUCoin
buzz	buzz	BUZZ
buzzshow	gldy	Buzzshow
b-watch-box	box	B.watch Box
bxh	bxh	BXH
byepix	epix	Byepix
byteball	gbyte	Obyte
bytecoin	bcn	Bytecoin
byteex	bx	ByteEx
bytenext	bnu	ByteNext
bytom	btm	Bytom
bytz	bytz	BYTZ
bzx-protocol	bzrx	bZx Protocol
bzzone	bzzone	Bzzone
c2x-2	ctx	C2X
caashcow	cow	CaashCow
caave	caave	cAAVE
cabana-token	cba	Cabana
cache-gold	cgt	CACHE Gold
cad-coin	cadc	CAD Coin
caduceus	cmp	Caduceus
cafeswap-token	brew	CafeSwap
caica-coin	cicc	CAICA Coin
caietf-finance	cai	CAIETF.Finance
cairo-finance-2	caf	CAIRO
cajutel	caj	Cajutel
cake-bank	cakebank	Cake Bank
cake-monster	monsta	Cake Monster
cakepad	ckp	CakePad
cakepow	cakepow	CakePoW
cakepunks	cakepunks	CAKEPUNKS
cakeswap	cakeswap	CakeSwap
caketools	ckt	Caketools
cakewswap	cakew	CakeWSwap
calamari-network	kma	Calamari Network
calaswap	cls	Calaswap
calaxy	clxy	Calaxy
calicoin	cali	CaliCoin
californium	cf	Californium
callisto	clo	Callisto Network
calo-app	calo	Calo
calo-fit	fit	Calo FIT
calo-indoor	ifit	Calo Indoor
calvaria-doe	ria	Calvaria: DoE
camelcoin	cml	Camelcoin
camelot-token	grail	Camelot Token
cameltoken	cmlt	Camel
camp	camp	Camp
canadian-inuit-dog	cadinu	Canadian Inuit Dog [OLD]
canadian-inuit-dog-2	cadinu	Canadian Inuit Dog
canary	cnr	Canary
canary-dollar	cand	Canary Dollar
canaryx	cnyx	CanaryX
candylad	candylad	Candylad
cannabiscoin	cann	CannabisCoin
cannumo	canu	Cannumo
cantina-royale	crt	Cantina Royale
canto	canto	CANTO
cantobelieve	believe	CantoBelieve
cantobonk	cbonk	CantoBonk
cantohm	cohm	CantOHM
canto-inu	cinu	Canto Inu
cap	cap	Cap
capital-aggregator-token	cat+	Capital Aggregator
capital-dao-starter-token	cds	Capital DAO Starter
capital-x-cell	cxc	CAPITAL X CELL
capitol	cptl	Capitol
cappasity	capp	Cappasity
capricorn	corn	Capricorn
captain	capt	Captain
captain-inu	cptinu	Captain Inu
captain-planet	ctp	Captain Planet
captain-shibarrow	shibarrow	Captain Shibarrow
capybara	capy	Capybara
carat	carat	CARAT
carbofoot	cfoot	CarboFoot
carbon	crbn	Carbon
carbon-browser	csix	Carbon Browser
carboncoin	carbon	Carboncoin
carbon-credit	cct	Carbon Credit
carbon-labs	carb	Carbon Labs
carbon-seed	carbon	Carbon Seed
carbon-usd	usc	Carbon USD
car-coin	ccm	Car Coin
cardalonia	lonia	Cardalonia
cardano	ada	Cardano
cardence	$crdn	Cardence
cardiocoin	crdc	Cardiocoin
cards-of-bsc	cob	Cards of BSC
cardstack	card	Cardstack
cardstarter	cards	Cardstarter
cardwallet	cw	CardWallet
carecoin	care	CareCoin
care-coin	crc	Care Coin
cargolink	clx	CargoLink
cargox	cxo	CargoX
carma-coin	carma	Carma Coin
carnomaly	carr	Carnomaly
carr-finance	crt	Carrot Finance
carrieverse	cvtx	CarrieVerse
carrot-stable-coin	carrot	Carrot Stable Coin
carrot-token	carrot	Carrot Token
carry	cre	Carry
cartesi	ctsi	Cartesi
carvertical	cv	carVertical
cashaa	cas	Cashaa
cashbackpro	cbp	CashBackPro
cashbet-coin	cbc	CBC.network
cashcats	$cats	CashCats
cashcow	cow	CashCow
cashdog	cashdog	CashDog
cash-driver	cd	Cash Driver
cashera	csr	Cashera
cash-tech	cate	Cash Tech
cashzone	cashz	CashZone
casinocoin	csc	Casinocoin
casinoxmetaverse	$casio	CasinoXMetaverse
casper-network	cspr	Casper Network
casperpad	cspd	CasperPad
castello-coin	cast	Castello Coin
castweet	ctt	Castweet
cat	cat	Kitty Finance CAT
catalina-whales-index	whales	Catalina Whales Index
catapult	atd	A2DAO
catapult-ac	cplt	Catapult.ac
catbonk	cabo	Catbonk
catboy-2	catboy	CatBoy
catbread	catbread	CatBread
cat-cat-token	cat	Cat
catcher-dao	cdao	Catcher DAO
catch-up	cu	Catch Up
catchy	catchy	Catchy
catcoin-cash	catcoin	Catcoin
catcoin-token	cats	CatCoin Token
catecoin	cate	CateCoin
catex-token	catt	Catex
catge-coin	catge	Catge Coin
catgirl	catgirl	Catgirl
catgirl-ai	catai	Catgirl AI
catheon-gaming	catheon	Catheon Gaming
cato	cato	CATO
catocoin	cato	CatoCoin
catpay	catpay	CATpay
catscoin	cats	Catscoin
cat-sphynx	cpx	Cat Sphynx
cat-token	cat	Mooncat CAT
catvills-coin	catvills	Catvills Coin
catzcoin	catz	CatzCoin
cavapoo	cava	Cavapoo
cave	cave	CaveWorld
cbbn-token	cbbn	CBBN
cbet-token	cbet	CBET
cbfinu	cbfinu	CBFINU
cbomber	cbomber	CBOMBER
cc	cc	CC
cca	cca	CCA
c-charge	cchg	C+Charge
ccomp	ccomp	cCOMP
ccore	cco	Ccore
cdai	cdai	cDAI
cdbio	mcd	CDbio
cdzexchange	cdz	CDzExchange
ceasports	cspt	CEASports
cebiolabs	cbsl	CeBioLabs
cedars	ceds	CEDARS
ceek	ceek	CEEK Smart VR
ceji	ceji	Ceji
celcoin	celc	CelCoin
celeb	celeb	Celeb
celer-network	celr	Celer Network
celery	cly	Celery
celestial	celt	Celestial
celletf	ecell	Consensus Cell Network
cellframe	cell	Cellframe
celo	celo	Celo
celo-dollar	cusd	Celo Dollar
celo-euro	ceur	Celo Euro
celo-euro-wormhole	ceur	Celo Euro (Wormhole)
celolaunch	cla	CeloLaunch
celo-real-creal	creal	Celo Real (cREAL)
celostarter	cstar	CeloStarter
celsius-degree-token	cel	Celsius Network
celsiusx-wrapped-ada	cxada	CelsiusX Wrapped ADA
celsiusx-wrapped-btc	cxbtc	CelsiusX Wrapped BTC
celsiusx-wrapped-doge	cxdoge	CelsiusX Wrapped DOGE
celsiusx-wrapped-eth	cxeth	CelsiusX Wrapped ETH
cens-world	cens	Cens World
centaur	cntr	Centaur
centaurify	cent	Centaurify
centcex	cenx	Centcex
centralex	cenx	Centralex
centrality	cennz	CENNZnet
centric-cash	cns	Centric Swap
centrifuge	cfg	Centrifuge
centrofi	centro	CentroFi
centurion	cnt	Centurion
centurion-inu	cent	Centurion Inu
centurion-invest	cix	Centurion Invest
cerberus-2	crbrus	Cerberus
cere-network	cere	Cere Network
ceres	ceres	Ceres
cerium	xce	Cerium
certik	ctk	Shentu
certurium	crt	Certurium
cetf	cetf	Cell ETF
cexlt	clt	Cexlt
cfl365-finance	cfl365	CFL365 Finance
cforforum-token	cfo	Cfoforum
cfx-quantum	cfxq	CFX Quantum
chads-vc	chads	CHADS VC
chain-2	xcn	Onyxcoin
chain4energy	c4e	Chain4Energy
chainbing	cbg	Chainbing
chaincade	chaincade	ChainCade
chain-colosseum	colos	Chain Colosseum
chaincorn	cornx	Chaincorn
chain-estate-dao	ches	Chain Estate DAO
chainflix	cfxt	Chainflix
chain-games	chain	Chain Games
chainge-finance	chng	Chainge Finance
chain-guardians	cgg	Chain Guardians
chainium	chx	WeOwn
chainlink	link	Chainlink
chainlist	clist	Chainlist
chain-of-legends	cleg	Chain of Legends
chainpay	cpay	Chainpay
chain-pet	cpet	Chain Pet
chainport	portx	ChainPort
chains	cha	Chains
chainsquare	chs	Chainsquare
chainswap	asap	Chainswap
chainswaps	chain	ChainSwaps
chain-wars-essence	cwe	Chain Wars
chainx	pcx	ChainX
challenge-coin	hero	Challenge Coin
challengedac	chl	ChallengeDAC
champion	cham	Champion
change	cag	Change
changenow	now	ChangeNOW
changer	cng	Changer
changex	change	ChangeX
channels	can	Channels
chaotic-finance	chaos	Chaotic Finance
charactbit	chb	Charactbit
charg-coin	chg	Charg Coin
chargedefi-charge	charge	ChargeDeFi Charge
chargedefi-static	static	ChargeDeFi Static
charged-particles	ionx	Charged Particles
charitas	char	Charitas
charity-alfa	mich	Charity Alfa
charitydao	chd	CharityDAO
charity-dao-token	chdao	Charity DAO Token
charizard-inu	charizard	Charizard Inu
charli3	c3	Charli3
charlie-finance	cht	Charlie Finance
charm	charm	Charm
chartex	chart	ChartEx
checkdot	cdt	CheckDot
checkerchain	checkr	CheckerChain
checkmate-token	cmt	CheckMate Token
checoin	checoin	CheCoin
chedda	chedda	Chedda
cheelee	cheelee	Cheelee
cheems	cheems	Cheems
cheems-inu	$cinu	CHEEMS INU
cheersland	cheers	CheersLand
cheese	cheese	Cheese
cheesecakeswap	ccake	CheesecakeSwap
cheesedao	cheez	CheeseDAO
cheesesoda-token	soda	CheeseSoda
cheeseswap	chs	CheeseSwap
cheese-swap	cheese	Cheese Swap
cheesus	cheesus	Cheesus
chefcake	chefcake	ChefCake
chellitcoin	chlt	Chellitcoin
chemix-ecology-governance-token	kun	Chemix Ecology Governance
cheqd-network	cheq	CHEQD Network
cherish	chc	Cherish
cherry-network	cher	Cherry Network
cherryswap	che	CherrySwap
cherry-token	yt	Cherry YT
chesscoin-0-32	chess	ChessCoin 0.32%
chex-token	chex	CHEX Token
chia	xch	Chia
chiba-inu	chiba	Chiba Inu
chicken	kfc	Chicken
chickenlegs	corn	ChickenLegs
chi-coin	chi	CHI Coin
chi-gastoken	chi	Chi Gas
chihiro-inu	chiro	Chihiro Inu
chihuahua	hua	Chihuahua
chihuahua-in-space	cis	Chihuahua In Space
chihuahuasol	chih	ChihuahuaSol
chihuahua-token	huahua	Chihuahua Chain
chihuahua-token-19fcd0de-eb4d-4fd7-bc4a-a202247dfdbb	chh	Chihuahua Token
chihua-token	chihua	Chihua
chikincoin	ckc	ChikinCoin
chikn-egg	egg	Chikn Egg
chikn-feed	feed	chikn feed
chikn-fert	fert	Chikn Fert
chikn-worm	worm	Chikn Worm
childhoods-end	o	Childhoods End
chili	chili	CHILI
chiliz	chz	Chiliz
chimaera	wchi	XAYA
chimeras	chim	Chimeras
chimp-fight	nana	Nana
chinaom	com	ChinaOM
chip	chip	Chip
chipstars	chips	Chipstars
chipz	chpz	Chipz
chirpley	chrp	Chirpley
chiva-token	chiv	Chiva
chives-coin	xcc	Chives Coin
chiwawa	chiwa	Chiwawa
choccyswap	ccy	ChoccySwap
chocolate-like-butterfly	clb	Chocolate Like Butterfly
choice-coin	choice	Choice Coin
choise	cho	Choise.com
chonk	chonk	Chonk
chooky-inu	$choo	Chooky Inu
chopper-inu	chopper	Chopper Inu
chorusx	cx1	ChorusX
chow-chow-finance	chow	Chow Chow Finance
christmas-floki	floc	Christmas Floki
christmas-shiba	xshib	Christmas Shiba
chromaway	chr	Chromia
chrome-swap	csw	Chrome Swap
chromium-dollar	cr	Chromium Dollar
chronicle	xnl	Chronicle
chronicum	chro	Chronicum
chronobank	time	chrono.tech
chronoly	crno	Chronoly
chubbies	chubbies20	Chubbies
chubbyakita	cakita	ChubbyAkita
chug-token	chug	CHUG
chumbai-valley	chmb	Chumbi Valley
cia	cia	CIA
cigarette-token	cig	Cigarette
cindicator	cnd	Cindicator
cindrum	cind	Cindrum
cinnamoon	cimo	Cinnamoon
cino-games	cino	Cino Games
cipher-2	cpr	CIPHER
circlepod	cpx	Circlepod
circleswap	cir	CircleSwap
circuits-of-value	coval	Circuits of Value
cirquity	cirq	Cirquity
cirrus	crs	Cirrus
cirus	cirus	Cirus
citadao	knight	CitaDAO
citadel	ctl	Citadel
citadel-one	xct	Citadel.one
citizen-finance	cifi	Citizen Finance
citrus	cts	Citrus
city-coin	city	City Coin
city-of-dream	cod	City of Dream
citystates-medieval	csm	CityStates Medieval
city-tycoon-games	ctg	City Tycoon Games
civfund-stone	0ne	Civfund Stone
civic	cvc	Civic
civic-power	power	Civic Power
civilization	civ	Civilization
claimswap	cla	ClaimSwap
clams	clam	Clams
clash	clh	Clash
clash-of-cars	clash	Clash Of Cars
clash-of-lilliput	col	Clash of Lilliput
class-coin	class	Class Coin
classicbitcoin	cbtc	ClassicBitcoin
classicdoge	xdoge	ClassicDoge
classzz	czz	ClassZZ
clay-nation	clay	Clay Nation
claystack-staked-matic	csmatic	ClayStack Staked MATIC
cleancarbon	carbo	CleanCarbon
cleanocean	clean	CleanOcean
clearcryptos	ccx	ClearCryptos
cleardao	clh	ClearDAO
clearpoll	poll	ClearPoll
clearpool	cpool	Clearpool
clear-water	$clear	Clear Water
cleeps	clps	Cleeps
clever-cvx	clevcvx	CLever CVX
clever-token	clev	CLever
clifford-inu	cliff	Clifford Inu
climb-token-finance	climb	Climb Token Finance
clintex-cti	cti	ClinTex CTi
cliq	ct	CLIQ
cloakcoin	cloak	Cloakcoin
cloak-coin	cloak	Cloak Coin
clock-24	c24	Clock 24
cloudbric	clbk	Cloudbric
cloudchat	cc	CloudChat
cloudcoin	cc	CloudCoin
cloudname	cname	Cloudname
cloud-pet	cpet	Cloud Pet
cloudtx	cloud	CloudTx
cloutcontracts	ccs	CloutContracts
clover	clv	Clover
clover-finance	clv	Clover Finance
clqdr	clqdr	cLiquidDriver
club-atletico-independiente	cai	Club Atletico Independiente Fan Token
clube-atletico-mineiro-fan-token	galo	Clube Atlético Mineiro Fan Token
clubrare-empower	mpwr	Empower
club-santos-laguna-fan-token	san	Club Santos Laguna Fan Token
clucoin	clu	CluCoin
clytie	cly	Clytie
cmc-coin	cmcc	CMC Coin
cneta	cneta	cNETA
cng-casino	cng	CNG Casino
cnh-tether	cnht	CNH Tether
cnn	cnn	Content Neutrality Network
cnns	cnns	CNNS
coal	mlb	COAL
coalculus	coal	Coalculus
cobak-token	cbk	Cobak
coban	coban	COBAN
coca-network	cocn	Coca Network
cockapoo	cpoo	Cockapoo
cocktailbar	coc	cocktailbar.finance
cocos-bcx	cocos	COCOS BCX
coco-swap	coco	Coco Swap
code-7	code7	Code 7
codex	cdex	Codex
codex-finance	codex	CODEX Finance
codi-finance	codi	Codi Finance
coffin-dollar	cousd	Coffin Dollar
coffin-finance	coffin	Coffin Finance
cofix	cofi	CoFiX
cogecoin	coge	Cogecoin
cogiverse	cogi	9D NFT
coil	coil	Coil
coin	coin	Coin
coin98	c98	Coin98
coin98-dollar	cusd	Coin98 Dollar
coinage-finance	cage	Coinage Finance
coinalpha	alp	CoinAlpha
coin-artist	coin	Coin Artist
coinary-token	cyt	Coinary
coinbase-tokenized-stock-defichain	dcoin	Coinbase Tokenized Stock Defichain
coinbase-wrapped-staked-eth	cbeth	Coinbase Wrapped Staked ETH
coinbet-finance	cfi	Coinbet Finance
coinbond	cbd	Coinbond
coin-capsule	caps	Ternoa
coinclaim	clm	CoinClaim
coindeal-token	cdl	CoinDeal Token
coindom	scc	Stem Cell Coin
coin-edelweis	edel	Coin Edelweis
coinerr	err	Coinerr
coinex-token	cet	CoinEx
coinfarm	cfarm	CoinFarm
coin-fast-alert	cfa	Coin Fast Alert [OLD]
coinfi	cofi	CoinFi
coinfirm-amlt	amlt	AMLT Network
coinflect	wcflt	Coinflect
coin-gabbar-token	cgt	Coin Gabbar Token
coinhub	chb	COINHUB
coinlancer	cl	Coinlancer
coinlion	lion	CoinLion
coinloan	clt	CoinLoan
coinlocally	clyc	Coinlocally
coinmerge	cmerge	CoinMerge (ERC20)
coinmerge-bsc	cmerge	CoinMerge (BEP20)
coinmetro	xcm	Coinmetro
coinmooner	mooner	CoinMooner
coin-of-nature	con	Coin of Nature
coin-of-the-champions	coc	Coin of the champions
coinpad	cp	Coinpad
coinpoker	chp	CoinPoker
coinracer	crace	Coinracer
coinradr	radr	CoinRadr
coinsbit-token	cnb	Coinsbit Token
coinscan	scan	CoinScan
coinscope	coinscope	Coinscope
coinspaid	cpd	CoinsPaid
coinstox	csx	Coinstox
coinwealth	cnw	CoinWealth
coinweb	cweb	Coinweb
coinwind	cow	CoinWind
coinxpad	cxpad	CoinxPad
coinzix-token	zix	Coinzix Token
cola-token	cola	Cola
cold-finance	cold	Cold Finance
coldstack	cls	Coldstack
colizeum	zeum	Colizeum
collateral-pay	coll	Collateral Pay
collateral-pay-governance	collg	Collateral Pay Governance
collectcoin-2	clct	CollectCoin
collective	co2	Collective
collector-coin	ags	Collector Coin
collegecoinnetwork	ccn	CollegeCoinNetwork
collegicoin	clg	Collegicoin
collie-inu	collie	COLLIE INU
colony	cly	Colony
colony-avalanche-index	cai	Colony Avalanche Index
colony-network-token	clny	Colony Network
colossuscoinxt	colx	ColossusXT
colr-coin	$colr	colR Coin
comb-finance	comb	Comb Finance
comdex	cmdx	Comdex
comfy	comfy	Comfy
comfy-share	cshare	Comfy Share
communique	cmq	Communique
communis	com	Communis
community-business-token	cbt	Community Business Token
community-coin-2	ctc	Community Coin Foundation
community-doge-coin	ccdoge	Community Doge Coin
community-metaverse	comt	Community Metaverse
communitytoken	ct	Cojam
community-vote-power	cvp	Community Vote Power
comodo-coin	cmd	Comodo Coin
companion	cmpn	Companion
compendium-fi	cmfi	Compendium
complifi	comfi	CompliFi
composite	cmst	Composite
compound-0x	czrx	c0x
compound-basic-attention-token	cbat	cBAT
compound-chainlink-token	clink	cLINK
compound-coin	comp	Compound Coin
compounded-marinated-umami	cmumami	Compounded Marinated UMAMI
compound-ether	ceth	cETH
compound-governance-token	comp	Compound
compound-maker	cmkr	cMKR
compound-meta	coma	Compound Meta
compound-sushi	csushi	cSUSHI
compound-uniswap	cuni	cUNI
compound-usd-coin	cusdc	cUSDC
compound-usdt	cusdt	cUSDT
compound-wrapped-btc	cwbtc	cWBTC
compound-yearn-finance	cyfi	cYFI
comp-yvault	yvcomp	COMP yVault
comsa	cms	COMSA
comtech-gold	cgo	Comtech Gold
concave	cnv	Concave
conceal	ccx	Conceal
concentrated-voting-power	cvp	PowerPool Concentrated Voting Power
concentrator	ctr	Concentrator
concertvr	cvt	concertVR
concierge-io	ava	Travala.com
concordium	ccd	Concordium
concrete-codes	conc	Concrete Codes
condorchain	cdr	CondorChain
confetti	cfti	Confetti
conflux-token	cfx	Conflux
conic-finance	cnc	Conic
conjee	conj	Conjee
connect-financial	cnfi	Connect Financial
connectico	con	Connectico
connectjob	cjt	ConnectJob
connectome	cntm	Connectome
connect-token	cnt	Connect Stela
constellation-labs	dag	Constellation
constitutiondao	people	ConstitutionDAO
constitutiondao-wormhole	people	ConstitutionDAO (Wormhole)
contentbox	box	ContentBox
contentos	cos	Contentos
contents-shopper-token	cst	Contents Shopper Token
content-value-network	cvnt	Conscious Value Network
continuum-finance	ctn	Continuum Finance
continuum-world	um	Continuum World
contracoin	ctcn	Contracoin
contracto	lock	Contracto
contribute	trib	Contribute
conun	con	CONUN
convergence	conv	Convergence
converter-finance	con	Converter Finance
convex-crv	cvxcrv	Convex CRV
convex-finance	cvx	Convex Finance
cook	cook	Cook
cookiesale	cookie	CookieSale
cookies-protocol	cp	Cookies Protocol
coolmining	cooha	CoolMining
cool-monke-banana	cmb	Cool Monke Banana
cool-vault-nftx	cool	COOL Vault (NFTX)
cope	cope	Cope
cope-token	cope	Cope Token
copiosa	cop	Copiosa
copuppy	cp	CoPuppy
copycat-finance	copycat	Copycat Finance
coral-swap	coral	Coral Swap
cordium	cord	Cordium
core	cmcx	CORE MultiChain
coredao	coredao	coreDAO
core-f3fecf39-78dc-4e5c-90c5-edf3860cbfa9	core	Core DAO
corestarter	cstr	CoreStarter
coreto	cor	COR Token
coreum	core	Coreum
corgicoin	corgi	CorgiCoin
corgidoge	corgi	Corgidoge
corgi-finance	cog	Corgi Finance
corgi-inu	corgi	Corgi Inu
corginftgame	cor	CorgiNFTGame
corionx	corx	CorionX
corite	co	Corite
coritiba-f-c-fan-token	crtb	Coritiba F.C. Fan Token
corn	corn	CORN
cornatto	cnc	Cornatto
corni	corni	Corni
cornichon	corn	Cornichon
cornucopias	copi	Cornucopias
corra-finance	cora	Corra.Finance
corsac-v2	csct	Corsac v2
cortex	ctxc	Cortex
cortexdao	cxd	CortexDAO
coshi-inu	coshi	CoShi Inu
cosmic-ape-coin	cac	Cosmic Ape Coin
cosmic-champs	cosg	Cosmic Champs
cosmic-coin	cosmic	Cosmic Coin
cosmicswap	cosmic	CosmicSwap
cosmic-universe-magic-token	magic	Cosmic Universe Magic
cosmos	atom	Cosmos Hub
cosmostarter	csms	Cosmostarter
cosplay-token-2	cot	Cosplay Token
cost-coin	akm	COST COIN+
coti	coti	COTI
cotrader	cot	CoTrader
cougar-token	cgs	CougarSwap
council-of-apes	coape	Council of Apes
counos-coin	cca	Counos Coin
counosx	ccxx	CounosX
counterparty	xcp	Counterparty
couponbay	cup	CouponBay
covalent	cqt	Covalent
covalent-cova	cova	Cova Unity
covenant-child	covn	Covenant
covercompared	cvr	CoverCompared
cover-protocol	cover	Cover Protocol
covesting	cov	Covesting
covey	$cvy	Covey
covicoin	cvc	CoviCoin
covid-doge	covid doge	Covid Doge
cowboy-snake	cows	Cowboy Snake
cowcoin	cc	CowCoin
cow-inu	ci	Cow Inu
cow-protocol	cow	CoW Protocol
cowrie	cowrie	Cowrie
cowry	cow	COWRY
coxswap	cox	Coxswap [OLD]
coxswap-2	cox	Coxswap
cpchain	cpc	CPChain
cpos-cloud-payment	cpos	CPOS Cloud Payment
cpuchain	cpu	CPUchain
cpucoin	cpu	CPUcoin
crabada	cra	Crabada
crab-market	crab	Crab Market
crabstrike	cst	CrabStrike
crafting-finance	crf	Crafting Finance
craft-network	cft	Craft network
cramer-coin	$cramer	Cramer Coin
crane-miners	crane	Crane Miners
cranx-chain	granx	GranX Chain
cratos	crts	Cratos
crave	crave	Crave
crazy-bunny-equity-token	cbunny	Crazy Bunny Equity
crazy-internet-coin	cic	Crazy Internet Coin
crazyminer	pwr	CrazyMiner
crazysharo	sharo	CrazySharo
crazy-treasure-token	ctt	Crazy Treasure Token
crb-coin	crb	CRB Coin
crd-network	crd	CRD Network
crdt	crdt	CRDT
cre8r-dao	cre8r	CRE8R DAO
cream	crm	Creamcoin
cream-2	cream	Cream
creama	creama	Creama
cream-eth2	creth2	Cream ETH 2
creamlands	cream	Creamlands
creamy	creamy	Creamy
create	ct	Create
creaticles	cre8	Creaticles
creator-platform	ctr	Creator Platform
creature_hunters	chts	Puzzle Hunters
creda	creda	CreDA
credefi	credi	Credefi
credit	credit	Credit
credit-2	credit	PROXI DeFi
creditcoin-2	ctc	Creditcoin
credits	cs	CREDITS
credit-suisse-inu	csi	Credit Suisse Inu
creditum	credit	Creditum
creds	creds	Creds
creo-engine	creo	Creo Engine
crescent-network	cre	Crescent Network
cresio	xcre	Cresio
crespo	cso	Crespo
crevacoin	creva	Crevacoin
cricket-foundation	cric	Cricket Foundation
cricket-star-manager	csm	Cricket Star Manager
crime-gold	crime	Crime Gold
cripco	ip3	Cripco
criptoville-coins-2	cvlc2	CriptoVille Coins 2
crir-msh	msh	CRIR MSH
croatian-ff-fan-token	vatreni	Croatian FF Fan Token
croblanc	croblanc	Croblanc
crodex	crx	Crodex
crogecoin	croge	Crogecoin
croissant-games	croissant	Croissant Games
croking	crk	Croking
crolend	crd	Crolend
crolon-mars	clmrs	Crolon Mars
crome	crom	Crome
cronaswap	crona	CronaSwap
cronodes	crn	CroNodes
cronos-id	croid	Cronos ID
cronospad	cpad	Cronospad
cronosphere	sphere	Cronosphere
cronosverse	vrse	CronosVerse
cronus-finance	crn	Cronus Finance
cropbytes	cbx	CropBytes
cropperfinance	crp	CropperFinance
cro-predict	crp	CRO Predict
cross-chain-bch	ccbch	Cross-Chain BCH
cross-chain-bridge	bridge	Cross-Chain Bridge
cross-chain-farming	ccf	Cross Chain Farming
crosschain-iotx	ciotx	Crosschain IOTX
crossfi	crfi	CrossFi
crossswap	cswap	CrossSwap
crosswallet	cwt	CrossWallet
crossx	crx	CrossX
croswap	cros	CroSwap
crowd	cwd	CROWD
crowdswap	crowd	CrowdSwap
crowdy	crw	Crowdy
crown	crw	Crown
crowns	cws	Seascape Crowns
crown-sovereign	csov	Crown Sovereign
crownsterling	wcsov	CrownSterling
crown-token	cwt	Crown CWT
crowny-token	crwny	Crowny
crunchy-dao	crdao	Crunchy DAO
crunchy-network	crnchy	Crunchy Network
crusaders-of-crypto	crusader	Crusaders of Crypto
crust-network	cru	Crust Network
crust-storage-market	csm	Crust Shadow
crybet	cbt	CryBet
crycash	crc	CRYCASH
cry-coin	cryy	Cry Cat Coin
cryn	cryn	CRYN
cryowar-token	cwar	Cryowar
cryptaur	cpt	Cryptaur
crypterium	crpt	Crypterium
crypteriumcoin	ccoin	Crypteriumcoin
cryptex	crx	CryptEx
cryptex-finance	ctx	Cryptex Finance
cryptia	crypt	Cryptia
cryption-network	cnt	Cryption Network
cryptoai	cai	CryptoAI
crypto-arc	arc	CryptoArc
cryptoart-ai	cart	CryptoArt.Ai
crypto-bank	cbank	Crypto Bank
cryptobill	crb	CryptoBill
crypto-birds	xcb	Crypto Birds
cryptoblades	skill	CryptoBlades
cryptoblades-kingdoms	king	CryptoBlades Kingdoms
cryptoblast	cbt	CryptoBlast
cryptobonusmiles	cbm	CryptoBonusMiles
cryptobosscoin	cbc	CryptoBossCoin
crypto-carbon-energy	cyce	Crypto Carbon Energy
cryptocars	ccar	CryptoCars
cryptocart	ccv2	CryptoCart V2
cryptocean	cron	Cryptocean
cryptochrome	chm	Cryptochrome
cryptoclans	coc	CryptoClans
crypto-classic	crc	Crypto Classic
cryptocoinpay	ccp	CryptoCoinPay
crypto-com-chain	cro	Cronos
cryptocurrency-market-index	cmi	Cryptocurrency Market Index
crypto-development-services	cds	Crypto Development Services
cryptodicehero	hro	CryptoDiceHero
cryptodrop	juice	CryptoDrop
crypto-emergency	cem	Crypto Emergency
crypto-excellence	ce	Crypto Excellence
cryptoexpress	xpress	CryptoXpress
crypto-fantasy-coin	cfc	Crypto Fantasy Coin
cryptofi	cfi	Cryptofi
cryptofifa	ffa	FFA.Games
crypto-fight-club	fight	Crypto Fight Club
cryptoflow	cfl	Cryptoflow
cryptofranc	xchf	CryptoFranc
cryptogamez	cgaz	CryptoGamez
cryptogangsters	cgang	CryptoGangsters
cryptogcoin	crg	Cryptogcoin
crypto-gladiator-shards	cgs	Crypto Gladiator Shards
crypto-global-united	cgu	Crypto Global United
crypto-holding-frank-token	chft	Crypto Holding Frank
cryptoids-game-coin	cgc	Cryptoids Game Coin
cryptoindex-io	cix100	Cryptoindex.com 100
crypto-international	cri	Crypto International
crypto-inu	abcd	Crypto Inu
crypto-island	cisla	Crypto Island
cryptojetski	cjet	CryptoJetski
crypto-kart-racing	ckracing	Crypto Kart Racing
cryptokek	kek	Cryptokek
cryptokenz	cyt	Cryptokenz
cryptokki	tokki	CRYPTOKKI
crypto-klash	klh	Crypto Klash
crypto-kombat	kombat	Crypto Kombat
cryptoku	cku	Cryptoku
crypto-legions-bloodstone	blst	Crypto Legions Bloodstone
crypto-legions-v3	blv3	Crypto Legions V3
cryptolic	cptlc	Cryptolic
cryptolion	clion	CryptoLion
crypto-makers-foundation	cmf	Crypto Makers Foundation
cryptomeda	tech	Cryptomeda
cryptomines-eternal	eternal	CryptoMines Eternal
cryptomines-reborn	crux	CryptoMines Reborn
cryptomoonshots	cms	CryptoMoonShots
crypto-mushroomz	shroomz	Crypto Mushroomz
cryptoneur-network-foundation	cnf	CryptoNeur Network foundation
cryptonex	cnx	Cryptonex
cryptonits	crt	Cryptonits
crypto-nodes	crnd	Crypto Nodes
cryptonovae	yae	Cryptonovae
cryptopay	cpay	Cryptopay
cryptoperformance-coin	cpc	CryptoPerformance Coin
crypto-perx	cprx	Crypto Perx
crypto-phoenix	cphx	Crypto Phoenix
crypto-piece	belly	Crypto Piece
crypto-pitch	cpi	Crypto Pitch
cryptoplanes	cpan	CryptoPlanes
cryptoplants	cpc	CryptoPlants Club
cryptopolis	cpo	Cryptopolis
crypto-pote-token	pope	Crypto Pote
crypto-price-index	cpi	Crypto Price Index
cryptoprofile	cp	CryptoProfile
crypto-puffs	puffs	Crypto Puffs
cryptopunk-7171-hoodie	hoodie	CryptoPunk #7171
cryptopunks-fraction-toke	ipunks	CryptoPunks Fraction Token
cryptopunt	pun	CryptoPunt
crypto-raiders	raider	Crypto Raiders
crypto-realms-war	yny	Crypto Realms War
cryptorg-token	ctg	Cryptorg
cryptorockets	crocket	CryptoRockets
crypto-royale	roy	Crypto Royale
cryptosaga	saga	CryptoSaga
cryptoshares	shares	Cryptoshares
crypto-shield	shield	Crypto Shield
cryptoships	cship	CryptoShips
cryptoskates	cst	CryptoSkates
crypto-snack	snack	Crypto Snack
crypto-soccer	csc	Crypto Soccer
cryptosoul	soul	CryptoSoul
crypto-sports	cspn	Crypto Sports
cryptosroom	croom	Cryptosroom
cryptostone	cps	Cryptostone
cryptostribe	cstc	CryptosTribe
cryptotanks	tank	CryptoTanks
cryptotask-2	ctask	CryptoTask
cryptotem	totem	Cryptotem
crypto-tex	ctex	CRYPTO TEX
cryptotrains	ctrain	CryptoTrains
cryptotycoon	ctt	CryptoTycoon
cryptounit	cru	Cryptounit
crypto-vault	cvt	Crypto Vault
crypto-village-accelerator	cva	Crypto Village Accelerator
crypto-village-accelerator-cvag	cvag	Crypto Village Accelerator CVAG
crypto-volatility-token	cvol	Crypto Volatility
cryptovszombie	cvz	CryptoVsZombie
cryptowar-xblade	open	OpenWorld
crypto-warz	warz	Crypto Warz
cryptowolf	cwolf	CryptoWolf
cryptoworld-vip	cwv	CryptoWorld.VIP
crypto-wrestling-inu	$cwi	Crypto Wrestling Inu
cryptozerofi	zeri_v2	CryptoZerofi V2
cryptozoo	zoo	CryptoZoo
cryptozoon	zoon	CryptoZoon
cryptrust	ctrt	Cryptrust
cryptyk	ctk	Cryptyk
crypworld	cwc	CrypWorld
crystal	crystal	Crystal
crystal-clear	cct	Crystal Clear
crystal-dust	csd	Crystal Dust
crystal-palace-fan-token	cpfc	Crystal Palace FC Fan Token
crystal-powder	cp	Crystal Powder
crystal-token	cyl	Crystal CYL
crystl-finance	crystl	Crystl Finance
csp-dao-network	nebo	CSP DAO Network
csr	csr	CSR
ctc-2	ctc	CTC
ctomorrow-platform	ctp	Ctomorrow Platform
ctrl-x	cut	Ctrl-X
cube	itamcube	CUBE
cube-intelligence	auto	Cube Intelligence
cube-network	cube	Cube Network
cub-finance	cub	Cub Finance
cubiex-power	cbix-p	Cubiex Power
cubix	cubix	CUBIX
cubtoken	cubt	CubToken
cudos	cudos	Cudos
cue-protocol	cue	CUE Protocol
cuex	ccap	CUEX Capital
cult-dao	cult	Cult DAO
cultiplan	ctpl	Cultiplan
cuminu	cuminu	Cuminu
cumrocket	cummies	CumRocket
cuprum-coin	cuc	Cuprum Coin
curate	xcur	Curate
cure-chain	chain	CURE Chain
curecoin	cure	Curecoin
cure-token-v2	cure	CURE V2
curio-governance	cgt	Curio Governance
curryswap	curry	CurrySwap
curve-dao-token	crv	Curve DAO
curve-fi-amdai-amusdc-amusdt	am3crv	Curve.fi amDAI/amUSDC/amUSDT
curve-fi-dai-usdc	dai+usdc	Curve.fi DAI/USDC
curve-fi-frax-usdc	crvfrax	Curve.fi FRAX/USDC
curve-fi-gdai-gusdc-gusdt	g3crv	Curve.fi gDAI/gUSDC/gUSDT
curve-fi-renbtc-wbtc-sbtc	crvrenwsbtc	Curve.fi renBTC/wBTC/sBTC
curve-fi-usdc-usdt	2crv	Curve.fi USDC/USDT
curve-fi-ydai-yusdc-yusdt-ytusd	ycurve	LP-yCurve
curvehash	curve	CURVEHASH
custodiy	cty	CUSTODIY
cutcoin	cut	CUTcoin
cvault-finance	core	cVault.finance
cvnx	cvnx	CVNX
cvshots	cvshot	CVSHOTS
cxn-network	cxn	CXN Network
cyber-city	cybr	Cyber City
cyberclassic	class	Cyberclassic
cyber-crystal	crystal	Cyber Crystal
cyberdoge	cybrrrdoge	CyberDoge
cyberdragon-gold	gold	CyberDragon Gold
cyberfi	cfi	CyberFi
cyberfm	cyfm	CyberFM
cybermiles	cmt	CyberMiles
cyberpop-metaverse	cyt	Cyberpop Metaverse
cyberpunk-city	cyber	Cyberpunk City
cyber-soccer	coca	CYBER SOCCER
cybertronchain	ctc	CyberTronchain
cybervein	cvt	CyberVein
cybloc-battery-token	cbt	CyBall CyBloc Battery
cyborg-apes	borg	Cyborg Apes
cycan-network	cyn	Cycan Network
cycle-token	cycle	Cycle
cyc-lock	cyc	CYC'Lock
cyclone-protocol	cyc	Cyclone Protocol
cyclos	cys	Cykura
cydotori	dotr	Cydotori
cylum-finance	cym	Cylum Finance
cyop-protocol	cyop	CyOp Protocol
cypherdog-token	cdog	Cypherdog Token
cypherium	cph	Cypherium
cyptobit-network	cbi	Cyptobit Network
cyrus-coin	cyrus	Cyrus Coin
czbnb	czbnb	CZbnb
czbusd	czbusd	CZbusd
czred	czr	CZRed
czusd	czusd	CZUSD
d3	defi	D3
d3d-social	d3d	D3D Social
dabb-doge	ddoge	Dabb Doge
dab-coin	dab	DAB Coin
dachshund	dsd	Dachshund
dacxi	dacxi	Dacxi
daddybabydoge	dbdt	DBDT TOKEN
daddy-doge	daddydoge	Daddy Doge
daddyusdt	daddyusdt	DaddyUSDT
daefrom	dae	Daefrom
daex	dax	DAEX
dafin	daf	DaFIN
dafi-protocol	dafi	Dafi Protocol
dagger	xdag	Dagger
dai	dai	Dai
daikicoin	dic	Daikicoin
daikokuten-sama	dkks	Daikokuten Sama
dain-token	dain	Dain
dairy-money-milk	milk	Dairy.Money MILK
daisy	daisy	Daisy Protocol
dalecoin	dalc	Dalecoin
dali	dali	DALI
dama	dama	DAMA
dam-finance	d2o	Deuterium
damm	damm	dAMM
danat-coin	dnc	Danat Coin
dandy	dandy	Dandy Dego
dangermoon	dangermoon	DangerMoon
dao1	dao1	DAO1
dao-farmer-dfg	dfg	DAO Farmer DFG
dao-farmer-dfm	dfm	DAO Farmer DFM
dao-farmer-dfw	dfw	DAO Farmer DFW
daohaus	haus	DAOhaus
dao-invest	vest	DAO Invest
daoland	dld	Daoland
daolaunch	dal	DAOLaunch
dao-maker	dao	DAO Maker
daosol	daosol	daoSOL
daosquare	rice	DAOSquare
daostack	gen	DAOstack
daovc	daovc	DAOvc
daoventures	dvd	DAOventures
daoverse	dvrs	DaoVerse
dapp	dapp	LiquidApps
dapp-com	dappt	Dapp.com
dappnode	node	DAppNode
dappradar	radar	DappRadar
dappstore	dappx	dAppstore
dappsy	app	Dappsy
daps-token	daps	DAPS Coin
darcmatter-coin	darc	Konstellation
dar-dex-token	dut	Dar Dex
darenft	dnft	DareNFT
darkbuild-v2	db	Dark.Build
darkcrypto	dark	DarkCrypto
darkcrypto-foundation	dcf	DarkCrypto Foundation
darkcrypto-share	sky	DarkCrypto Share
darkcrystl	darkcrystl	DarkCrystl
dark-energy-crystals	dec	Dark Energy Crystals
dark-frontiers	dark	Dark Frontiers
darkgang-finance	darkg	DarkGang Finance
darkknight	dknight	Dark Knight
dark-land-survival	big	Dark Land Survival
dark-magic	dmagic	Dark Magic
darkmatter	dmt	DarkMatter
dark-matter	dmt	Dark Matter
dark-matter-defi	dmd	Dark Matter Defi
darkness-dollar	dusd	Darkness Dollar
darkness-share	ness	Darkness Share
darkopera-finance	darko	DarkOpera Finance
dark-planet	dp	Dark Planet
darkshield	dks	DarkShield
darleygo-essence	dge	DarleyGo Essence
dart-insurance	dart	dART Insurance
daruma	daruma	Daruma
darussafaka-sports-club	dsk	Darüşşafaka Sports Club
darwinia-commitment-token	kton	Darwinia Commitment
darwinia-network-native-token	ring	Darwinia Network
dascoin	grn	GreenPower
dash	dash	Dash
dash-2-trade	d2t	Dash 2 Trade
dash-diamond	dashd	Dash Diamond
dashleague-crystals	dlc	DashLeague Crystals
dashsports	dass	DashSports
data	dta	DATA
databroker-dao	dtx	DaTa eXchange DTX
datachain-foundation	dc	DATACHAIN FOUNDATION
data-economy-index	data	Data Economy Index
datahighway	dhx	DataHighway
datakyc	dkyc	DataKYC
datamine	dam	Datamine
datx	datx	DATx
dav	dav	DAV Network
davidcoin	dc	DavidCoin
davinci-coin	dac	Davinci Coin
davinci-token	vinci	DaVinci
davis-cup-fan-token	davis	Davis Cup Fan Token
davos-protocol	davos	Davos Protocol
dawg	dawg	DAWG
dawin-token	dwt	DaWin Token
dawn-protocol	dawn	Dawn Protocol
dawn-star-share	solar	Dawn Star Share
dawn-star-token	dsf	Dawn Star Token
day-by-day	dbd	Day By Day
day-of-defeat	dod	Day of Defeat 2.0
daystarter	dst	DAYSTARTER
dbx-2	dbx	DBX
dcap	$dcap	DCAP
dchess-king	king	DChess King
dcoin-token	dt	Dcoin
d-community	dili	D Community
dddx-protocol	dddx	DDDX Protocol
d-drops	dop	D-Drops
dead-knight	dkm	Dead Knight
deadpxlz	ding	DEADPXLZ
deapcoin	dep	DEAPCOIN
deathroad	drace	DeathRoad
death-token	death	Death
debio-network	dbio	DeBio Network
deblox	dgs	Deblox
decanect	dcnt	Decanect
decaswap	deca	DecaSwap
decaswap-corn	corn	DecaSwap CORN
decentbet	dbet	DecentBet
decent-database	decent	DECENT Database
decentr	dec	Decentr
decentrabnb	dbnb	DecentraBNB
decentraland	mana	Decentraland
decentraland-wormhole	mana	Decentraland (Wormhole)
decentral-games	dg	Decentral Games
decentral-games-governance	xdg	Decentral Games Governance
decentral-games-ice	ice	Decentral Games ICE
decentral-games-old	dg	Decentral Games (Old)
decentralized-activism	dact	Decentralized Activism
decentralized-advertising	dad	DAD
decentralized-asset-trading-platform	datp	Decentralized Asset Trading Platform
decentralized-autonomous-organization	dao	Decentralized Autonomous Organization
decentralized-business-systems	dbs	Decentralized Business Systems
decentralized-community-investment-protocol	dcip	Decentralized Community Investment Protocol
decentralized-currency-assets	dca	Decentralize Currency
decentralized-liquidity-program	dlp	Decentralized Liquidity Program
decentralized-mining-exchange	dmc	Decentralized Mining Exchange
decentralized-nations	dena	Decentralized Nations
decentralized-pirates	depi	Decentralized Pirates
decentralized-united	dcu	Decentralized United
decentralized-universal-basic-income	dubi	Decentralized Universal Basic Income
decentralized-usd	dusd	Decentralized USD
decentralized-vulnerability-platform	dvp	Decentralized Vulnerability Platform
decentraweb	dweb	DecentraWeb
decentsol	dsol	DecentSol
dechart	dch	DeChart
decimal	del	Decimal
decimated	dio	Decimated
decode-coin	decode	Decode Coin
decred	dcr	Decred
decredit	cdtc	DeCredit
decred-next	dcrn	Decred-Next
decubate	dcb	Decubate
decurian	ecu	Decurian
deep-blue-sea	dbea	Deep Blue Sea
deepbrain-chain	dbc	DeepBrain Chain
deeper-network	dpr	Deeper Network
deeponion	onion	DeepOnion
deepspace	dps	DEEPSPACE
deepspace-token	dxo	DeepSpace DXO
deesse	love	Deesse
deez-nuts	deeznuts	Deez Nuts
defactor	factr	Defactor
defhold	defo	DefHold
defi-04ab07ad-43a9-4d63-a379-2c6a2499f748	dfx	DeFi²
defi11	d11	DeFi11
defiai	dfai	DeFiAI
defiato	dfiat	DeFiato
defi-bank-tycoon	dbtycoon	DeFi Bank Tycoon
defibay	dbay	DefiBay
defibet	$dbet	DefiBet
defi-bids	bid	DeFi Bids
defi-bomb	dbomb	Defi Bomb
defibox	box	DefiBox
defi-ch	dfch	DeFi.ch
defichain	dfi	DeFiChain
deficliq	cliq	DefiCliq
defi-coin	defc	DeFi Coin
deficonnect	dfc	DefiConnect V1
deficonnect-v2	dfc	DefiConnect V2
defi-degen-land	ddl	DeFi Degen Land
defido	defido	DeFido
defidollar	dusd	DefiDollar
defidollar-dao	dfd	DefiDollar DAO
defi-forge	forge	DeFi Forge
defi-for-you	dfy	Defi For You
defi-franc	dchf	DeFi Franc
defi-franc-moneta	mon	Defi Franc Moneta
defi-gold	dfgl	DeFi Gold
defigram	dfg	Defigram
defihorse	dfh	DeFiHorse
defihorse-rocket-race	rr	DeFiHorse Rocket Race
defi-hunters-dao	ddao	DDAO Hunters
defi-kingdoms	jewel	DeFi Kingdoms
defi-kingdoms-crystal	crystal	DeFi Kingdoms Crystal
defil	dfl	DeFIL
defilancer	defilancer	Defilancer
defi-land	dfl	DeFi Land
defi-land-gold	goldy	DeFi Land Gold
defi-launch	dlaunch	DeFi Launch
defily	dfl	Defily
defina-finance	fina	Defina Finance
define	dfa	DeFine
definer	fin	DeFiner
definity	defx	DeFinity
defi-on-mcw	dfm	DeFi on MCW
defi-or-die	dord	DeFi Or Die
defipie	pie	DeFiPie
defiplaza	dfp2	DefiPlaza
defipulse-index	dpi	DeFi Pulse Index
defire	cwap	DeFIRE
defiscale	dfc	DeFiScale
defi-shopping-stake	dss	Defi Shopping Stake
defiskeletons	skeleton	Defiskeletons
defis-network	dfs	Defis Network
defisportscoin	dsc	DefiSportsCoin
defistarter	dfi	DfiStarter
defi-stoa	sta	STOA Network
defit	defit	Digital Fitness
defi-tiger	dtg	Defi Tiger
defiville-island	isla	DefiVille Island
defiwall	fiwa	DeFiWall
defi-warrior	fiwa	Defi Warrior
defi-yield-protocol	dyp	Dypius
defly	defly	Defly
deflyball	defly	Deflyball
defrost-finance	melt	Defrost Finance
defrost-finance-h2o	h2o	Defrost Finance H2O
defun-gaming	defun	Defun Gaming
defy	defy	DEFY
defyswap	dfy	Defyswap
degate	dg	DeGate
degemeth	dgm	DeGEM
degen	degn	Degen
degenerate-ape-academy-floor-index	dape	Degenerate Ape Academy Floor Index
degenerate-money	degenr	Degenerate Money
degenerator	meme	Meme
degen-index	degen	DEGEN Index
degens	degens	Degens
degenvc	dgvc	DegenVC
degenx	dgnx	DegenX
degis	deg	Degis
dego-finance	dego	Dego Finance
degrain	dgrn	Degrain
degree-crypto-token	dct	Degree Crypto
dehealth	dhlt	DeHealth
dehero-community-token	heroes	Dehero Community
dehive	dhv	DeHive
dehorizon	devt	DeHorizon
dehr-network	dhr	DeHR Network
deip-protocol	deip	DEIP Protocol
dei-token	dei	DEI
dejitaru-kaida	kaida	Dejitaru Kaida
dejitaru-shirudo	shield	Dejitaru Shirudo
dejitaru-tsuka	tsuka	Dejitaru Tsuka
dejitaru-tsuka-pow	tsukaw	Dejitaru Tsuka POW
dekbox	dek	DekBox
delfino-finance	dlf	Delfino Finance
delio-dsp	dsp	Delio DSP
deli-of-thrones	dotx	DeFi of Thrones
delion	dln	Delion
deliq	dlq	Deliq
delos-defi	delos	Delos Defi
delot-io	delot	DELOT.IO
delphy	dpy	Delphy
delta-exchange-token	deto	Delta Exchange
deltafi	delfi	DeltaFi
delta-financial	delta	Delta Financial
deltaflare	honr	DeltaFlare
deltaflip	deltaf	DeltaFlip
deltahub-community	dhc	DeltaHub Community
delta-theta	dlta	delta.theta
demeter	deo	Demeter
demeter-usd	dusd	Demeter USD
demodyfi	dmod	Demodyfi
demole	dmlg	Demole
denarius	d	Denarius
dendomains	ddn	Den Domains
denizlispor-fan-token	dnz	Denizlispor Fan Token
dent	dent	Dent
dentacoin	dcn	Dentacoin
deonex-token	don	DEONEX
depay	depay	DePay
deploying-more-capital	dmc	Deploying More Capital
depocket	depo	DePocket
deportivo-alaves-fan-token	daft	Deportivo Alavés Fan Token
dequant	deq	Dequant
derace	derc	DeRace
deracoin	drc	Deracoin
derify-protocol	drf	Derify Protocol
deri-protocol	deri	Deri Protocol
derivadao	ddx	DerivaDAO
derived	dvdx	Derived
dero	dero	Dero
desmos	dsm	Desmos
deso	deso	Decentralized Social
despace-protocol	des	DeSpace Protocol
destorage	ds	DeStorage
deusdc	deusdc	deUSDC
deus-finance-2	deus	DEUS Finance
deutsche-emark	dem	Deutsche eMark
deuxpad	deux	DeuxPad
devault	dvt	DeVault
dev-doing-something	dev	Dev Doing Something
developer-dao	code	Developer DAO
devery	eve	Devery
devikins	dvk	Devikins
devil-finance	devil	Devil Finance
devil-token	devl	Devil
devious-licks-gold	dgold	Devious Licks Gold
devita-global	life	DEVITA
devolution	devo	DeVolution
devour	restaurants	Devour Token
devour-2	dpay	Devour
dev-protocol	dev	Dev Protocol
dexa-coin	dexa	DEXA COIN
dexalot	alot	Dexalot
dexbrowser	bro	DexBrowser
dexe	dexe	DeXe
dexfin	dxf	Dexfin
dexfolio	dexf	Dexfolio
dex-game	dxgm	DexGame
dexioprotocol-v1	dexi	Dexioprotocol V1
dexioprotocol-v2	dexi	Dexioprotocol
dexira	dex	dexIRA
dexit-finance	dxt	Dexit Network
dexkit	kit	DexKit
dexlab	dxl	Dexlab
dexo	dexo	DEXO
dexpad	dxp	DexPad
dexpools	dxp	Vela Exchange
dexshare	dexshare	dexSHARE
dexsport	desu	Dexsport
dextf	dextf	Domani Protocol
dextoken-governance	dexg	Dextoken Governance
dextools	dext	DexTools
dex-trade-coin	dxc	Dex-Trade Coin
dextro	dxo	Dextro
dexwallet	dwt	DexWallet
dfe-finance	dfe	DFE.Finance
dfinance	xfi	Dfinance
dfohub	buidl	dfohub
dforce-token	df	dForce
dfs-mafia	dfsm	DFS Mafia V2
dfund	dfnd	dFund
dfx-finance	dfx	DFX Finance
dfyn-network	dfyn	Dfyn Network
dgpayment	dgp	DGPayment
dgt-community-token	dgt	DGT Community Token
dhabicoin	dbc	Dhabicoin
dhealth	dhp	dHealth
dhedge-dao	dht	dHEDGE DAO
diabolo	dcash	Diabolo
dia-data	dia	DIA
diamond	dmd	Diamond
diamond-boyz-coin	dbz	Diamond Boyz Coin
diamond-coin	diamond	Diamond Coin
diamondhold	dhold	DiamondHold
diamond-launch	dlc	Diamond Launch
diamond-love	love	Diamond Love
diamondq	diq	DiamondQ
diamond-xrpl	diamond	Diamond XRPL
dibs-money	dibs	Dibs Money
dibs-share	dshare	Dibs Share
dice-kingdom	dk	Dice Kingdom
diego	dig	DIEGO
die-protocol	die	Die Protocol
diffusion	diff	Diffusion
dify-finance	yfiii	Dify.Finance
dig-chain	dig	Dig Chain
digg	digg	DIGG
digible	digi	Digible
digibyte	dgb	DigiByte
digichain	digichain	Digichain Coin
digicol-token	dgcl	DigiCol
digi-dinar	ddr	Digi Dinar
digidinar-token	ddrt	DigiDinar Token
digifinextoken	dft	DigiFinex
digihealth	dgh	Digihealth
digimetaverse	dgmv	DigiMetaverse
digimoney	dgm	DigiMoney
digimon-rabbit	drb	Digimon Rabbit
digipad	dgp	Digipad
digiswap	digis	DigiSwap
digital-bank-of-africa	dba	Digital Bank of Africa
digitalbits	xdb	DigitalBits
digitalcoin	dgc	Digitalcoin
digitaldollar	dusd	DigitalDollar
digital-financial-exchange	difx	Digital Financial Exchange
digital-money-bits	dmb	Digital Money Bits
digitalnote	xdn	DigitalNote
digitalprice	dp	DigitalPrice
digital-rand	dzar	Digital Rand
digital-reserve-currency	drc	Digital Reserve Currency
digital-standard-unit	dsu	Digital Standard Unit
digital-swis-franc	dsfr	Digital Swiss Franc
digital-ticks	dtx	Digital Ticks
digitex-futures-exchange	dgtx	Digitex
digits-dao	digits	Digits DAO
digixdao	dgd	DigixDAO
digix-gold	dgx	Digix Gold
dignity-gold	digau	Dignity Gold
dike	dike	Dike
dimecoin	dime	Dimecoin
diminutive-coin	dimi	Diminutive Coin
dimitra	dmtr	Dimitra
dimo	dimo	DIMO
dina	dina	Dina
dinamo-zagreb-fan-token	dzg	Dinamo Zagreb Fan Token
dinastycoin	dcy	Dinastycoin
dinero	din	Dinero
dinerobet	dinero	Dinerobet
dinger-token	dinger	Dinger
dingocoin	dingo	Dingocoin
dingo-token	dingo	Dingo
dink-donk	dink	Dink Doink
dino	dino	Dino
dinoegg	dinoegg	DINOEGG
dinoland	dnl	Dinoland
dinolfg	dino	DinoLFG
dinopark	dinop	DinoPark
dinosaureggs	dsg	Dinosaur Eggs
dinostep	dns	DinoStep
dinoswap	dino	DinoSwap
dinox	dnxc	DinoX
diolaunch	dla	Diolaunch
dione	dione	Dione
dionpay	dion	Dionpay
disbalancer	ddos	disBalancer
district0x	dnt	district0x
distx	distx	DistX
ditto-staked-aptos	stapt	Ditto Staked Aptos
divergence-protocol	diver	Divergence Protocol
diversified-staked-eth	dseth	Diversified Staked ETH
divi	divi	Divi
divi-land	dvld	DIVI LAND
diviner-protocol	dpt	Diviner Protocol
divs	divs	Divs
diyarbekirspor	diyar	Diyarbekirspor
djed	djed	Djed
dkargo	dka	dKargo
dkey-bank	dkey	DKEY Bank
dlp-duck-token	duck	DLP Duck
dmarket	dmt	DMarket
dmd	dmd	DMD
dmm-governance	dmg	DMM: Governance
dmt-token	dmt	DMT
dmz-token	dmz	DMZ
dna-dollar	dna	DNA Dollar
dnaxcat	dxct	DNAxCAT
dnd-metaverse	dndb	DnD Metaverse
doaibu	doa	Doaibu
dobermann	dobe	Dobermann
dock	dock	Dock
docuchain	dcct	DocuChain
documentchain	dms	Documentchain
dodo	dodo	DODO
dodreamchain	drm	DoDreamChain
doex	doex	DOEX
dog	dog	Dog [OLD]
dog-2	dog	Dog
dogami	doga	Dogami
dog-boss	dogboss	Dog Boss
dog-collar	collar	Dog Collar
doge-1-mission-to-the-moon	doge-1	Doge-1 Mission to the moon
doge-alliance	dogeally	Doge Alliance
doge-ape	dogeape	Doge Ape
doge-army-token	dgat	Doge Army
dogebonk	dobo	DogeBonk
dogecash	dogec	DogeCash
dogechain	dc	Dogechain
doge-cheems	$dheems	Doge Cheems
dogecoin	doge	Dogecoin
dogecoin-2	doge2	Dogecoin 2.0
dogecola	dogecola	DOGECOLA
dogecube	dogecube	DogeCube
dogedead	dogedead	DogeDead
dogedi	dogedi	DOGEDI
doge-digger	dogedigger	Doge Digger
dogedragon	dd	DogeDragon
doge-eat-doge	omnom	Doge Eat Doge
dogefather-token	father	DogeFather Token
dogefi	dogefi	DogeFi
doge-floki-coin	dofi	Doge Floki Coin
dogefood	dogefood	DogeFood
dogegamer	dga	Doge Gamer
dogegayson	goge	DogeGaySon
dogegf	dogegf	DogeGF
doge-gold-floki	$dgf	Doge Gold Floki
doge-inu	dinu	Doge Inu
dogeking	dogeking	DogeKing
dogekongzilla	dogekongzilla	DogeKongZilla
dogelana	dgln	Dogelana
dogelon-classic	elonc	Dogelon Classic
dogelon-mars	elon	Dogelon Mars
dogelon-mars-wormhole	elon	Dogelon Mars (Wormhole)
doge-lumens	dxlm	DogeLumens
dogematic	dm	Dogematic
dogemon-go	dogo	DogemonGo
dogemoon	dogemoon	Dogemoon
dogens	dogens	Dogens
dogeon	don	Dogeon
dogepad-finance	dpf	Dogepad Finance
dogepow	dogew	DogePow
doge-protocol	dogep	Doge Protocol
doge-pup-token	dogepup	Doge Pup
doge-rise-up	dogeriseup	Doge Rise Up
doge-run	drun	Doge Run
dogeshiba	doshib	DogeShiba
dogeshrek	dogeshrek	DogeShrek
doge-solar	dsolar	Doge Solar
dogestribute	dgstb	Dogestribute
dogeswap	doges	Dogeswap
doge-token	doget	Doge Token
dogetools	dtools	DogeTools
dogetrend	dogetrend	DogeTrend
doge-tv	$dgtv	Doge-TV
doge-universe	spacexdoge	Doge Universe
dogewhale	dogewhale	Dogewhale
doge-yellow-coin	dogey	Doge Yellow Coin
dogeyield	dogy	DogeYield
dogey-inu	dinu	Dogey-Inu
dogezilla	dogezilla	DogeZilla
doge-zilla	dogez	DogeZilla Token
dogezone	dgz	Dogezone
dogger	dogger	Dogger
doggo	doggo	DOGGO
doggod	god	DOGGOD
doggy	doggy	Doggy
doggystyle-coin	dsc	DoggyStyle Coin
dogira	dogira	Dogira
doglaikacoin	dlc	Doglaikacoin
dog-landing-on-the-moon	dogmoon	Dog Landing On The Moon
dog-masked	dogmsk	Dog Masked
dogmi-coin	dogmi	DOGMI Coin
dogpad-finance	dogpad	DogPad Finance
dogs-kombat	dk	Dogs Kombat
dogsofelon	doe	Dogs Of Elon
dogswap-token	dog	Dogeswap (HECO)
dog-tag	tag	Dog Tag
dogu-inu	dogu	Dogu Inu
dogyrace	dor	DogyRace
dogz	dogz	Dogz
dohrnii	dhn	Dohrnii
doichain	doi	Doichain
dojo	dojo	DOJO
dojocoin	dojo	Dojocoin
dokdo	dkd	Dokdo
doken	dkn	DoKEN V2
doki-doki-finance	doki	Doki Doki
dola-borrowing-right	dbr	DOLA Borrowing Right
dola-usd	dola	Dola
dollarback	back	DollarBack
dollarmoon	dmoon	DollarMoon
dollars	usdx	Dollars
domain-coin	dmn	Domain Coin
domestic-collectors	dmc	Domestic Collectors
domi	domi	Domi
dominica-coin	dmc	Dominica Coin
dominium-2	dom	Dominium
domraider	drt	DomRaider
dona	dona	DONA
donkey	donk	Donkey
don-key	don	Don-key
donkey-token	don	Donkey DON
donnie-finance	don	Donnie Finance
don-t-buy-inu	dbi	Don't Buy Inu
dont-play-with-kitty	dpwk	Dont Play With Kitty
donut	donut	Donut
doogee	doogee	Doogee
doom-hero-dao	dhd	Doom Hero Dao
doom-hero-game	dhg	Doom Hero Game
doont-buy	dbuy	Doont Buy
dope	dope	DOPE
dope-wars-paper	paper	Dope Wars Paper
dopewarz	dwz	DopeWarz
dopex	dpx	Dopex
dopex-rebate-token	rdpx	Dopex Rebate
dopple-finance	dop	Dopple Finance
doraemoninu	doraemoninu	DoraemonInu
dora-factory	dora	Dora Factory
doragonland	dor	DoragonLand
doren	dre	DoRen
dosa	$dosa	Dosa
dose-token	dose	DOSE
dos-network	dos	DOS Network
dotarcade	adt	DotArcade
dot-dot-finance	ddd	Dot Dot Finance
dot-finance	pink	Dot Finance
dotmoovs	moov	dotmoovs
do-token	do	Do
dotoracle	dto	DotOracle
dotori	dtr	Dotori
doubledice-token	dodi	DoubleDice
double-swap-token	dst	Double Swap Token
doubloon	dbl	Doubloon
douge	douge	Douge
dough	dough	Dough
dovu	dov	Dovu
doxed	dox	Doxed
dpad-finance	dpad	Dpad Finance
dpk	dpk token	DPK
dprating	rating	DPRating
dps-doubloon	dbl	DPS Doubloon
dps-rum	rum	DPS Rum
dps-treasuremaps	tmap	DPS TreasureMaps
dr1ver	dr1$	Dr1ver
drachma-exchange	dra	Drachma Exchange
drac-network	drac	DRAC Network
dracoomaster	bas	DracooMaster
dracula	drc	Dracula
dragoma	dma	Dragoma
dragonbit	drgb	Dragonbit
dragonbite	bite	DragonBite
dragonchain	drgn	Dragonchain
dragon-crypto-argenti	dcar	Dragon Crypto Argenti
dragon-crypto-aurum	dcau	Dragon Crypto Aurum
dragon-evolution-augmente	dear	Dragon Evolution Augmente
dragon-kart-token	kart	Dragon Kart
dragon-mainland-shards	dms	Dragon Mainland Shards
dragonmaster-token	dmt	DragonMaster
dragonmaster-totem	totem	DragonMaster Totem
dragonmoon	dmoon	DragonMoon
dragon-pool	dp	Dragon Pool
dragonrace	dragace	Dragonrace
dragonsb	sb	DragonSB
dragonsea	dge	DragonSea
dragons-quick	dquick	Dragon's Quick
dragonvein	dvc	DragonVein
dragon-verse	drv	Dragon Verse
dragon-war	draw	Dragon War
draken	drk	Draken
drawshop-kingdom-reverse-joystick	joy	Drawshop Kingdom Reverse Joystick
drc-mobility	drc	DRC Mobility
dreamdao	dream	DreamDAO
dreamr-platform-token	dmr	Dreamr Platform
dreamscoin	dream	DreamsCoin
dream-soccer	dsoccer	Dream Soccer
dreams-quest	dreams	Dreams Quest
dream-swap	dream	Dream Swap
dream-token	dream	Dream
dreamverse	dv	Dreamverse
dreamy-undersea-world	duw	Dreamy Undersea World
drep-new	drep	Drep
drife	drf	Drife
drip-network	drip	Drip Network
dripto	dryp	Dripto
drive-crypto	drivecrypto	Drive Crypto
drivenx	dvx	DRIVENx
drivez	driv	Drivez
drivez-earn	inco	DRIVEZ Earn
dronefly	kdc	DroneFly
drops-ownership-power	dop	Drops Ownership Power
drunk-robots	metal	Drunk Robots
drunk-skunks-drinking-club	stink	Drunk Skunks Drinking Club
d-runt	drnt	D-RUNT
dsc-mix	mix	DSC Mix
dshares	dshare	DShares
dtng	dtng	DTNG
dtravel	trvl	TRVL
dtsla	dtsla	Tesla Tokenized Stock Defichain
dtube-coin	dtube	Dtube Coin
dua-token	dua	DUA Token
dubbz	dubbz	Dubbz
ducato-finance	ducato	Ducato Finance
duckdaodime	ddim	DuckDaoDime
duckduck-token	duck	DuckDuck
duckereum	ducker	Duckereum
duckie-land-multi-metaverse	mmeta	Duckie Land Multi Metaverse
duckies	duckies	Yellow Duckies
duck-punkz-universe-floor-index	dpunkz	Duck Punkz Universe Floor Index
duckrocket	duck	DuckRocket
duck-vault-nftx	duck	DUCK Vault (NFTX)
duckydefi	degg	DuckyDefi
dude	dude	DuDe
duelist-king	dkt	Duelist King
duel-network	duel	Duel Network
duet-protocol	duet	Duet Protocol
dukascoin	duk+	Dukascoin
dukecoin	dkc	Dukecoin
duke-inu-token	duke	Duke Inu
dumpbuster	gtfo	DumpBuster
dungeon	dgn	Dungeon
dungeonswap	dnd	DungeonSwap
dungeon-token	geon	Triathon
dusk-network	dusk	DUSK Network
dust	dust	Dust
dust-protocol	dust	DUST Protocol
dux	dux	DUX
duzce	duzce	Duzce
dvision-network	dvi	Dvision Network
dwagon	$dwagon	Dwagon
dxbpay	dxb	DXBPay
dxcad	dxcad	dXCAD
dxchain	dx	DxChain
dxdao	dxd	DXdao
dxsale-network	sale	DxSale Network
dx-spot	dxs	Dx Spot
dxy-finance	dxy	DXY Finance
dyakon	dyn	DYAKON
dydx	dydx	dYdX
dydx-wormhole	dydx	dYdX (Wormhole)
dymmax	dmx	Dymmax
dynamic	dyn	Dynamic
dynamic-set-dollar	dsd	Dynamic Set Dollar
dynamite	dyt	DoYourTip
dynamite-token	dynmt	Dynamite
dynamix	dyna	Dynamix
dynamo-coin	dynamo	Dynamo Coin
dynex	dnx	Dynex
dynochain	dnd	DynoChain
dyor	dyor	DYOR
dystopia	dyst	Dystopia
dyzilla	dyzilla	DYZilla
e1337	1337	1337
eaglecoin-2	elc	EagleCoin
eagle-mining-network	egon	EAGLE MINING NETWORK
eagonswap-token	eagon	EagonSwap
early-bird	ebird	Early Bird
earnbusd	ebusd	EarnBUSD
earncraft	plot	Earncraft
earndefi	edc	EarnDeFi
earnguild	earn	EarnGuild
earnx-v2	earnx	EarnX V2
earnytv	$earny	EarnyTV
earnzcoin	erz	EarnzCoin
earthbyt	ebyt	EarthByt
earthfund	1earth	EarthFund
ease	ease	EASE
easter-floki	efloki	Easter Floki
easticoin	esti	Easticoin
easyfi	ez	EasyFi V2
easymine	emt	easyMine
eat-to-earn	eater	Eat to Earn
eautocoin	ato	EAutocoin
eblockstock	ebso	eBlockStock
ebox	ebox	Ebox
ebsp-token	ebsp	EBSP
ecash	xec	eCash
eceltron	ectr	eCeltron
echain-network	ect	Echain Network
e-chat	echt	e-Chat
echidna	ecd	Echidna
echoin	ec	Echoin
echolink	eko	EchoLink
echosoracoin	esrc	EchoSoraCoin
ecio-space	ecio	ECIO Space
eclat	elt	ECLAT
eclipse-2	ecp	Eclipse
eco	eco	ECO
ecobit	ecob	Ecobit
ecochain-token	ect	Ecochain Finance
ecocredit	eco	EcoCREDIT
eco-defi	ecop	Eco DeFi
ecofi	eco	EcoFi
ecog9coin	egc	EcoG9coin
ecoin-2	ecoin	Ecoin
ecoin-finance	ecoin	Ecoin Finance
ecomi	omi	ECOMI
ecoreal-estate	ecoreal	Ecoreal Estate
ecoscu	ecu	ECOSC
ecosystem-coin-network	ecn	Ecosystem Coin Network
eco-value-coin	evc	Eco Value Coin
ecowatt	ewt	Ecowatt
ecoway	ecy	Ecoway
ecox	ecox	ECOx
ecredits	ecs	eCredits
ecs-gold	ecg	ECS Gold
e-c-vitoria-fan-token	vtra	E.C. Vitoria Fan Token
edac	edac	EDAC
edain	eai	Edain
eddaswap	edda	EDDASwap
eden	eden	EDEN
edenchain	edn	Edenchain
edenloop	elt	EdenLoop
edexa-service-token	edx	edeXa Service Token
edge	edge	Edge
edge-activity	eat	EDGE Activity
edgecoin-2	edgt	Edgecoin
edgeless	edg	Edgeless
edgeswap	egs	EdgeSwap
edgeware	edg	Edgeware
education-assessment-cult	eac	Education Assessment Cult
education-ecosystem	ledu	Education Ecosystem
edufex	edux	Edufex
effect-network	efx	Effect Network
efficiency-dao	eff	Efficiency DAO
efin-decentralized	wefin	eFin Decentralized
efinity	efi	Efinity
efk-token	efk	EFK Token
eft	eft	EFT
efun	efun	EFUN
egg-n-partners	eggt	Egg N Partners
eggplant-finance	eggp	Eggplant Finance
eggplus	eggplus	EggPlus
egod	egod	egoD
egod-the-savior	$savior	Egod The Savior
egold	egold	eGold
egoplatform	ego	EGO
egoras-credit	egc	Egoras Credit
egretia	egt	Egretia
ehash	ehash	EHash
ehive	ehive	eHive
eidos	eidos	EIDOS
eifi-finance	eifi	EIFI Finance
eight-hours	ehrt	Eight Hours
eiichiro-oda	oda	Eiichiro Oda
eiichiro-oda-inu	oda	Eiichiro Oda Inu
einsteinium	emc2	Einsteinium
ekta-2	ekta	Ekta
elamachain	elama	Elamachain
elan	elan	Elan
elasticswap	tic	ElasticSwap
elastos	ela	Elastos
elden-knights	knights	Elden Knights
el-dorado-exchange	ede	El Dorado Exchange
electra	eca	Electra
electra-protocol	xep	Electra Protocol
electric-cash	elcash	Electric Cash
electric-vehicle-direct-currency	evdc	Electric Vehicle Direct Currency
electric-vehicle-zone	evz	Electric Vehicle Zone
electrify-asia	elec	Electrify.Asia
electronero	etnx	Electronero
electronero-pulse	etnxp	Electronero Pulse
electroneum	etn	Electroneum
electronicgulden	efl	Electronic Gulden
electronic-usd	eusd	Electronic USD
electrum-dark	eld	Electrum Dark
element-black	elt	Element Black
elementrem	ele	Elementrem
elements-2	elm	Elements
elemon	elmon	Elemon
elephant-money	elephant	Elephant Money
eleventoken	elvn	11Minutes
elf-wallet	elf	ELF Wallet
elfworld	elft	Elfworld
eligma	goc	GoCrypto
elis	xls	ELIS
elite-swap	elt	Elite Swap
elitium	eum	Elitium
elk-finance	elk	Elk Finance
ellerium	elm	ELLERIUM
ellipsis	eps	Ellipsis [OLD]
ellipsis-x	epx	Ellipsis X
eloin	eloin	Eloin
elo-inu	elo inu	Elo Inu
elonbank	elonbank	ElonBank
elondoge-dao	edao	ElonDoge DAO
elon-doge-token	edoge	ElonDoge.io
elongate	elongate	ElonGate
elongate-duluxe	elongd	Elongate Deluxe
elon-goat	egt	Elon GOAT
elonhype	elonhype	ElonHype
eloniumcoin	elnc	EloniumCoin
elons-marvin	marvin	Elon's Marvin
elons-rabbit	erabbit	ELONs RABBIT
elpis-battle	eba	Elpis Battle
elron	elr	Elron
elrond-erd-2	egld	MultiversX
el-rune-rune-game	el	EL Rune (Rune.Game)
eltcoin	eltcoin	Eltcoin
elumia	elu	Elumia
elvantis	elv	Elvantis
elves-century	elves	Elves Century
elya	elya	Elya
elyfi	elfi	ELYFI
elysia	el	ELYSIA
elysiant-token	els	Elysian ELS
elysiumg	lcmg	ElysiumG
emanate	emt	Emanate
ember	ember	Ember
embr	embr	Embr
emcis-network	emc1	EMCIS NETWORK
emerald-crypto	emd	Emerald Crypto
emercoin	emc	EmerCoin
emg-coin	emg	EMG Coin
eminer	em	Eminer
emirate-swap-token	emc	Emirate Swap Token
emocoin	emo	Emocoin
e-money	ngm	e-Money
e-money-eur	eeur	e-Money EUR
empire-capital-token	ecc	Empire Capital
empire-token	empire	Empire
empowa	emp	Empowa
emp-shares	eshare	EMP Shares
empty-set-crypto	esc	Empty Set Crypto
empty-set-dollar	esd	Empty Set Dollar
empty-set-share	ess	Empty Set Share
empyrean	empyr	Empyrean
encountr	enctr	Encountr
encrypgen	dna	EncrypGen
encyclopedia-wta	encwta	Encyclopedia wTa
endor	edr	Endor Protocol
endpoint-cex-fan-token	endcex	Endpoint Cex Fan Token
enegra	egx	Enegra
energi	nrg	Energi
energi-dollar	usde	Energi Dollar
energo	tsl	Tesla TSL
energy	nrgy	ENERGY
energy8	e8	Energy8
energy-efficient-mortgage-tokenized-stock-defichain	deem	iShares MSCI Emerging Markets ETF Defichain
energyfi	eft	Energyfi
energytrade-token	ett	EnergyTrade Token
energy-web-token	ewt	Energy Web
enex	enx	ENEX
eng-crypto	eng	Eng Crypto
engine-token	engn	Engine Token
enigma	eng	Enigma
enjincoin	enj	Enjin Coin
enjinstarter	ejs	Enjinstarter
enjoy-network	eyn	Enjoy Network
enno-cash	enno	ENNO Cash
eno	eno	ENO
enq-enecuum	enq	Enecuum
enreachdao	nrch	EnreachDAO
enrex	enrx	Enrex
enterbutton	entc	EnterButton
enterdao	entr	EnterDAO
entice-v2	ntic	Entice
entity	entity	Entity
entropyfi	erp	Entropyfi
envida	edat	EnviDa
envion	evn	Envion
enviro	enviro	Enviro
envision	vis	Envision
envoy-network	env	Envoy
eos	eos	EOS
eosbet	bet	EarnBet
eosblack	black	eosBLACK
eosdac	eosdac	eosDAC
eosforce	eosc	EOSForce
eos-pow-coin	pow	EOS PoW Coin
eox	eox	EOX
epanus	eps	Epanus
epic-cash	epic	Epic Cash
epichero	epichero	EpicHero
epics-token	epct	Epics Token
epik-prime	epik	Epik Prime
epik-protocol	epk	EpiK Protocol
epillo	epillo	Epillo
eq9	eq9	Equals9
eqifi	eqx	EQIFi
equalizer	eqz	Equalizer
equalizer-dex	equal	Equalizer DEX
equilibrium	eq	Equilibrium Games
equilibrium-eosdt	eosdt	Equilibrium EOSDT
equinox	enx	Equinox
equitrader	eqt	EquiTrader
era	era	Era
era7	era	Era7
era7-game-of-truth	got	Era7: Game of Truth
e-radix	exrd	e-Radix
era-swap-token	es	Era Swap
ergo	erg	Ergo
erica-social-token	est	Erica Social Token
eron	eron	ERON
eroverse	ero	Eroverse
ertha	ertha	Ertha
erth-point	erth	Erth Point
erugo-world-coin	ewc	Erugo World Coin
erzurumspor-token	erz	Erzurumspor Token
escoin-token	elg	Escoin
escrowed-illuvium-2	silv2	Escrowed Illuvium 2
esg	esg	ESG
esg-chain	esgc	ESG Chain
eska	esk	Eska
eskisehir-fan-token	eses	Eskişehir Fan Token
espers	esp	Espers
espl-arena	arena	ESPL Arena
esportgame	esm	EsportGame
esports	ert	Esports.com
esportspro	espro	EsportsPro
esportsref	esr	EsportsRef
essentia	ess	Essentia
eswapping-v2	eswapv2	eSwapping v2
eterland	eter	Eterland
etermon	etm	Etermon
eterna-hybrid-exchange	ehx	Eterna Hybrid Exchange
eternalflow	eft	EternalFlow
eternal-oasis	etos	Eternal Oasis
eternal-spire-v2	ensp	Eternal Spire V2
eternal-world	etl	Eternal World
eth2-staking-by-poolx	eth2	Eth 2.0 Staking by Pool-X
eth-2x-flexible-leverage-index	eth2x-fli	Index Coop - ETH 2x Flexible Leverage Index
eth3s	eth3s	ETH3S
etha-lend	etha	ETHA Lend
ethart	arte	Items
ethax	ethax	ETHAX
ethbnt	ethbnt	ETHBNT Relay
ethburn	burning	EthBurn
ethdown	ethdown	ETHDOWN
etheal	heal	Etheal
etheking	ethe	ETHEKing
ether-1	etho	Etho Protocol
ethera-black	etb	Ethera Black
etherconnect	ecc	Etherconnect
ethereans	os	Ethereans
etherean-socks	eth2socks	Etherean Socks
ethereum	eth	Ethereum
ethereum-cash	ecash	Ethereum Cash
ethereum-classic	etc	Ethereum Classic
ethereumfair	ethf	EthereumFair
ethereum-gold-project	etgp	Ethereum Gold Project
ethereum-lite	elite	Ethereum Lite
ethereummax	emax	EthereumMax
ethereum-meta	ethm	Ethereum Meta
ethereum-name-service	ens	Ethereum Name Service
ethereum-pos-iou	eths	Ethereum PoS Fork IOU
ethereum-pow-iou	ethw	EthereumPoW
ethereum-push-notification-service	push	Push Protocol
ethereum-stake	ethys	Ethereum Stake
ethereum-victory	evic	Ethereum Victory
ethereum-volatility-index-token	ethv	Ethereum Volatility Index Token
ethereum-wormhole	eth	Ethereum (Wormhole)
ethereumx	etx	EthereumX
ethereum-yield	ethy	Ethereum Yield
ethergem	egem	EtherGem
etherinc	eti	EtherInc
etherisc	dip	Etherisc DIP
etherland	eland	Etherland
etherlite-2	etl	EtherLite
ethermail	emt	EtherMail
ethermon	emon	Ethermon
ethernaal	naal	Ethernaal
ethernal	ethernal	Ethernal
ethernal-finance	ethfin	Ethernal Finance
ethernity-chain	ern	Ethernity Chain
etherparty	fuel	Etherparty
etherpay	ethpy	Etherpay
etherrock-72	pebble	Etherrock #72
ethersmart	etm	EtherSmart
ethersocks	sox	Ethersocks
ether-tech	ether	Ether Tech
ethfan-burn	$efb	ETHFan Burn
eth-fan-token	eft	ETH Fan Token Ecosystem
ethichub	ethix	Ethix
ethlend	lend	Aave [OLD]
eth-max-yield-index	ethmaxy	ETH Max Yield Index
ethorse	horse	Ethorse
ethos	vgx	Voyager VGX
ethpad	ethpad	ETHPad
ethrise	$ethrise	ETHRISE
eth-shiba	ethshib	Eth Shiba
ethst-governance-token	et	ETHST Governance
ethtez	ethtz	ETHtez
ethup	ethup	ETHUP
ethverse	ethv	Ethverse
ethw-id	eid	ETHW ID
etna-metabolism	mtb	ETNA Metabolism
etna-network	etna	ETNA Network
etrade	ett	Etrade
etwinfinity	etw	ETWInfinity
etxinfinity	etx	ETXInfinity
eub-chain	eubc	EUB Chain
euler	eul	Euler
euler-tools	euler	Euler Tools
euno	euno	EUNO
eunomia	ents	EUNOMIA
euphoria-2	wagmi	Euphoria
euro-coin	euroc	Euro Coin
eurocoinpay	ecte	EurocoinToken
euroe-stablecoin	euroe	EUROe Stablecoin
europa	orbit	Europa
euro-shiba-inu	eshib	Euro Shiba Inu
euro-stable-token	eurst	Euro Stable Token
evai-2	ev	Evai
evanesco-network	eva	Evanesco Network
evedo	eved	Evedo
eve-exchange	eve	EVE
evencoin	evn	EvenCoin
everbnb	everbnb	EverBNB
everchain	ec	EverChain
everdome	dome	Everdome
everdot	everdot	EverDot
everearn	earn	EverEarn
everearn-eth	$earn	EverEarn ETH
everestcoin	evcoin	EverestCoin
evereth	evereth	EverETH
everex	evx	Everex
evergreen-token	egt	Evergreen
evergrowcoin	egc	EverGrow Coin
everid	id	Everest
everipedia	iq	IQ
everlens	elen	Everlens
everreflect	evrf	EverReflect
everrise	rise	EverRise
eversafu	eversafu	EverSAFU
eversafuv2	es2	EverSAFUv2
everscale	ever	Everscale
eversol	esol	EVERSOL
eversol-staked-sol	esol	Eversol Staked SOL
everstart	start	EverStart
everswap	ever	EverSwap
everton-fan-token	efc	Everton Fan Token
everyape-bsc	evape	EveryApe BSC
everycoin	evy	EveryCoin
every-game	egame	Every Game
evident-proof-transaction-token	eptt	Evident Proof Transaction
evil-coin	evil	Evil Coin
evil-shiba-inu	esi	Evil Shiba Inu
evilsquidgame	evilsquid	EvilSquidGame
evmos	evmos	Evmos
evmos-domains	evd	Evmos Domains
evmoswap	emo	EvmoSwap
evny-token	evny	EVNY
evo-finance	evo	Evo Finance
evoload	evld	Evoload
evolution-finance	evn	Evolution Finance
evoverse-power	epw	Evoverse Power
evoverses	evo	EvoVerses
evoverse-shard	evs	Evoverse Shard
evrice	evc	Evrice
evrynet	evry	Evrynet
evulus	evu	Evulus
excalibur	exc	Excalibur
excelon	xlon	Excelon
exchangecoin	excc	ExchangeCoin
exchange-genesis-ethlas-medium	xgem	Exchange Genesis Ethlas Medium
exchange-union	xuc	Exchange Union
exciting-japan-coin	xjp	eXciting Japan Coin
exclusivecoin	excl	ExclusiveCoin
excursion-token	exc	Excursion Token
exeedme	xed	Exeedme
exeno	exn	Exeno Coin
exenpay-token	exenp	ExenPay
exentoken	exen	Exen
exmoc	exmoc	EXMOC
exmo-coin	exm	EXMO Coin
exnetwork-token	exnt	ExNetwork
exobots	exos	Exobots
exodusext	ext	ExodusExt
exohood	exo	Exohood
exorde	exd	Exorde
exosama-network	sama	Moonsama
exp	exp	Exp
expanse	exp	Expanse
experience-chain	xpc	eXPerience Chain
experiencecoin	epc	ExperienceCoin
experty-wisdom-token	wis	Experty Wisdom
exponential-capital	expo	Exponential Capital
export-mortos-platform	emp	Export Motors Platform
exrnchain	exrn	EXRNchain
exrt-network	exrt	EXRT Network
extractodao-bull	xbll	ExtractoDAO Bull
extradna	xdna	extraDNA
extraterrestrial-token	et	Extraterrestrial Token
exzo	xzo	Exzo
eyes-protocol	eyes	EYES Protocol
eyeverse	eye	Eyeverse
ezillion	ezi	Ezillion
ezystayz	ezy	Ezystayz
ezzy-game	ezy	EZZY Game
f1d-token	f1d	F1D Token
fable-of-the-dragon	tyrant	Fable Of The Dragon
fable-of-the-shiba	syrant	Fable Of The Shiba
fabric	fab	Fabric
fabwelt	welt	Fabwelt
facebook-tokenized-stock-defichain	dfb	Facebook Tokenized Stock Defichain
facedao	face	FaceDAO
face-meta-2-0	facemeta	Face Meta 2.0
face-vault-nftx	face	FACE Vault (NFTX)
facts	bkc	FACTS
fado-go	fado	FADO Go
fahrenheit-chain	wfac	Fahrenheit Chain
fairgame	fair	FairGame
fairmint	fair	Fairmint
fairswap	fair	FairSwap
fairum	fai	Fairum
fairy	fairy	Fairy
fairy-finance-unicorn	unicorn	Fairy Finance UNICORN
faithcoin	faith	FaithCoin
faith-tribe	ftrb	Faith Tribe
falafel	falafel	Falafel
falcon	fln	Falcon
falcon-nine	f9	Falcon Nine
falcon-swaps	falcons	Falcon Swaps
falcon-token	fnt	Falcon Project
falconx	falcx	FalconX
fame-mma	fame	Fame MMA
fame-reward-plus	frp	Fame Reward Plus
familyparty	fpc	FamilyParty
famous-five	fafi	Famous Five
famous-fox-federation	foxy	Famous Fox Federation
fam-token	fam	FAM
fanadise	fan	Fanadise
fanbi-token	fbt	FANBI TOKEN
fanc	fanc	fanC
fancy-games	fnc	Fancy Games
fandom	fdm	Fautor
fandom-chain	kdc	Fandom Chain
fandora-network	fan	Fandora Network
fanfury	fury	Fanfury
fango	xfg	Fango
fang-token	fang	FANG
fanitrade	fani	FaniTrade
fanspel	fan	Fanspel
fanstime	fti	FansTime
fantastic-protocol-fxm-token	fxm	Fantastic Protocol FXM
fantastic-protocol-peg-ftm	ftmx	Fantastic Protocol Peg-FTM
fantasy-gold	fgc	Fantasy Gold
fantasy-monster	fts	Fantasy Monster
fantasy-war	fawa	Fantasy War
fantohm	fhm	Fantohm
fan-tokens-football	ftf	Fan Tokens Football
fantom	ftm	Fantom
fantom-doge	rip	Fantom Doge
fantomgo	ftg	OnGo
fantom-libero-financial	flibero	Fantom Libero Financial
fantom-maker	fame	Fantom Maker
fantom-oasis	ftmo	Fantom Oasis
fantom-of-the-opera-apes	fantomapes	Fantom of the Opera Apes
fantomstarter	fs	FantomStarter
fantom-usd	fusd	Fantom USD
fantums-of-opera-token	foo	Fantums of Opera
fanverse-token	ft	Fanverse Token
fanzee-token	fnz	Fanzee Token
fanzy	fx1	FANZY
faraland	fara	FaraLand
farmercryptocoin	fcc	FarmerCryptoCoin
farmerdoge	crop	FarmerDoge
farmers-only	fox	FoxSwap
farmers-world-wood	fww	Farmers World Wood
farming-paradise	fpg	Farming Paradise
farmland-protocol	far	Farmland Protocol
farm-planet	fpl	Farm Planet
farm-skylines	fsk	Farm Skylines
farms-of-ryoshi	noni	Farms of Ryoshi
fashion-coin	fshn	Fashion Coin
fasst	fas	Fasst
fast-finance	fast	Fast Finance
fast-food-wolf-game	ffwool	Fast Food Wolf Game
fastmoon	fastmoon	FastMoon
fastswap	fast	FastSwap
fastswap-bsc	fast	Fastswap (BSC)
fasttoken	ftn	Fasttoken
fatcake	fatcake	FatCake
fat-cat-killer	killer	Fat Cat Killer
fate-token	fate	Fate
fatih-karagumruk-sk-fan-token	fksk	Fatih Karagümrük SK Fan Token
fat-satoshi	fatoshi	Fat Satoshi
favecoin	fave	Favecoin
favor	favor	Favor
fayre	fayre	Fayre
fbomb	bomb	fBOMB
fc-barcelona-fan-token	bar	FC Barcelona Fan Token
fc-porto	porto	FC Porto
fc-sion-fan-token	sion	FC Sion Fan Token
fear	fear	FEAR
feathercoin	ftc	Feathercoin
fedoracoin	tips	Fedoracoin
fedora-gold	fed	Fedora Gold
feeder-finance	feed	Feeder Finance
feg-token	feg	FEG
feg-token-bsc	feg	FEG BSC
feichang-niu	fcn	Feichang Niu
feisty-doge-nft	nfd	Feisty Doge NFT
fei-usd	fei	Fei USD
felix	flx	Felix
fellaz	flz	Fellaz
fenerbahce-token	fb	Fenerbahçe
fenix-danjon	djn	Fenix Danjon
fenix-inu	fnix	Fenix Inu
fenomy	fenomy	Fenomy
fera	fera	Fera
ferma	ferma	Ferma
ferro	fer	Ferro
ferrum-network	frm	Ferrum Network
fertilizer	frt	Fertilizer
festa-finance	ffa	Festa Finance
fetch-ai	fet	Fetch.ai
feyorra	fey	Feyorra
fiat-dao-token	fdt	Fiat DAO
fibitpro-exchange	fbt	Fibit Token
fibodex	fibo	FiboDex
fibos	fo	FIBOS
fibo-token	fibo	FibSwap DEX
fidance	fdc	Fidance
fidelis	fdls	FIDELIS
fidira	fid	Fidira
fidlecoin	fidle	Fidlecoin
fidu	fidu	Fidu
fief	fief	Fief
fifa-inu	finu	Fifa Inu
fifa-laeeb	laeeb	FIFA Laeeb
fifasport	ffs	FiFaSport
fiftyonefifty	fifty	FIFTYONEFIFTY
fight-4-hope	f4h	Fight 4 Hope
fight-of-the-ages	fota	Fight Of The Ages
filda	filda	Filda
filecash	fic	Filecash
filecoin	fil	Filecoin
filecoin-standard-full-hashrate	sfil	Filecoin Standard Full Hashrate
fileshare-platform	fsc	Fileshare Platform
filestar	star	FileStar
filipcoin	fcp	Filipcoin
film-coin	fliks	Film Coin
filmcredits	film	FILMCredits
fimi-market-inc	fimi	Fimi Market Inc.
final-frontier	frnt	Final Frontier
finance-blocks	fbx	Finance Blocks
finance-sports	fsd	Finance Sports
finance-vote	fvt	Finance Vote
finblox	fbx	Finblox
findora	fra	Findora
finexbox-token	fnb	Finexbox
fingerprints	prints	FingerprintsDAO
finminity	fmt	Finminity
fino-dao	fino	FINO DAO
fins-token	fins	Fins
fintab	fntb	FinTab
fintoken	ftc	FinToken
fintropy	fint	Fintropy
fintrux	ftx	FintruX
finxflo	fxf	FINXFLO
fio-protocol	fio	FIO Protocol
fira	fira	FIRA
fira-cronos	fira	Defira (Cronos)
fireal	frl	Fireal
fireants	ants	FireAnts
fireball-2	fire	FireBall
firebird-aggregator	fba	Firebird Aggregator
firebot	fbx	FireBot
fireflame-inu	fire	FireFlame Inu
fire-lotto	flot	Fire Lotto
fire-protocol	fire	Fire Protocol
firerocket	firerocket	FireRocket
firestarter	flame	FireStarter
firetoken	fire	Firework Games
fire-token-2	fire	Fire
firezard	zard	FireZard
firmachain	fct	Firmachain
first-eleven	f11	First Eleven
first-ever-nft	fen	First Ever NFT
firsthare	firsthare	FirstHare
firulais	firu	Firulais
firulais-wallet-token	fiwt	Firulais Wallet
fisco	fscc	FISCO Coin
fish-crypto	fico	Fish Crypto
fishing-town	fhtn	Fishing Town
fishingtowngiltoken	gil	FishingTownGil
fistbump	fist	Fistbump
fit-beat	ftb	Fit&Beat
fitevo	fivo	FitEvo
fitmax	fitm	FitMax
fitmin	ftm	Fitmin
fitmint	fitt	Fitmint
fitr-metaverse-token	fmt	FitR Metaverse Token
fitr-social-token	fst	FitR Social Token
fitscrypt	$fit	FitScrypt
fit-token	fit	FIT
fity	fity	Fity
fivekm-kmt	kmt	FiveKM KMT
fixed-income-asset-token	fiat	Fixed Income Asset
fixed-trade-coin	fxtc	Fixed Trade Coin
flag-media	flag	Flag Media
flag-network	flag	Flag Network
flamengo-fan-token	mengo	Flamengo Fan Token
flamingo-finance	flm	Flamingo Finance
flappy-floki	flaflo	Flappy Floki
flappyrats	frats	FlappyRats
flare-finance	exfi	Flare Finance
flare-networks	flr	Flare
flare-token	1flr	Flare Token
flash-stake	flash	Flashstake
flash-token	flash	Flash Loans
flash-token-2	flash	Flash
flatqube	qube	FlatQube
fleta	fleta	FLETA
flex-coin	flex	FLEX Coin
flexq	flq	FlexQ
flex-usd	flexusd	flexUSD
flightclupcoin	flight	FlightClupcoin
flits	fls	Flits
flixxo	flixx	Flixxo
float-protocol	bank	Float Protocol
float-protocol-float	float	Float Protocol: Float
flock	flock	Flock
floki	floki	FLOKI
flokibonk	flobo	FlokiBonk
floki-chain	flokichain	Floki Chain
flokicoke	flokicoke	FlokiCoke
flokigainz	gainz	FlokiGainz
flokigrow	flokigrow	FlokiGrow
flokimooni	flokim	Flokimooni
floki-musk	floki	Floki Musk
flokirocket	rkf	FlokiRocket
floki-rocket	rloki	Floki Rocket
floki-santa	flokisanta	Floki Santa
flokiswap	flokis	FlokiSwap
flona	flona	Flona
floof	floof	FLOOF
floordao	floor	FloorDAO
florin	xfl	Florin
floshin	floshin	Floshin
flourishing-ai-token	ai	Flourishing AI
flow	flow	Flow
flowchaincoin	flc	Flowchain
flower	flow	Flower
fluffy-coin	fluf	Fluffy Coin
fluffy-inu	fluffy	Fluffy Inu
fluid-dai	fdai	Fluid DAI
fluidfi	fluid	FluidFi
fluid-frax	ffrax	Fluid FRAX
fluid-tusd	ftusd	Fluid TUSD
fluid-usdc	fusdc	Fluid USDC
fluid-usdt	fusdt	Fluid USDT
fluminense-fc-fan-token	flu	Fluminense FC Fan Token
flurry	flurry	Flurry Finance
flux	flux	Datamine FLUX
flux-protocol	flux	Flux Protocol
flux-token	flx	SEDA Protocol
flycoin-fly	fly	Flycoin FLY
flying-colours	ours	Flying Colours
flypaper	sticky	FlyPaper
flype-dao	flyp	FLYPE DAO
flypme	fyp	FlypMe
fm-gallery	fmg	FM Gallery
fmoney-finance	fmon	FMONEY FINANCE
fnb-protocol	fnb	FNB Protocol
fncy	fncy	FNCY
fndz-token	fndz	FNDZ
fnkcom	fnk	Fnk.com
foam-protocol	foam	FOAM
fodl-finance	fodl	Fodl Finance
foho-coin	foho	Foho Coin
foincoin	foin	Foin
folder-protocol	fol	Folder Protocol
folk	folk	$FOLK
follow-token	folo	Alpha Impact
fomo	fomo	FOMO
fomo-baby	fomobaby	FOMO BABY
fomobsc	fomo	FomoBSC
fomoeth	fomoeth	FomoETH
fone	fone	Fone
fonsmartchain	fon	FONSmartChain
font	font	Font
food-bank	food	Food Bank
foodchain-global	food	FoodChain Global
football-battle	fbl	Football Battle
football-coin	xfc	Football Coin
football-decentralized	fbd	Football Decentralized
footballfanapp	fnc	FanCoin®
football-fantasy-pro	fanta	Football Fantasy Pro
football-on-internet-ground	fig	Football on Internet Ground
footballstars	fts	FootballStars
football-world-community	fwc	Football World Community
footie-plus	footie	Footie Plus
force-bridge-usdc	usdc	Force Bridge USDC
forcecowboy	fcb	ForceCowBoy
force-of-nature	fon	Force of Nature
force-protocol	for	ForTube
forefront	ff	Forefront
forest-knight	knight	Forest Knight
forest-tiger	tiger	Forest Tiger
foreverblast	feb	ForeverBlast
forever-burn	fburn	Forever Burn
forexcoin	forex	FOREXCOIN
forge-finance	forge	Forge Finance
for-loot-and-glory	flag	For Loot And Glory
formation-fi	form	Formation FI
forta	fort	Forta
forthbox	fbx	ForthBox
fortknoxter	fkx	FortKnoxster
fortress	fts	Fortress Loans
fortressdao	fort	Fortress
fortuna-sittard-fan-token	for	Fortuna Sittard Fan Token
fortune	fortune	Fortune
fortuneum	fortune	FORTUNEUM
forus	fors	Forus
fossil	fossil	Fossil
foundation	fnd	Foundation
foundrydao-logistics	fry	FoundryDAO Logistics
fountain-protocol	ftp	Fountain Protocol
foxboy	fbb	Foxboy
fox-finance	fox	Fox Finance
fox-financev2	fox	Fox Finance V2
foxgirl	foxgirl	FoxGirl
fox-trading-token	foxt	Fox Trading
foxy-equilibrium	foxy	Foxy Equilibrium
fozeus-coin	fzs	Fozeus Coin
fqswap	fqs	FqSwap
fractal	fcl	Fractal
fraction	fraction	Fraction
fractionalized-smb-2367	daojones	Fractionalized SMB-2367
fractionalized-wave-999	wav	Fractionalized WAVE-999
fracton-protocol	ft	Fracton Protocol
fragments-of-arker	foa	Fragments of Arker
fragmint	frag	Fragmint
fraktionalized-thug-2856	thug	Fraktionalized THUG 2856
frakt-token	frkt	FRAKT
france-fan-token	fra	France Fan Token
france-rev-finance	frf	FRANCE REV FINANCE
frank-inu	frank	Frank Inu
franklin	fly	Franklin
frax	frax	Frax
frax-ether	frxeth	Frax Ether
frax-price-index	fpi	Frax Price Index
frax-price-index-share	fpis	Frax Price Index Share
frax-share	fxs	Frax Share
fredenergy	fred	FRED Energy
freebie-life-finance	frb	Freebie Life Finance
freecash	fch	Freecash
freedom	fdm	Freedom
freedomcoin	freed	Freedomcoin
freedom-coin	free	FREEdom coin
freedom-god-dao	fgd	Freedom God DAO
freedom-jobs-business	$fjb	Freedom. Jobs. Business
freedom-protocol	free	Freedom Protocol
freedom-reserve	fr	Freedom Reserve
freela	frel	Freela
freeliquid	fl	Freeliquid
freemoon-binance	fmb	FREEMOON BINANCE
freerossdao	free	FreeRossDAO
free-speech	1amd	Free Speech
freeway	fwt	Freeway
freicoin	frc	Freicoin
freight-trust-network	edi	Freight Trust Network
fren	fren	FREN
frenchain	fren	FrenChain
french-connection-finance	fcf	French Connection Finance
french-digital-reserve	fdr	French Digital Reserve
frencoin	fren	FrenCoin
freshcut-diamond	fcd	FreshCut Diamond
freth	freth	frETH
freyala	xya	GameFi Crossing
friends-with-benefits-pro	fwb	Friends With Benefits Pro
friendz	fdz	Friendz
fringe-finance	frin	Fringe Finance
frmx-token	frmx	FRMx
froge-finance	frogex	FrogeX
froggies-token	frgst	Froggies
frog-inu	fgi	Frog Inu
frogswap	frog	FrogSwap
fronk	fronk	Fronk
frontfanz	fanz	FrontFanz
frontier-token	front	Frontier
front-row	frr	Frontrow
froyo-games	froyo	Froyo Games
frozentomb	ftomb	Frozentomb
frozentomb-lot	flot	Frozentomb LOT
frozen-walrus-share	wshare	Frozen Walrus Share
fruits	frts	Fruits
fruits-of-ryoshi	yuzu	Fruits of Ryoshi
frutti-dino	fdt	Frutti Dino
frz-solar-system	frzss	Frz Solar System
frzswap	frzw	FRZSwap
fsn	fsn	FUSION
fsw-token	fsw	Falconswap
ftm-guru	elite	ftm.guru
ftmlaunch	ftml	FTMlaunch
ftribe-fighters	f2c	Ftribe Fighters
ftx-token	ftt	FTX
ftx-wormhole	ftt	FTX (Wormhole)
fudcoin-official	fud	FUDcoin Official
fudge	$fudge	Fudge
fufu	fufu	Fufu
fuji	fuji	Fuji
fujitoken	fjt	Fuji FJT
fuma-finance	fuma	Fuma Finance
fumoney	fum	FUMoney
funcha	fucha	Funcha
fundamenta	fmta	Fundamenta
fund-of-yours	foy	Fund Of Yours
funex	funex	Funex
funfair	fun	FUN Token
funfi	fnf	FunFi
fungie-dao	fng	Fungie DAO
furio	$fur	Furio
furucombo	combo	Furucombo
fuse-dollar	fusd	Fuse Dollar
fusefi	volt	Voltage Finance
fuse-network-token	fuse	Fuse
fusible	fusii	Fusible
fusotao	tao	Fusotao
futura	futura	Futura
futurax	ftxt	FUTURAX
future	ftr	Future
future-ai	future-ai	Future AI
futurecoin	future	FutureCoin
future-of-fintech	fof	Future Of Fintech
futurescoin	fc	FuturesCoin
futureswap	fst	Futureswap
futurocoin	fto	FuturoCoin
fuze-token	fuze	FUZE
fuzz-finance	fuzz	Fuzz Finance
fx-coin	fx	Function X
fxt-token	fxt	FXT
fxwallet	fxl	FXWallet
fydcoin	fyd	FYDcoin
fyooz	fyz	Fyooz
g	g*	G*
g999	g999	G999
gabecoin	gabecoin	Gabecoin
gabur	gbr	Gabur
gabx-finance	gabx	Gabx Finance
gacube	gac	GACUBE
gadget-war	gwar	Gadget War
gafa	gafa	Gafa
gagarin	ggr	GAGARIN
gaia-everworld	gaia	Gaia Everworld
gaindao	gain	Gain DAO
gainfull	gfull	Gainfull
gain-protocol	gain	Gain Protocol
gains	gains	Gains
gains-farm	gfarm2	Gains Farm
gains-network	gns	Gains Network
gaj	gaj	Gaj Finance
gala	gala	GALA
galactic-arena-the-nftverse	gan	Galactic Arena: The NFTverse
galactic-war	galw	Galactic War
galatasaray-fan-token	gal	Galatasaray Fan Token
galaxia	gxa	Galaxia
galaxy-adventure	gla	Galaxy Adventure
galaxy-arena	esnc	Galaxy Arena Metaverse
galaxybusd	galaxy	GalaxyBUSD
galaxycoin	galaxy	GalaxyCoin
galaxy-doge	galaxydoge	Galaxy Doge
galaxy-essential	gxe	Galaxy Essential
galaxy-fight-club	gcoin	Galaxy Fight Club
galaxy-finance	gft	Galaxy Finance
galaxy-finance-glf	glf	Galaxy Finance GLF
galaxy-heroes	ghc	Galaxy Heroes
galaxy-heroes-coin	ghc	Galaxy Heroes Coin [OLD]
galaxy-network	gnc	Galaxy Network
galaxy-villains	gvc	Galaxy Villains
galaxy-war	gwt	Galaxy War
gale-network	gale	Gale Network
galeon	galeon	Galeon
galileo	gali	Galileo
galileo-protocol	leox	Galileo Protocol
gamb	gmb	GAMB
gambler-shiba	gshiba	Gambler Shiba
game	gtc	Game
game-ace-token	gat	Game Ace
gameantz	antz	GameAntz
game-coin	gmex	Game Coin
gamecredits	game	GameCredits
gamee	gmee	GAMEE
gamefantasystar	gfs	GameFantasyStar
game-fantasy-token	gft	Game Fantasy
game-federation	gft	Game Federation
gamefi	gafi	GameFi
gamefi-token	gfi	GameFi Protocol
gameflip	flp	Gameflip
game-gold-token	$ggt	Game Gold Token
gameguru	ggt	GameGuru
game-of-dragons	god	Game of Dragons
gameology	gmy	Gameology
gamer	gmr	GAMER
gamer-arena	gau	Gamer Arena
gamercoin	ghx	GamerCoin
gamerse	lfg	Gamerse
gamesafe	gamesafe	Gamesafe
gamespad	gmpd	GamesPad
gamesta	gsg	Gamesta
game-stake	gsk	Game Stake
gamestar-exchange	gms	GameStar
gamestarplus	gstar	GameStarPlus
game-stars	gst	Game Stars
gamestarter	game	Gamestarter
gamestation	gamer	GameStation
gamestop-finance	gme	GameStop Finance
gamestop-tokenized-stock-defichain	dgme	GameStop Tokenized Stock Defichain
gameswap-org	gswap	Gameswap
game-tree	gtcoin	Game Tree
gameverse	gmv	GameVerse
gamex	gmx	GameX
game-x-change-potion	gxp	Game X Change Potion
gameyoo	gyc	GameYoo
gamezone	gzone	GameZone
gami	gami	Gami
gamifi	gmi	GamiFi
gaming-doge	gamingdoge	Gaming Doge
gamingshiba	gamingshiba	GamingShiba
gaming-stars	games	Gaming Stars
gamium	gmm	Gamium
gami-world	gami	GAMI World
gamma	gamma	Gamma
gamma-strategies	gamma	Gamma Strategies
gamyfi-token	gfx	GamyFi
gandercoin	gand	GanderCoin
gangstabet	gbet	GangstaBet
gan-punks	gpunks20	Gan Punks
gapcoin	gap	Gapcoin
gard	gard	GARD
gari-network	gari	Gari Network
garlic	grlc	Garlic
garlicoin	grlc	Garlicoin
gary	gary	Gary
gas	gas	Gas
gasblock	gsbl	GasBlock
gas-dao	gas	Gas DAO
gasp	gasp	gAsp
gatechain-token	gt	Gate
gatenet	gate	GATENet
gateway-protocol	gwp	Gateway Protocol
gather	gth	Gather
gatorswap	gator	GatorSwap
gaur-money	gaur	Gaur Money
gax-liquidity-token-reward	gltr	GAX Liquidity Token Reward
gazetv	gaze	GazeTV
gaziantep-fk-fan-token	gfk	Gaziantep FK Fan Token
gcn-coin	gcn	GCN Coin
gdoge-finance	gdoge	GDOGE Finance
gdrt	gdrt	GDRT
gear	gear	Gear
gearbox	gear	Gearbox
gecoin	gec	Gecoin
geegoopuzzle	ggp	Geegoopuzzle
geek-protocol	geek	Geek Protocol
geeq	geeq	GEEQ
geist-dai	gdai	Geist Dai
geist-eth	geth	Geist ETH
geist-finance	geist	Geist Finance
geist-ftm	gftm	Geist FTM
geist-fusdt	gfusdt	Geist fUSDT
geist-usdc	gusdc	Geist USDC
geist-wbtc	gwbtc	Geist WBTC
gelato	gel	Gelato
geld-finance	geldf	GELD Finance
gemcave-token	gems	GemCave Token
gemdao	gemdao	Gemdao
gem-exchange-and-trading	gxt	Gem Exchange and Trading
gemguardian	gemg	GemGuardian
gemie	gem	Gemie
gemini-dollar	gusd	Gemini Dollar
gemit-app	gemit	GEMIT.app
gemlink	glink	GemLink
gempad	gems	GemPad
gempay	gpay	GemPay
gems-2	gem	Gems
gemuni	geni	GemUni
gemx	gemx	GEMX
genaro-network	gnx	Genaro Network
genart	genart	GENART
genclerbirligi-fan-token	gbsk	Gençlerbirliği Fan Token
gencoin-capital	gencap	GenCoin Capital
gene	gene	Gene
genebank-token	gnbt	Genebank
generation	gen	Generation
genes-chain	genes	GENES Chain
genesis-defi	genf	Genesis Defi
genesis-finance	gefi	Genesis Finance
genesis-mana	mana	Genesis Mana
genesis-particle	gp	Genesis Particle
genesis-pool	gpool	Genesis Pool
genesis-shards	gs	Genesis Shards
genesis-vision	gvt	Genesis Vision
genesis-wink	gwink	Genesis Wink
genesis-worlds	genesis	Genesis Worlds
genesisx	xgs	GenesisX
genesysgo-shadow	shdw	Shadow Token
genesys-token	gsys	Genesys Token
genie-protocol	gnp	Genie Protocol
genius	geni	Genius
genius-coin	genius	Genius Coin
genius-yield	gens	Genius Yield
geniux	iux	GeniuX
genix	genix	Genix
gennix	gnnx	Gennix
genomesdao	$gene	GenomesDAO
genopet-ki	ki	Genopets KI
genopets	gene	Genopets
genshinflokiinu	gfloki	GenshinFlokiInu
genshin-nft	genshin	Genshin NFT
genshiro	gens	Genshiro
gensokishis-metaverse	mv	GensoKishi Metaverse
genx	genx	GENX
genz-token	genz	GENZ Token
geocoin	geo	Geocoin
geodb	geo	GeoDB
geojam	jam	Geojam
geopoly	geo$	Geopoly
gera-coin	gera	Gera Coin
germany-rabbit-token	germany	Germany Rabbit Token
gerowallet	gero	GeroWallet
get	get	GET
getkicks	kicks	GetKicks
get-token	get	GET Protocol
geyser	gysr	Geyser
geysercoin	gsr	GeyserCoin
gforce	gfce	GFORCE
gg-coin	ggc	Global Game Coin
ggtkn	ggtkn	GGTKN
gg-token	ggtk	GG
ghospers-game	ghsp	Ghospers Game
ghost-by-mcafee	ghost	Ghost
ghostface	ghostface	Ghostface
ghostkids	boo	GhostKids
ghostmarket	gm	GhostMarket
ghost-trader	gtr	Ghost Trader
ghoul-token	ghoul	Ghoul
giannidoge-esport	gde	GianniDoge Esport
giant-mammoth	gmmt	Giant Mammoth
gibx-swap	x	GIBX Swap
gictrade	gict	GICTrade
giddy	gddy	Giddy
gif-dao	gif	GIF DAO
gift-coin	gift	Gift Coin
giftedhands	ghd	Giftedhands
gifto	gto	Gifto
gigaswap	giga	GigaSwap
giga-watt-token	wtt	Giga Watt
gigecoin	gig	GigEcoin
gimmer	gmr	Gimmer
ginoa	ginoa	Ginoa
ginspirit	ginspirit	GinSpirit
ginza-network	ginza	Ginza Network
giotto	giotto	GIOTTO
giresunspor-token	grs	Giresunspor Token
gitcoin	gtc	Gitcoin
gitshock-finance	gtfx	Gitshock Finance
giveth	giv	Giveth
givewell-inu	ginu	Givewell Inu
givingtoservices-svs	svs	GivingToServices SVS
givly-coin	giv	GIV
gizadao	giza	GizaDao
gld-tokenized-stock-defichain	dgld	SPDR Gold Shares Defichain
gleec-coin	gleec	Gleec Coin
glex	glex	GLEX
glide-finance	glide	Glide Finance
glimpse	glms	Glimpse
glitch-protocol	glch	Glitch Protocol
glitter-finance	xgli	Glitter Finance
glitzkoin	gtn	GlitzKoin
global-aex-token	gat	Global AEX
globalboost	bsty	GlobalBoost-Y
globalchainz	gcz	GlobalChainZ
global-china-cash	cnc	Global China Cash
globalcoin	glc	GlobalCoin
global-coin-research	gcr	Global Coin Research
global-crypto-alliance	call	Global Crypto Alliance
global-digital-cluster-co	gdcc	Global Digital Cluster Co
global-digital-content	gdc	Global Digital Content
global-gaming	gmng	Global Gaming
global-human-trust	ght	Global Human Trust
global-innovative-solutions	gsi	Global Innovative Solutions
global-smart-asset	gsa	Global Smart Asset
global-social-chain	gsc	Global Social Chain
global-token-cash	gtc	Global Token Cash
global-trading-xenocurren	gtx	Global Trading Xenocurrency
global-trust-coin	gtc	Global Trust Coin
globe-derivative-exchange	gdt	Globe Derivative Exchange
globiance-exchange	gbex	Globiance Exchange
glorydoge	gloryd	GloryDoge
glosfer-token	glo	Glosfer
glouki	glk	Glouki
glove	glo	Glove
glow	glow	Glow
glox-finance	glox	Glox Finance
glufco	glf	Glufco
glyph-vault-nftx	glyph	GLYPH Vault (NFTX)
gm	gm	GM
gmcoin	gm	GM Holding
gmcoin-2	gmcoin	GMCoin
gmd-protocol	gmd	GMD Protocol
gm-floki	gmfloki	GM Floki
gmsol	gmsol	GMSOL
gmt-token	gmt	GMT Token
gmx	gmx	GMX
gn	gn	GN
gnar-token	gnar	GNAR
gnft	gnft	GNFT
gnome	$gnome	GNOME
gnome-mines	gmines	Gnome Mines
gnome-mines-token-v2	gminesv2	Gnome Mines Token V2
gnosis	gno	Gnosis
gny	gny	GNY
go2e-otm	otm	GO2E OTM
go2e-token	gte	GO2E GTE
goal-champion	gc	Goal Champion
goal-token	goal	GOAL Token
goalw	glw	GoalW
goat-coin	goat	Goat Coin
goats	goats	GOATS
g-o-a-t-token	g.o.a.t	G.O.A.T
gobi-labs	gobi	Gobi Labs
goblin	goblin	Goblin
gobtc	gobtc	goBTC
gobyte	gbx	GoByte
gochain	go	GoChain
gocryptome	gcme	GoCryptoMe
gode-chain	gode	Gode Chain
gods-unchained	gods	Gods Unchained
godzilla	godz	Godzilla
goeth	goeth	goETH
gofit-token	gof	GoFit Token
gogocoin	gogo	GOGOcoin
gogo-finance	gogo	GOGO Finance
gogolcoin	gol	GogolCoin
goin	goin	GOIN
goku	goku	Goku
gokumarket-credit	gmc	GokuMarket Credit
golcoin	golc	GOLCOIN
gold8	gold8	GOLD8
goldario	gld	Goldario
goldblocks	gb	GoldBlocks
goldcoin	glc	Goldcoin
goldefy	god	GoldeFy
golden-age	ga	Golden Age
golden-ball	glb	Golden Ball
golden-banana	gba	Golden Banana
goldendiamond9	g9	GoldenDiamond9
golden-doge	gdoge	Golden Doge
golden-goal	gdg	Golden Goal
golden-goose	gold	Golden Goose
golden-ratio-coin	goldr	Golden Ratio Coin
golden-token	gold	Golden
goldenzone	gld	Goldenzone
goldex-token	gldx	Goldex
goldfarm	gold	GoldFarm
gold-fever-native-gold	ngl	Gold Fever Native Gold
goldfinch	gfi	Goldfinch
gold-guaranteed-coin	ggcm	Gold Guaranteed Coin
goldkash	xgk	GoldKash
goldminer	gm	GoldMiner
gold-mining-members	gmm	Gold Mining Members
goldmint	mntp	Goldmint
goldnugget	ngt	Gold Nugget
goldpesa-option	gpo	GoldPesa Option
gold-retriever	gldn	Gold Retriever
gold-rush-finance	$grush	Gold Rush Finance
gold-secured-currency	gsx	Gold Secured Currency
gold-socialfi-gamefi	gsg	Gold Socialfi GameFi
goldstars-coin	gsc	Goldstars Coin
goledo	gol	Goledo
golem	glm	Golem
golff	gof	Golff
golteum	gltm	Golteum
gomeat	gomt	GoMeat
gomoney2	gom2	GoMoney2
gondola-finance	gdl	Gondola Finance
good-bridging	gb	Good Bridging
good-dog	heel	Good Dog
good-doge	treat	Good Doge
good-games-guild	ggg	Good Games Guild
good-person-coin	gpcx	Good Person Coin
gooeys	goo	Gooeys
goofydoge	goofydoge	GoofyDoge
google-tokenized-stock-defichain	dgoogl	Google Tokenized Stock Defichain
goons-of-balatroon	gob	Goons of Balatroon
gooreo	gooreo	Gooreo
goose-finance	egg	Goose Finance
goosefx	gofx	GooseFX
go-out-now	gon	Go Out Now
gorgeous	gorgeous	Gorgeous
gorilla-diamond	gdt	Gorilla Diamond
gorilla-inu	gorilla inu	Gorilla Inu
gosh-realm	gosh	GOSH Realm
gotem	gotem	gotEM
got-guaranteed	gotg	Got Guaranteed
gourmetgalaxy	gum	Gourmet Galaxy
governance-algo	galgo	Governance Algo
governance-ohm	gohm	Governance OHM
governance-zil	gzil	governance ZIL
governor-dao	gdao	Governor DAO
govi	govi	CVI
govworld	gov	GovWorld
gowithmi	gmat	GoWithMi
goztepe-s-k-fan-token	goz	Göztepe S.K. Fan Token
gp-coin	xgp	GP Coin
gpex	gpx	GPEX
gps-ecosystem	gps	GPS Ecosystem
gr33n	build	Gr33n
graft-blockchain	grft	Graft Blockchain
grail	grail	Grail
grain-token	grain	Grain
gram	gram	OpenGram
grantsville	gville	Grantsville
grape-2	grape	Grape Protocol
grape-finance	grape	Grape Finance
grapefruit-coin	grpft	Grapefruit Coin
grape-token	grape	Grape
grapevine	xgrape	GrapeVine
graphen	eltg	Graphen
graphene	gfn	Graphene
graphlinq-protocol	glq	GraphLinq Protocol
grave	grve	Grave
graviocoin	gio	Graviocoin
gravitationally-bound-aura	graviaura	Gravitationally Bound AURA
graviton	grav	Graviton
graviton-zero	grav	Graviton Zero
gravitx	grx	GravitX
gravity-bridge-dai	g-dai	Gravity Bridge DAI
gravity-bridge-tether	g-usdt	Gravity Bridge Tether
gravity-bridge-usdc	g-usdc	Gravity Bridge USDC
gravity-bridge-wbtc	g-wbtc	Gravity Bridge WBTC
gravity-bridge-weth	g-weth	Gravity Bridge WETH
gravity-finance	gfi	Gravity Finance
grearn	gst	GrEarn
great-ape	greatape	Great Ape
great-bounty-dealer	gbd	Great Bounty Dealer
greatdane	greatdane	GreatDane
greed	$greed	Greed
greekmythology	gmt	GreekMythology
greenair	green	GreenAir
green-beli	grbe	Green Beli
green-ben	eben	Green Ben
green-block	gbt	Green Block
green-chart	green	Green Chart
green-climate-world	wgc	Green Climate World
greencoin	gre	Greencoin
green-cycgo	gct	Green CycGo
green-dildo-finance	gdildo	Green Dildo Finance
green-energy-coin	gec	Green Energy Coin
greeneum-network	green	Greeneum Network
green-flow	grc	GreenCoin.AI
greenfuel	greenfuel	Greenfuel
greenheart-cbd	cbd	Greenheart CBD
greenhouse	green	Greenhouse
green-life-energy	gnl	Green Life Energy
green-light	gl	Green Light
green-meta	gmeta	Green Meta
green-pet-egg	dfkgreenegg	Green Pet Egg
green-planet	gamma	Green Planet
green-ride-token	grt	Green Ride
greens	greens	Greens
green-satoshi-token	gst-sol	STEPN Green Satoshi Token on Solana
green-satoshi-token-bsc	gst-bsc	STEPN Green Satoshi Token on BSC
green-satoshi-token-on-eth	gst-eth	STEPN Green Satoshi Token on ETH
green-shiba-inu	ginux	Green Shiba Inu
green-star	grcc	Green Star
greentek	gte	GreenTek
greentrust	gnt	GreenTrust
greenworld	gwd	GreenWorld
greenzonex	gzx	GreenZoneX
greyhound	greyhound	Greyhound
grey-pet-egg	dfkgregg	Grey Pet Egg
grid	grid	GridPlus [OLD]
gridcoin-research	grc	Gridcoin
gridzone	zone	GridZone.io
griffin-art	gart	Griffin Art
griffin-art-ecosystem	gart	Griffin Art Ecosystem
griffin-land	gland	Griffin Land
grimace-coin	grimace	Grimace Coin
grim-evo	grim evo	Grim EVO
grimm	grimm	Grimm
grimtoken	grim	Grim
grin	grin	Grin
grinbit	grbt	Grinbit
grizzly-honey	ghny	Grizzly Honey
grn-grid	g	GRN Grid
gro-dao-token	gro	Gro DAO
groestlcoin	grs	Groestlcoin
grok	grok	Grok
grom	gr	GROM
groupdao	gdo	GroupDao
gro-vault-token	gvt	Gro Vault
grove	grv	GroveCoin
growing-fi	grow	Growing.fi
growmoon	gm	GrowMoon
growth-defi	xgro	GROWTH DeFi
grow-token-2	grow	Grow
gscarab	gscarab	GScarab
gsenetwork	gse	GSENetwork
gsmcoin	gsm	GSMcoin
gstcoin	gst	GSTCOIN
gti-token	gti	GTI Token
gton-capital	gton	GTON CAPITAL
gtrax	gtrx	GTraX
gu	gu	Kugle GU
guapcoin	guap	Guapcoin
guarded-ether	geth	Guarded Ether
guardian-token	guard	Guardian GUARD
guider	gdr	Guider
guildfi	gf	GuildFi
guild-of-guardians	gog	Guild of Guardians
gulden	munt	Munt
gulfcoin-2	gulf	GulfCoin
guncoin	gun	Guncoin
gunstar-metaverse	gsts	Gunstar Metaverse
gunstar-metaverse-currency	gsc	Gunstar Metaverse Currency
gunthy	gunthy	GUNTHY
guzzler	gzlr	Guzzler
gxchain	gxc	GXChain
gyen	gyen	GYEN
gym-network	gymnet	Gym Network
gyro	gyro	Gyro
h2finance	yfih2	H2Finance
h2o	h2o	H2O
h2o-dao	h2o	H2O Dao
h2o-securities	h2on	H2O Securities
h3ro3s	h3ro3s	H3RO3S
habitat	hbt	Habitat
habits	hbx	Habits
hachiko-charity	hkc	Hachiko Charity
hachikoinu	inu	HachikoInu
hackenai	hai	Hacken HAI
hackerlabs-dao	hld	Hackerlabs DAO
hackspace-capital	hac	Hackspace Capital
hades	hades	Hades
hai-governence-token	damo	Hai DAMO
haino-2	he	Haino
haki-token	haki	HAKI Token
hakka-finance	hakka	Hakka Finance
hakuna-metata	tata	HakunaMatata (old)
hakuswap	haku	HakuSwap
halcyon	hal	Halcyon
halfpizza	piza	Half Pizza
halloween-crows	scary	Halloween Crows
halloween-floki	floh	Halloween Floki
halo-coin	halo	Halo Coin
halo-network	ho	HALO Network
halving-coin	halv	Halving
hamachi-finance	hami	Hamachi Finance
hamdan-coin	hmc	Hamdan Coin
hamster	ham	Hamster
hanagold-token	hng	HanaGold
hanchain	han	HanChain
handle-fi	forex	handle.fi
handleusd	fxusd	handleUSD
handshake	hns	Handshake
handy	handy	Handy
hanu-yokia	hanu	Hanu Yokia
hanzo-inu	hanzo	Hanzo
hapi	hapi	HAPI
happy-birthday-coin	hbdc	Happy Birthday Coin
happyfans	happy	HappyFans
happyland	hpl	HappyLand
happyland-reward-token	hpw	HappyLand Reward
harambe	harambe	Harambe
harambe-protocol	riph	Harambe Protocol
hara-token	hart	Hara
hare	hare	Hare
hare-chain	harec	Hare Chain
hare-plus	hare plus	Hare Plus
hare-token	hare	Hare [OLD]
harlequins-fan-token	quins	Harlequins Fan Token
harmes-shares	hshares	Hermes Shares
harmony	one	Harmony
harmonycoin	hmc	HarmonyCoin
harmonylauncher	harl	HarmonyLauncher
harmony-token	harm	Harmony Token
harmonyville	hville	Harmonyville
haroldcoin	hrld	Haroldcoin
harrypotterobamasonic10inu	bitcoin	HarryPotterObamaSonic10Inu
haru	haru	HARU
harvest-finance	farm	Harvest Finance
hash2o	h2o	Hash2O
hashbit	hbit	HashBit
hash-bridge-oracle	hbo	Hash Bridge Oracle
hashcoin	hsc	HashCoin
hashflow	hft	Hashflow
hashgard	gard	Hashgard
hashland-coin	hc	HashLand Coin
hashmasks	mask20	Hashmasks
hashnet-biteco	hnb	HashNet BitEco
hashpanda	panda	HashPanda
hashrush	rush	HashRush
hashtagger	mooo	Hashtagger
hatayspor-token	hatay	Hatayspor Token
hatchypocket	hatchy	HatchyPocket
hathor	htr	Hathor
hati	hati	Hati
haven	xhv	Haven
haven1	h1	Haven1
haven-token	haven	Safehaven DeFi
havven	snx	Synthetix Network
hawkdex	hawk	HawkDex
hawksight	hawk	Hawksight
hayfever	hay	Hayfever
hbarx	hbarx	HBARX
h-df0f364f-76a6-47fd-9c38-f8a239a4faad	h	H
hdpunk-vault-nftx	hdpunk	HDPUNK Vault (NFTX)
headline	hdl	Headline
headstarter	hst	HeadStarter
healing-potion	hppot	Healing Potion
healthchainus	hcut	HealthChainUS
heal-the-world	heal	Heal The World
healthfi-app	hefi	HealthFi App
healthify	htf	Healthify
health-potion	hep	Health Potion
hearn-fi	hearn	Hearn.fi
heartnumber	htn	Heart Number
heart-rate	htr	Heart Rate
hearts	heart	Hearts
heavenland-hto	hto	Heavenland HTO
hebeblock	hebe	HebeBlock
hecofi	hfi	HecoFi
heco-origin-token	hogt	Heco Origin
heco-peg-bnb	bnb	Heco-Peg Binance Coin
heco-peg-xrp	xrp	Heco-Peg XRP
hectagon	hecta	Hectagon
hector-dao	hec	Hector Network
hedera-hashgraph	hbar	Hedera
hedgehog	hedgehog	Hedgehog
hedgepay	hpay	HedgePay
hedge-protocol	hdg	Hedge Protocol
hedget	hget	Hedget
hedgetrade	hedg	HedgeTrade
hedge-usd	ush	Hedge USD
hedpay	hdp.ф	HEdpAY
hedron	hdrn	Hedron
hedron-ethw	hdrn	Hedron ETHW
hegic	hegic	Hegic
hegic-yvault	yvhegic	HEGIC yVault
helena	helena	Helena Financial
helicopter-finance	copter	Helicopter Finance
helio-protocol-hay	hay	Destablecoin HAY
helium	hnt	Helium
helkin	hk	Helkin
helleniccoin	hnc	HNC Coin
hell-hounds	soul	HELL HOUNDS
hellmoon	hmoon	HELLMOON
hello-art	htt	Hello Art
hello-labs	hello	HELLO
hellsing-inu	hellsing	Hellsing Inu
helmet-insure	helmet	Helmet Insure
help-coin	hlp	HLP
helpico	help	Helpico
helpkidz-coin	hkc	HelpKidz Coin
helpseed	helps	HelpSeed
help-the-homeless-coin	hth	Help The Homeless Coin
hempcoin-thc	thc	Hempcoin
heptafranc	hptf	HEPTAFRANC
hera-finance	hera	Hera Finance
herbalist-token	herb	Herbalist
herbee	bee	Herbee
heres	hrs	Heres
herity-network	her	Herity Network
hermes	hermes	HERMES
hermes-protocol	hermes	Hermes Protocol
hermez-network-token	hez	Hermez Network
hero	hero	HERO
hero-arena	hera	Hero Arena
hero-blaze-three-kingdoms	mudol2	Hero Blaze: Three Kingdoms
herobook	hbg	HeroBook
hero-cat-key	hck	Hero Cat Key
hero-cat-token	hct	Hero Cat
herocoin	play	HEROcoin
heroeschained	hec	HeroesChained
heroes-empires	he	Heroes & Empires
heroes-of-nft	hon	Heroes of NFT
heroes-td	htd	Heroes TD
heroestd-cgc	cgc	HeroesTD CGC
herofi	heroegg	HeroFi
herofi-token-2	rofi	HeroFi ROFI
hero-inu	heros	Heros
heropark	hp	HeroPark
hero-token	raise	Raise
heroverse	her	HeroVerse
hertz-network	htz	Hertz Network
heruka-tsangnyon	tsangnyon	HERUKA TSANGNYON
herum	ram	Herum
hesman-shard	hes	Hesman Shard
hest-stake	hse	Hest stake
hex	hex	HEX
hex-ethw	hex	HEX ETHW
hex-money	hxy	HXY Money
hey	hey	Hey
hiazuki	hiazuki	hiAZUKI
hibayc	hibayc	hiBAYC
hibiki-finance	hibiki	Hibiki Finance
hiblocks	hibs	Hiblocks
hic-et-nunc-dao	hdao	Hic et nunc DAO
hiclonex	hiclonex	hiCLONEX
hicoin	xhi	HiCoin
hicoolcats	hicoolcats	hiCOOLCATS
hidden-coin	hdn	Hidden Coin
hideous-coin	hideous	Hideous Finance
hidigital-btc	hdbtc	Hidigital btc
hi-dollar	hi	hi Dollar
hidoodles	hidoodles	hiDOODLES
hiens3	hiens3	hiENS3
hiens4	hiens4	hiENS4
hierocoin	bar	Hierocoin
hifidenza	hifidenza	hiFIDENZA
hifi-finance	hifi	Hifi Finance
hifi-gaming-society	hifi	HiFi Gaming Society
hifluf	hifluf	hiFLUF
higazers	higazers	hiGAZERS
highest-yield-savings-service	hyss	Highest Yield Savings Service
high-performance-blockchain	hpb	High Performance Blockchain
high-roller-hippo-clique	roll	High Roller Hippo Clique
highstreet	high	Highstreet
hikari-protocol	hikari	Hikari Protocol
hillstone	hsf	Hillstone Finance
hilo	hilo	HILO
himalayan-cat-coin	hima	Himalayan Cat Coin
himayc	himayc	hiMAYC
himeebits	himeebits	hiMEEBITS
himfers	himfers	hiMFERS
himoonbirds	himoonbirds	hiMOONBIRDS
himo-world	himo	Himo World
hina-inu	hina	Hina Inu
hintchain	hint	Hintchain
hiod	hiod	hiOD
hiodbs	hiodbs	hiODBS
hipenguins	hipenguins	hiPENGUINS
hippo-coin	$hippo	Hippo Coin
hippo-inu	hippo	Hippo Inu
hippopotamus	hpo	Hippo Wallet
hippo-token	hip	Hippo
hippowswap	hswap	HippowSwap
hipunks	hipunks	hiPunks
hiram	hiram	Hiram
hiroki	hiro	Hiroki
hisand33	hisand33	hiSAND33
hisquiggle	hisquiggle	hiSQUIGGLE
historia	hta	Historia
historydao	hao	HistoryDAO
hitbtc-token	hit	HitBTC
hitchain	hit	HitChain
hitop	hitop	Hitop
hivalhalla	hivalhalla	hiVALHALLA
hive	hive	Hive
hive_dollar	hbd	Hive Dollar
hive-investments-honey	hny	Hive.Investments HONEY
hivemapper	honey	Hivemapper
hiveterminal	hvn	Hiveterminal
hive-vault	hiv	Hive Vault
hnb-protocol	hnb	HNB Protocol
hnk-orijent-1919-token	ori	HNK Orijent 1919
hoard	hrd	Hoard
hobonickels	hbn	Hobonickels
hodlassets	hodl	HodlAssets
hodlcoin	hodl	HOdlcoin
hodl-finance	hft	Hodl Finance
hodl-token	hodl	HODL
hodooi-com	hod	HoDooi.com
hoge-finance	hoge	Hoge Finance
hoichi	hoichi	Hoichi
hokkaidu-inu	hokk	HOKK Finance
hold2earn	h2e	Hold2Earn
holdex-finance	holdex	Holdex Finance
holdr	hldr	Holdr
hollaex-token	xht	HollaEx
hollygold	hgold	HollyGold
holoclear	holo	HOLOCLEAR
hololoot	hol	Hololoot
holonus	hln	Holonus
holoride	ride	holoride
holotoken	hot	Holo
holydoge	hdoge	HolyDoge
holygrail	hly	HolyGrail
holygrails-io	holy	HolyGrails.io
holyheld-2	move	Mover
home-coin	home	Home Coin
homeros	hmr	Homeros
homerun	hmrn	Homerun
homie-wars	homiecoin	Homie Wars
hom-token	homt	HOMT
hondaiscoin	hndc	HondaisCoin
honest-mining	hnst	Honest
honey	hny	Honey
honeybee	bee	HoneyBee
honeycomb-2	honey	Honeycomb
honey-deluxe	honeyd	Honey Deluxe
honeyfarm-finance	honey	HoneyFarm Finance
honey-finance	honey	Honey Finance
honeymoon-token	moon	HoneyMOON
honeypad	honey	HONEYPAD
honey-pot-beekeepers	honey	Honey Pot BeeKeepers
hono	hono	Hono
honor-token	honor	Honor
honor-world-token	hwt	Honor World Token
hooked-protocol	hook	Hooked Protocol
hoop	hoop	Primal Hoop
hoo-token	hoo	Hoo
hope-galaxy	hope	HOPE Galaxy
hopers-io	hopers	HOPERS
hoppers-game	fly	Hoppers Game
hop-protocol	hop	Hop Protocol
hoppy	hop	HOPPY
hopr	hopr	HOPR
hoqu	hqx	HOQU
hord	hord	Hord
horde	hor	Last Horde
horde-token	$horde	Horde
horgi	horgi	Horgi
horizondollar	hzd	Horizon Dollar
horizon-protocol	hzn	Horizon Protocol
horseafi	horsea	HorseaFi
horsedrace	horsedrace	HorseDrace
horuspay	horus	HorusPay
hosky	hosky	Hosky
hotbit-token	htb	Hotbit
hot-cross	hotcross	Hot Cross
hot-doge	hotdoge	HotDoge [OLD]
hotdollars-token	hds	HotDollars
hotelium	htl	Hotelium
hotmoon	hotmoon	HotMoon
hotzilla	hotzilla	HotZilla
hound	hound	Hound
hourglass	wait	Hourglass
house-of-frenchies	hofr	House of Frenchies
houston-token	hou	Houston Token
howdoo	udoo	Hyprr
howl-city	hwl	Howl City
hrdgcoin	hrdg	HRDGCOIN
hshare	hc	HyperCash
h-space-metaverse	hksm	H-Space Metaverse
hsuite	hsuite	HbarSuite
htm	htm	HTM
htmlcoin	html	HTMLCOIN
htmoon2-0	htmoon2.0	HTMOON2.0
hubble	hbb	Hubble
hubcoin-2	hub	HubCoin
hubgame	hub	HubGame
hubin-network	hbn	Hubin Network
hub-token	hub	Hub
huckleberry	finn	Huckleberry
huckleberry-inu	hkby	Huckleberry Inu
hudi	hudi	Hudi
hughug-coin	hghg	HUGHUG
huh	huh	HUH
hulk-inu	hulk	Hulk Inu
humandao	hdao	humanDAO
humaniq	hmq	Humaniq
humanize	$hmt	Humanize
human-protocol	hmt	HUMAN Protocol
humans-ai	heart	Humans.ai
humanscape	hum	Humanscape
human-world	ssap	Human World
hummingbird-egg-token	hegg	Hummingbird Egg
hummingbird-finance	hmng	Hummingbird Finance
hummingbot	hbot	Hummingbot
hummus	hum	Hummus
hundred-finance	hnd	Hundred Finance
hungarian-vizsla-inu	hvi	Hungarian Vizsla Inu
hunger-token	hunger	Hunger
hungrybear	hungry	HungryBear
hungry-bees	hbee	Hungry Bees
hunny-love-token	love	HunnyDAO
hunter	hntr	Hunter
hunter-diamond	hunt	Hunter Diamond
hunt-token	hunt	Hunt
huny	huny	Huny
huobi-bitcoin-cash	hbch	Huobi Bitcoin Cash
huobi-btc	hbtc	Huobi BTC
huobi-ethereum	heth	Huobi Ethereum
huobi-fil	hfil	Huobi Fil
huobi-litecoin	hltc	Huobi Litecoin
huobi-polkadot	hdot	Huobi Polkadot
huobi-pool-token	hpt	Huobi Pool
huobi-token	ht	Huobi
hupayx	hpx	HUPAYX
hurify	hur	Hurify
hurrian-network	mld	Hurrian Network
hurricane-nft	nhct	Hurricane NFT
hurricaneswap-token	hct	HurricaneSwap
husd	husd	HUSD
hush	hush	Hush
husky	husky	Husky
husky-avax	husky	Husky AVAX
husky-brother	husky	Husky Brother
huskyshiba	hshiba	HuskyShiba
husky-vc	husky	Husky VC
hxro	hxro	Hxro
hybrid-bank-cash	hbc	Hybrid Bank Cash
hybrix	hy	Hybrix
hycon	hyc	Hycon
hydra	hydra	Hydra
hydradx	hdx	HydraDX
hydranet	hdx	Hydranet
hydraverse	hdv	Hydraverse
hydro	hydro	Hydro
hydrolink	hlnk	HydroLink
hydro-protocol	hot	Hydro Protocol
hygenercoin	hg	Hygenercoin
hymnode	hnt	Hymnode
hyperalloy	alloy	HyperAlloy
hypercent	hype	Hypercent
hyperchain	snc	Hyper Chain
hyperchain-2	hyp	Hyperchain
hyperchainx	hyper	HyperChainX
hyperdao	hdao	HyperDAO
hyper-deflate	hdfl	Hyper Deflate
hyper-finance	hyfi	Hyper Finance
hyperonchain	hpn	HyperonChain
hyperone	hot	HyperOne
hypersign-identity-token	hid	Hypersign Identity
hyperstake	hyp	Element
hyperverse	hvt	HyperVerse
hyruleswap	rupee	HyruleSwap
hyve	hyve	Hyve
hzm-coin	hzm	HZM Coin
i0coin	i0c	I0Coin
i9-coin	i9c	i9 Coin
i9x-coin	i9x	i9X Coin
iagon	iag	Iagon
iassets	asset	iAssets
iazuki	iazuki	IAzuki
ibank	ibank	iBank
ibetyou	iby	iBetYou
ibg-eth	ibg	iBG Finance (ETH)
ibg-token	ibg	iBG Finance (BSC)
ibithub	ibh	iBitHub
ibiza-token	ibz	Ibiza
ibs	ibs	IBS
ibtc-2	ibtc	iBTC
ibuffer	ibfr	iBuffer
ibuffer-token	bfr	Buffer Token
icarus-network	ica	Icarus Network
ic-drip-token	icd	IC Drip Token
icebreak-r	icebrk	IceBreak-R
icecream-finance	cream	IceCream Finance
icel-idman-yurdu	miy	Icel Idman Yurdu
ice-token	ice	Popsicle Finance
ichello	ello	Ichello
ichi-farm	ichi	ICHI
ichigo-inu	ichigo	Ichigo Inu
icocryptomarketcap	icmc	IcoCryptoMarketCap
i-coin	icn	I-Coin V2
icolcoin	icol	Icolcoin
icomex	icmx	iCOMEX
icommunity	icom	iCommunity
icon	icx	ICON
iconiq-lab-token	icnq	Deutsche Digital Assets
icon-usdc	iusdc	Icon USDC
icosa	icsa	Icosa
idavoll-network	idv	Idavoll DAO
ideachain	ich	IdeaChain
ideamarket	imo	Ideamarket
ideaology	idea	Ideaology
ideas	ideas	IDEAS
idefiyieldprotocol	idyp	iDeFiYieldProtocol
idena	idna	Idena
idendefi	id	IdenDEFI
identity	idtt	Identity
idexo-token	ido	Idexo
idia	idia	Impossible Finance Launchpad
idk	idk	IDK
idle	idle	IDLE
idle-cyber	afk	Idle Cyber
idle-dai-risk-adjusted	idledaisafe	IdleDAI (Risk Adjusted)
idle-dai-yield	idledaiyield	IdleDAI (Best Yield)
idle-susd-yield	idlesusdyield	IdleSUSD (Yield)
idle-token	idle	Idle Cyber Game
idletreasureparty	dtevil	IdleTreasureParty
idle-tusd-yield	idletusdyield	IdleTUSD (Best Yield)
idle-usdc-risk-adjusted	idleusdcsafe	IdleUSDC (Risk Adjusted)
idle-usdc-yield	idleusdcyield	IdleUSDC (Yield)
idle-usdt-risk-adjusted	idleusdtsafe	IdleUSDT (Risk Adjusted)
idle-usdt-yield	idleusdtyield	IdleUSDT (Yield)
idle-wbtc-yield	idlewbtcyield	IdleWBTC (Best Yield)
idm-token	idm	IDM Coop
idol	$idol	IDOL
iethereum	ieth	iEthereum
iexec-rlc	rlc	iExec RLC
ifarm	ifarm	iFARM
ifoswap-token	h2o	IFOSwap
iftoken	ift	IFT
ig-gold	igg	IG Gold
ignis	ignis	Ignis
ignite-2	igt	Ignite
ignition	ic	Ignition
igtoken	ig	IGT
iguverse	igup	IguVerse
iht-real-estate-protocol	iht	IHT Real Estate Protocol
iinjaz	ijz	iinjaz
ijascoin	ijc	IjasCoin
ikolf	ikolf	IKOLF
ikura-token	ikura	Ikura
ilcoin	ilc	ILCOIN
illiquiddao	jpegs	IlliquidDAO
illuvium	ilv	Illuvium
ilus-coin	ilus	ILUS Coin
imagecoin	img	ImageCoin
imagictoken	imagic	iMagic
imayc	imayc	IMAYC
ime-lab	lime	iMe Lab
imgnai	imgnai	Image Generation AI
immortal-cat	icc	Immortal Cat
immortaldao	immo	ImmortalDAO
immortl	imrtl	Immortl
immutable	dara	Immutable
immutable-x	imx	ImmutableX
imo	imo	IMO
i-money-crypto	imc	i Money Crypto
imov	imt	IMOV
impactmarket	pact	impactMarket
impactx	impactx	ImpactX
impactxp	impactxp	ImpactXP
impactxprime	ixp	IMPACTXPRIME
imperial-obelisk	imp	Imperial Obelisk [OLD]
imperial-obelisk-2	imp	Imperial Obelisk
imperium-empires	ime	Imperium Empires
impermax	imx	Impermax [OLD]
impermax-2	ibex	Impermax
impossible-finance	if	Impossible Finance
impostors-blood	blood	Impostors Blood
improved-bitcoin	ibtc	Improved Bitcoin
impt	impt	IMPT
impulse-by-fdr	impulse	Impulse By FDR
impulseven	i7	ImpulseVen
incakoin	nka	IncaKoin
inci-token	inci	Inci
incognito-2	prv	Incognito
incoin	in	InCoin
income	income	Income
income-island	income	Income Island
incooom-genesis	cooom	Incooom Genesis
incube-chain	icb	Incube Chain
indahash	idh	indaHash
index-cooperative	index	Index Cooperative
index-coop-eth-2x-flexible-leverage-index	eth2x-fli-p	Index Coop - ETH 2x Flexible Leverage Index (Polygon)
index-coop-inverse-matic-flexible-leverage-index	imatic-fli-p	Index Coop - Inverse MATIC Flexible Leverage Index
index-coop-matic-2x-flexible-leverage-index	matic2x-fli-p	Index Coop - MATIC 2x Flexible Leverage Index
indexed-finance	ndx	Indexed Finance
indian-shiba-inu	indshib	Indian Shiba Inu
indigg	indi	IndiGG
indigo-dao-governance-token	indy	Indigo Protocol
indorse	ind	Indorse
inery	$inr	Inery
infam	inf	Infam
infchain	inf	InfChain
infinite-arcade-tic	tic	Infinite Arcade TIC
infinitee	inftee	Infinitee
infinite-ecosystem	infinity	Infinite Ecosystem
infinite-launch	ila	Infinite Launch
infinitorr	torr	InfiniTORR
infinitx	inx	InfinitX
infinity-angel	ing	Infinity Games
infinity-arena	inaz	Infinity Arena
infinitycash	ifc	InfinityCash
infinity-esaham	infs	Infinity Esaham
infinity-eth	ieth	Infinity ETH
infinity-game-nft	ign	Infinity Game NFT
infinitygaming	play	InfinityGaming
infinity-pad	ipad	Infinity Pad [OLD]
infinity-pad-2	ipad	Infinity PAD
infinity-protocol	infinity	Infinity Protocol
infinity-rocket-token	irt	Infinity Rocket
infinity-skies	isky	Infinity Skies
infinium	inf	Infinium
inflation-adjusted-euro	ieuros	Inflation Adjusted EURO
inflation-adjusted-usds	iusds	Inflation Adjusted USDS
inflationcoin	iflt	InflationCoin
inflation-hedging-coin	ihc	Inflation Hedging Coin
inflex-finance	inflex	Inflex Finance
infliv	ifv	INFLIV
influencer	imi	Influencer
influxcoin	infx	Influxcoin
infomatix	info	Infomatix
info-token	info	Kardia Info
inft-platform	inft	iNFT
inftspace	ins	iNFTspace
ingress	igr	Ingress
inheritance-art	iai	inheritance Art
init	init	Inite
injective-protocol	inj	Injective
ink	ink	Ink
ink-fantom	ink	Ink Fantom
ink-finance	quill	Ink Finance
inkz	inkz	INKz
inme-run	inmer	INME Run
inme-swap	inmes	Inme Swap [OLD]
inme-swap-2	inmes	Inme Swap
in-meta-travel	imt	In Meta Travel
innitforthetech	innit	InnitForTheTECH
innova	inn	Innova
innovaminex	minx	InnovaMinex
innovation-blockchain-payment	ibp	Innovation Blockchain Payment
innovative-bioresearch	innbc	Innovative Bioresearch Coin
ino-coin	ino	Ino Coin
inoovi	ivi	Inoovi
inpoker	inp	InPoker
inpulse-x	ipx	InpulseX
ins3-finance-coin	itf	Ins3.Finance Coin
insight-protocol	inx	Insight Protocol
insights-network	instar	INSTAR
instadapp	inst	Instadapp
instadapp-dai	idai	Instadapp DAI
instadapp-eth	ieth	Instadapp ETH
instadapp-usdc	iusdc	Instadapp USDC
instadapp-wbtc	iwbtc	Instadapp WBTC
instinct	ins	Instinct
instrumental-finance	strm	Instrumental Finance
insula	isla	Insula
insurace	insur	InsurAce
insurancefi	if	InsuranceFI
insure	sure	inSure DeFi
insuredao	insure	InsureDAO
insured-finance	infi	Insured Finance
insurepal	ipl	InsurePal
insureum	isr	Insureum
insurex	ixt	iXledger
intdestcoin	intd	INTDESTCOIN [OLD]
integral	itgr	Integral
integritee	teer	Integritee
intelligent-investment-chain	iic	Intelligent Investment Chain
intelly	intl	Intelly
interbtc	ibtc	interBTC
intercoin	itr	Intercoin
interest-bearing-bitcoin	ibbtc	Badger Interest Bearing Bitcoin
interest-bearing-eth	ibeth	Interest Bearing ETH
interest-bearing-moo	mmoo	Interest Bearing MOO
interest-compounding-eth-index	iceth	Interest Compounding ETH Index
interest-protocol	usdi	Interest Protocol USDi
interest-protocol-token	ipt	Interest Protocol Token
interfinex-bills	ifex	Interfinex Bills
intergalactic-cockroach	icc	Intergalactic Cockroach
interlay	intr	Interlay
inter-milan-fan-token	inter	Inter Milan Fan Token
internet-computer	icp	Internet Computer
internet-money	im	Internet Money
internet-node-token	int	INTchain
internet-of-energy-network	ioen	Internet of Energy Network
internxt	inxt	Internxt
interport-token	itp	Interport Token
intersola	isola	Intersola
inter-stable-token	ist	Inter Stable Token
interstellar-domain-order	ido	Interstellar Domain Order
intervalue	inve	InterValue
intexcoin	intx	INTEXCOIN
intucoin	intu	INTUCoin
inu	inu	Inu.
inugami	inugami	Inugami
inu-inu	inuinu	Inu Inu
inu-jump-and-the-temple-of-shiba	inujump	Inu Jump and the Temple of Shiba
inuko-finance	inuko	Inuko Finance
inusanity	inusanity	Inusanity
inu-token	inu	INU
inu-wars	iwr	Inu Wars
inverse-bitcoin-volatility-index-token	ibtcv	Inverse Bitcoin Volatility Index Token
inverse-ethereum-volatility-index-token	iethv	Inverse Ethereum Volatility Index Token
inverse-finance	inv	Inverse Finance
investdex	invest	InvestDex
investin	ivn	Investin
invest-like-stakeborg-index	ilsi	Invest Like Stakeborg Index
invictus	in	Invictus
invictus-capital-token	icap	Invictus Capital
invictus-hyprion-fund	ihf	Invictus Hyperion Fund
invi-token	invi	INVI
invoice-coin	ivc	Invoice Coin
invoke	iv	Invoker
invox-finance	invox	Invox Finance
iobusd	iobusd	ioBUSD
iocoin	ioc	I/O Coin
ioeth	ioeth	ioETH
ioex	ioex	ioeX
ioi-token	ioi	IOI
ion	ion	Ion
ionomy	ion	Ionomy
iostoken	iost	IOST
iota	miota	IOTA
ioten	iotn	IOTEN
iotex	iotx	IoTeX
iotex-monster-go	mtgo	Iotex Monster Go
iotexpad	tex	IoTeXPad
iotexshiba	ioshib	IoTexShiba
iouni	iouni	ioUNI
iousdc	iousdc	ioUSDC
iousdt	iousdt	ioUSDT
iowbtc	iowbtc	ioWBTC
iown	iown	iOWN
ipay	ipay	iPay
ipi-shorter	ipistr	IPI Shorter
ipor	ipor	IPOR
ipse	post	IPSE
ipulse	pls	iPulse
ipverse	ipv	IPVERSE
ipx-token	ipx	Tachyon Protocol
iq-cash	iq	IQ.cash
iqeon	iqn	IQeon
iqoniq	iqq	Iqoniq
irena-green-energy	irena	IRENA Green Energy
iridium	ird	Iridium
iris-ecosystem	iristoken	Iris Ecosystem
iris-network	iris	IRISnet
iris-token-2	iris	Iris
iron-bank	ib	Iron Bank
iron-bank-chf	ibchf	Iron Bank CHF
iron-bank-euro	ibeur	Iron Bank EURO
iron-bank-gbp	ibgbp	Iron Bank GBP
iron-bsc	iron	Iron BSC
iron-finance	ice	Iron Finance
iron-stablecoin	iron	Iron
iron-titanium-token	titan	IRON Titanium
isengard-nft-marketplace	iset-84e55e	Isengard NFT Marketplace
ishares-msci-world-etf-tokenized-stock-defichain	durth	iShares MSCI World ETF Tokenized Stock Defichain
isiklar-coin	isikc	Isiklar Coin
iskra-token	isk	ISKRA Token
islamicoin	islami	ISLAMICOIN
islander	isa	Islander
isotopec	iso	IsotopeC
ispolink	isp	Ispolink
istable	i-stable	iStable
istanbul-basaksehir-fan-token	ibfk	İstanbul Başakşehir Fan Token
istanbul-wild-cats-fan-token	iwft	İstanbul Wild Cats Fan Token
istardust	isdt	Istardust
istep	istep	iSTEP
italian-national-football-team-fan-token	ita	Italian National Football Team Fan Token
itam-games	itam	ITAM Games
itc	itc	ITC
itemverse	item	ITEMVERSE
iteration-syndicate	its	Iteration Syndicate
itheum	itheum	Itheum
itrust-governance-token	itg	iTrust Governance
itsbloc	itsb	ITSBLOC
itsmyne	myne	ITSMYNE
its-not-art	$na	Its Not Art
itube	itube	iTube
iusd	iusd	iUSD
ivar-coin	ivar	Ivar Coin
ivogel	ivg	IVOGEL
i-will-poop-it-nft	shit	I will poop it NFT
ixcoin	ixc	Ixcoin
ixicash	ixi	IxiCash
ixinium	xxa	Ixinium
ixirswap	ixir	Ixirswap
ixo	ixo	IXO
ix-swap	ixs	IX Swap
ix-token	ixt	IX
izanagi	nagi	Izanagi
ize	ize	IZE
izombie	izu	iZombie
izumi-bond-usd	iusd	iZUMi Bond USD
izumi-finance	izi	Izumi Finance
jackal-protocol	jkl	Jackal Protocol
jackpool-finance	jfi	JackPool.finance
jackpot	777	Jackpot
jackpotdoge	jpd	JackpotDoge
jackpot-universe	juni	Jackpot Universe
jack-token	jack	Jack Token
jacy	jacy	JACY
jade	jade	DeFi Kingdoms Jade
jade-currency	jade	Jade Currency
jade-protocol	jade	Jade Protocol
jaiho-crypto	jaiho	Jaiho Crypto
jail-kwon	jkwon	JAIL KWON
jam-token	jam	JAM Token
janus-network	jns	Janus Network
jarvis	jar	Jarvis+
jarvis-reward-token	jrt	Jarvis Reward
jarvis-synthetic-british-pound	jgbp	Jarvis Synthetic British Pound
jarvis-synthetic-euro	jeur	Jarvis Synthetic Euro
jarvis-synthetic-japanese-yen	jjpy	Jarvis Synthetic Japanese Yen
jarvis-synthetic-swiss-franc	jchf	Jarvis Synthetic Swiss Franc
jasan-wellness	jw	Jasan Wellness
jasmycoin	jasmy	JasmyCoin
javascript-token	js	JavaScript
jax-network	wjxn	Jax.Network
jd-coin	jdc	JD Coin
jdi-token	jdi	JDI
jedstar	$jed	JEDSTAR
jeet-detector-bot	jdb	JDB
jefe	jefe	Jefe
jejudoge	jejudoge	Jejudoge
jelly	jelly	Jelly
jelly-esports	jelly	Jelly eSports
jem	jem	Jem
jen-coin	jen	JEN COIN
jenny-dao-v2	jenny	Jenny DAO V2
jenny-metaverse-dao-token	ujenny	Jenny DAO V1
jeritex	jrit	JERITEX
jet	jet	JET
jetcoin	jet	Jetcoin
jetoken	jets	JeToken
jetset	jts	Jetset
jexchange	jex	JEXchange
jfin-coin	jfin	JFIN Coin
jigen	jig	Jigen
jigsaw	jigsaw	Jigsaw
jigstack	stak	Jigstack
jimizz	jmz	Jimizz
jimngalaxy	jimn	JimnGalaxy
jindoge	jindoge	Jindoge
jindo-inu	jind	Jindo Inu
jito-staked-sol	jitosol	Jito Staked SOL
jiyuu	jiyuu	Jiyuu
jk-coin	jk	JK Coin
jobchain	job	Jobchain
jodie-inu	jde	Jodie Inu
joe	joe	JOE
joe-hat-token	hat	Joe Hat
joe-yo-coin	jyc	Joe-Yo Coin
jojo	jojo	JOJO
jojos-adventure	jojo	JoJos Adventure
joke-community	$joke	Joke Community
jokermanor-metaverse	jkt	JokerManor Metaverse
jokes-meme	joke	Jokes Meme
joltify	jolt	Joltify
jomon-shiba	jshiba	Jomon Shiba
jones-dao	jones	Jones DAO
jones-glp	jglp	Jones GLP
jones-usdc	jusdc	Jones USDC
jot-art	jot	Jot Art
joulecoin	xjo	Joulecoin
joys	joys	JOYS
joystick1	joy	Joystick
joystick-club	joy	Joystick.club
jpeg-d	jpeg	JPEG'd
jpegvaultdao-2	jp3g	JP3Gvault
jpex-coin	jpc	JPEX Coin
jpg-nft-index	jpg	JPG NFT Index
jpgoldcoin	jpgc	JPGoldCoin
jpool	jsol	JPool
jpyc	jpyc	JPY Coin v1
jpy-coin	jpyc	JPY Coin
jswap-finance	jf	Jswap.Finance
jubi-token	jt	Jubi Token
juggernaut	jgn	Juggernaut
juicebox	jbx	Juicebox
julien	julien	JULIEN
julswap	juld	JulSwap
jumbo-exchange	jumbo	Jumbo Exchange
jump-defi	jump	Jump DeFi
jumptoken	jmpt	JumpToken
jumpx	jumpx	JumpX
junca-cash	jcc	Junca cash
jungle	jungle	Jungle
jungle-defi	jfi	Jungle DeFi
jungleking-tigercoin	tiger	JungleKing TigerCoin
juno-network	juno	JUNO
juno-punk	punk	JUNO PUNK
junoswap-raw-dao	raw	JunoSwap
junsonmingchancoin	jmc	Junsonmingchancoin
jupiter	jup	Jupiter
jur	jur	Jur
jurassic_nodes	dino	Jurassic Nodes
just	jst	JUST
justcarbon-governance	jcg	JustCarbon Governance
justcarbon-removal	jcr	JustCarbon Removal
justfarm	jfm	JustFarm
justmoney-2	jm	JustMoney
just-stablecoin	usdj	JUST Stablecoin
juventus-fan-token	juv	Juventus Fan Token
k21	k21	K21
kaafila	kfl	Kaafila
kabosu	kabosu	Kabosu
kabosu-inu	kabosu inu	Kabosu Inu
kaby-arena	kaby	Kaby Arena
kaby-gaming-token	kgt	Kaby Gaming
kaddex	kdx	Kaddex
kadena	kda	Kadena
kaeri	kaeri	Kaeri
kagla-finance	kgl	Kagla Finance
kaidex	kdx	Kaidex
kai-inu	kaiinu	Kai Inu
kaiju-worlds	kaiju	Kaiju Worlds
kainet	kainet	KAINET
kaizen	kzen	Kaizen
kaka-nft-world	kaka	KAKA NFT World
kala	kala	Kala
kalamint	kalam	Kalamint
kalao	klo	Kalao
kalima-blockchain	klx	Kalima Blockchain
kalissa	kali	Kalissa
kalisten	ks	Kalisten
kalkicoin	klc	Kalkicoin
kalkulus	klks	Kalkulus
kalmar	kalm	KALM
kamaleont	klt	Kamaleont
kambria	kat	Kambria
kampay	kampay	Kampay
kan	kan	BitKan
kanagawa-nami	okinami	Kanagawa Nami
kanaloa-network	kana	Kanaloa Network
kang3n	kang3n	kang3n
kanga-exchange	kng	Kanga Exchange
kangal	kangal	Kangal
kangaroo	gar	Kangaroo
kanpeki	kae	Kanpeki
kapital-dao	kap	Kapital DAO
kappa	kappa	Kappa
karastar-kara	kara	KaraStar
karastar-umy	umy	KaraStar UMY
karbo	krb	Karbo
kardiachain	kai	KardiaChain
karencoin	karen	KarenCoin
karmadao	kdao	KarmaDao
karma-dao	karma	Karma DAO
karmaverse	knot	Karmaverse
karmaverse-zombie-serum	serum	Karmaverse Zombie Serum
karsiyaka-taraftar-token	ksk	Karşıyaka Taraftar Fan Token
karura	kar	Karura
kasa-central	kasa	Kasa Central
kashhcoin	kashh	Kashhcoin
kaspa	kas	Kaspa
kassandra	kacy	Kassandra
kasta	kasta	Kasta
katalyo	ktlyo	Katalyo
katana-inu	kata	Katana Inu
kattana	ktn	Kattana
katz-token	katz	KATZ House
kauri	kau	Kauri
kava	kava	Kava
kava-lend	hard	Kava Lend
kava-swap	swp	Kava Swap
kawaii-islands	kwt	Kawaii Islands
kawaiinu	kawaii	kawaiINU
kawakami	kawa	Kawakami
kay-pacha	pacha	Kay Pacha
kayserispor	kysr	Kayserispor
kazoku-inu	kazoku	Kazoku INU
kcal	kcal	KCAL
kcash	kcash	Kcash
kcc-memepad	kccm	KCC MemePad
kccpad	kccpad	KCCPad
kdag	kdag	King DAG
kdlaunch	kdl	KDLaunch
kdswap	kds	KDSwap
keep3rv1	kp3r	Keep3rV1
keep4r	kp4r	Keep4r
keep-network	keep	Keep Network
keeps-coin	kverse	KEEPs Coin
keeshond	$ksh	Keeshond
keisuke-inu	$kei	Keisuke Inu
kekchain	kek	KeKChain
kekwcoin	kekw	Kekwcoin
kelvpn	kel	KelVPN
kemacoin	kema	KemaCoin
kenshi	kenshi	Kenshi
kentucky-fried-crypto	kfc	Kentucky Fried Crypto
kephi-gallery	kphi	Kephi Gallery
kepler-network	kmw	Kepler Network
kermit	kermit	Kermit Finance
keyco	kec	Keyco
keyfi	keyfi	KeyFi
keys-token	keys	Keys
keytango	tango	keyTango
kfan-token	kfan	KFan
khalifa-finance	khalifa	Khalifa Finance
khaos-finance	khaos	Khaos Finance
ki	xki	KI
kiba-inu	kiba	Kiba Inu
kibbleswap	kib	KibbleSwap
kichicoin	kich	KichiCoin
kick	kick	Kick
kick-io	kick	KICK.IO
kickpad	kpad	KickPad
kikswap	kik	Kikswap
killswitch	ksw	KillSwitch
killthezero	ktz	KILLTHEZERO
kiloample	kmpl	KiloAmple
kilo-shiba-inu	kshib	Kilo Shiba Inu
kilt-protocol	kilt	KILT Protocol
kimchi-finance	kimchi	KIMCHI.finance
kimex	kmx	KIMEX
kin	kin	Kin
kindly	kind	Kindly
kindness-for-soul	kfs g	Kindness For Soul
kinect-finance	knt	Kinect Finance
kineko	kko	KKO Protocol
kineko-knk	knk	Kineko
kine-protocol	kine	Kine Protocol
king-arthur	bking	King Arthur
kingaru	kru	Kingaru
kingcorgi-chain	kcc	KingCorgi Chain
kingdoge	kdoge	KingDoge
king-dog-inu	kingdog	King Dog Inu
kingdom-game-4-0	kdg	Kingdom Game 4.0
kingdom-karnage	kkt	Kingdom Karnage
kingdom-quest	kgc	Kingdom Quest
kingdom-raids	krs	Kingdom Raids
kingdomswap	ks	Kingdomswap [OLD]
kingdomswap-2	ks2	Kingdom Swap 2.0
kingdomverse	$king	Kingdomverse
kingdomx	kt	KingdomX
king-forever	kfr	KING FOREVER
kingmaker	power	Kingmaker
king-of-legends-2	kol	King of Legends
king-of-shiba	kingshiba	King of Shiba
kingpad	crown	KingPad
king-samo	ksamo	King Samo
kings-coin	kings	Kings Coin
king-shiba	kingshib	King Shiba
kingspeed	ksc	KingSpeed
kintsugi	kint	Kintsugi
kintsugi-btc	kbtc	Kintsugi BTC
kira	kira	KIRA
kira-network	kex	KIRA Network
kirobo	kiro	KIRO
kishiburno	kishiburno	Kishiburno
kishimoto	kishimoto	Kishimoto
kishimoto-inu	kishimoto	Kishimoto (old)
kishu-baby	kishubaby	Kishu Baby
kishu-inu	kishu	Kishu Inu
kishu-ken	kishk	Kishu Ken
kishutama	kishutama	Kishutama
kissan	ksn	Kissan
kitsumon	$kmc	Kitsumon
kitsune-inu-2	kitsune	Kitsune Inu
kitsune-mask	kmask	Kitsune Mask
kitten-coin	kittens	Kitten Coin
kittenfinance	kif	KittenFinance
kitty	kit	Kitty
kittycake	kcake	KittyCake
kittycoin	kitty	Kitty Coin
kitty-coin-solana	kitty	Kitty Coin Solana
kitty-finance	kitty	Kitty Finance
kitty-inu	kitty	Kitty Inu
kitty-solana	kitty	Kitty Solana
kitty-vault-nftx	kitty	KITTY Vault (NFTX)
kiwigo	kgo	Kiwigo
klap-finance	klap	Klap Finance
klaycity-orb	orb	Orbcity
klaydice	dice	Klaydice
klayfi-finance	kfi	KlayFi Finance
klayswap-protocol	ksp	KlaySwap Protocol
klaytn-dai	kdai	Klaytn Dai
klay-token	klay	Klaytn
klayuniverse	kut	KlayUniverse
kleekai	klee	KleeKai
klend	klt	KLend
kleros	pnk	Kleros
kleva	kleva	KLEVA
klever	klv	Klever
klever-finance	kfi	Klever Finance
klex	klex	KLEX
klima-dao	klima	Klima DAO
klimatas	kts	Klimatas
kling	kling	Kling
kmushicoin	ktv	Kmushicoin
knights-peasants	knight	Knights & Peasants
knightswap	knight	KnightSwap
knight-war-spirits	kws	Knight War Spirits
knit-finance	kft	Knit Finance
knoxfs	kfx	KnoxFS
koacombat	koacombat	KoaCombat
koakuma	kkma	Koakuma
koala-token	mkoala	Koala
kobocoin	kobo	Kobocoin
kocaelispor-fan-token	kstt	Kocaelispor Fan Token
kodachi-token	kodachi	Kodachi Token
koda-finance	koda	Koda Cryptocurrency
kodi	kodi	KODI
koel-coin	koel	Koel Coin
kogecoin	kogecoin	KogeCoin
koi-network	koi	Koi Network
koinos	koin	Koinos
koisan	kic	Koisan
koji	koji	Koji
kok	kok	KOK
kokoa-finance	kokoa	Kokoa Finance
kokoa-stable-dollar	ksd	Kokoa Stable Dollar
kokoswap	koko	KokoSwap
kolibri-dao	kdao	Kolibri DAO
kolibri-usd	kusd	Kolibri USD
kollect	kol	Kollect
kollector	kltr	Kollector
kolnet	kolnet	KOLNET
kols-offering-token	kot	Kols Offering
komet	komet	Komet
kommunitas	kom	Kommunitas
komodo	kmd	Komodo
kompete	kompete	KOMPETE Token
kondux-v2	kndx	KONDUX
kong-land-alpha-citizenship	citizen	KONG Land Alpha Citizenship
kongtama	kongtama	Kongtama
konjungate	konj	KONJUNGATE
konnect	kct	Konnect
konomi-network	kono	Konomi Network
konpay	kon	KonPay
korea-entertainment-education-shopping	kees	Korea Entertainment Education & Shopping
kori-inu	kori	Kori Inu
koromaru	koromaru	KOROMARU
korss-chain-launchpad	kclp	Kross Chain Launchpad
kostren-finance	ktn	Kostren Finance
koto	koto	Koto
kounotori	kto	Kounotori
kpop-coin	kpop	KPOP Coin
krabots	krac	Krabots
kragger-inu	kinu	Kragger Inu
krakenpad	krp	Krakenpad
kranz-token	krz	Kranz
krause	$krause	KRAUSE
kred	kred	KRED
krida-fans	krida	Krida Fans
krill	krill	Krill
kripto	kripto	Kripto
kripto-galaxy-battle	kaba	Kripto Galaxy Battle
krogan	kro	Krogan
kromatika	krom	Kromatika
krook-coin	krook	Krook Coin
krown	krw	KROWN
kryll	krl	KRYLL
kryptobellion	krypto	Kryptobellion
krypto-kitty	kty	Krypto Kitty
kryptomon	kmon	Kryptomon
krypton-dao	krd	Krypton DAO
krypton-token	kgc	Krypton Galaxy Coin
kryptopets	kpets	KryptoPets
kryptview	kvt	Kryptview
kryxivia-game	kxa	Kryxivia Game
kryza-network	krn	KRYZA Network
ksm-starter	kst	Karus Starter
kstarcoin	ksc	KStarCoin
k-tune	ktt	K-Tune
kubecoin	kube	KubeCoin
kubic	kubic	Kubic
kucoin-shares	kcs	KuCoin
kudoe	kdoe	Kudoe
kudoge	kudo	KuDoge
kujira	kuji	Kujira
kuky-star	kuky	Kuky Star
kulupu	klp	Kulupu
kumadex-token	dkuma	KumaDex Token
kuma-inu	kuma	Kuma Inu
kumu-finance	kumu	Kumu Finance
kunci-coin	kunci	Kunci Coin
kunoichix	kuno	KunoichiX
kurai-inu	kurai	Kurai Inu
kuramainu	kunu	KuramaInu
kurobi	kuro	Kurobi
kuro-shiba	kuro	Kuro Shiba
kurrent	kurt	Kurrent
kusama	ksm	Kusama
kusd-t	kusd-t	KUSD-T
kush-finance	kseed	Kush Finance
kusunoki-samurai	kusunoki	Kusunoki Samurai
kuswap	kus	KuSwap
kuwa-oracle	kuor	Kuwa Oracle
kuy-token	kuy	KUY
kwai	kwai	KWAI
kwenta	kwenta	Kwenta
kwiktrust	ktx	KwikTrust
kyanite	kyan	Kyanite
kyberdyne	kbd	Kyberdyne
kyber-network	kncl	Kyber Network Crystal Legacy
kyber-network-crystal	knc	Kyber Network Crystal
kyccoin	kycc	KYCCOIN
kylin-network	kyl	Kylin Network
kyoko	kyoko	Kyoko
kyrrex	krrx	Kyrrex
kyte-one	kte	Kyte.One
kzcash	kzc	Kzcash
l2pad	l2pad	L2PAD
l3usd	l3usd	L3USD
label-foundation	lbl	LABEL Foundation
labracoin	labra	LabraCoin
labs-group	labs	LABS Group
labs-protocol	labs	LABS Protocol
laddercaster	lada	LadderCaster
lady-uni	luni	Lady Uni
laeeb	laeeb	LaEeb
la-eeb	la´eeb	La´eeb
la-eeb-football	laeeb	La'eeb Football
laeeb-inu	laeeb	Laeeb Inu
laeeb-inu-erc	laeeb	Laeeb Inu ERC
laeeb-token-2	laeeb	LaEeb Token
laika	laika	Laika
laine-stake	lainesol	Laine Stake
lakeviewmeta	lvm	LakeViewMeta
lambda	lamb	Lambda
lambda-markets	lmda	Lambda Markets
lamden	tau	Lamden
lamea	lamea	LAMEA
lanacoin	lana	LanaCoin
lance-coin	lce	Lance Coin
lanceria	lanc	Lanceria
landboard	land	Landboard
land-of-conquest-slg	slg	Land Of Conquest SLG
land-of-fantasy	lof	Land of Fantasy
landshare	land	Landshare
landworld	lwd	Landworld
lapad	lpdt	LaPAD
la-peseta	pta	La Peseta
lapislazuli	lilli	Lapislazuli
laqira-protocol	lqr	Laqira Protocol
larix	larix	Larix
laro	lrc	Laro
lasereyes	lsr	LaserEyes
laser-eyes	lasereyes	Laser Eyes
lasrever	lsvr	Lasrever
last-survivor	lsc	Last Survivor
latiumx	latx	LatiumX
latoken	la	LA
lattice-token	ltx	Lattice
launchblock	lbp	LaunchBlock
launchpool	lpool	Launchpool
launchverse	xlv	LaunchVerse
launchwall	wall	LaunchWall
launchzone	lz	LaunchZone
laurus-coin	lscn	Laurus Coin
lavaswap	lava	Lavaswap
lavax-labs	lavax	LavaX Labs
law	law	LAW
law-blocks	lbt	Law Blocks
law-token	law	Law Token
layer2dao	l2dao	Layer2DAO
lazio-fan-token	lazio	Lazio Fan Token
lazy-shiba	lazyshiba	Lazy Shiba
lbk	lbk	LBK
lbry-credits	lbc	LBRY Credits
lcg	lcg	LCG
lcms	lcms	LCMS
lcx	lcx	LCX
lead-token	lead	Lead
leafcoin	leaf	Leafcoin
leaguedao-governance-token	leag	LeagueDAO Governance
league-of-ancients	loa	League of Ancients
league-of-kingdoms	loka	League of Kingdoms
league-of-pets	glory	League Of Pets
league-of-zodiacs	loz	League of Zodiacs
lean	lean	Lean
leandro-lopes	lopes	Leandro Lopes
lean-management-token	lean	Leancoin
leapableio	lea	LeapableIO
leap-token	leap	LEAP Token
learning-cash-2	ead	Learning Cash
learning-star	lstar	Learning Star
leash	leash	Doge Killer
ledgerscore	led	LedgerScore
ledgis	led	Ledgis
ledgity	lty	Ledgity
leeds-united-fan-token	lufc	Leeds United Fan Token
leek-token	leek	Leek
legacy-ichi	ichi	Legacy ICHI
legend-of-fantasy-war	lfw	Linked Finance World
legends	fwcl	Legends
legends-of-aria	aria	Legends Of Aria
legends-of-elysium	loe	Legends of Elysium
legends-of-mitra	mita	Legends of Mitra
legends-room	more	More
legia-warsaw-fan-token	leg	Legia Warsaw Fan Token
legion-network	lgx	Legion Network
lego-coin-v2	lego	Lego Coin V2
legolas-exchange	lgo	LGO
leicester-tigers-fan-token	tigers	Leicester Tigers Fan Token
leisure	lis	Leisure
leisuremeta	lm	LeisureMeta
leisurepay	lpy	LeisurePay
lemochain	lemo	LemoChain
lemonchain	lemc	LemonChain
lemond	lemd	Lemond
lemonn-token	lmn	Lemonn
lemon-token	lemn	Crypto Lemon
lenda	lenda	Lenda
lendefi	ldfi	Lendefi
lend-finance	lend	Lend Finance
lend-flare-dao-token	lft	Lend Flare Dao
lendhub	lhb	Lendhub
lendingblock	lnd	Lendingblock
lendroid-support-token	lst	Lendroid Support
leo	leo	Leo
leonicorn-swap	leos	Leonicorn Swap
leonidas	leo	Leonidas
leonidasbilic	lio	Leonidasbilic
leonidas-token	leonidas	Leonidas Token
leon-token	leon	Leonicorn LEON
leopard	leopard	Leopard
leo-token	leo	LEO Token
lepasa	lepa	Lepasa
leprechaun-finance	lep	Leprechaun Finance
lepricon	l3p	Lepricon
leslar-metaverse	llverse	LESLAR Metaverse
letcoinshop	lcs	LetCoinShop
lethean	lthn	Lethean
letitride	lir	LetItRide
lets-go-brandon	letsgo	Lets Go Brandon
levante-ud-fan-token	lev	Levante U.D. Fan Token
leve-invest	leve	Leve Invest
level	lvl	Level
levelapp	lvl	LevelApp
levelg	levelg	LEVELG
level-governance	lgo	Level Governance
lever	lever	LeverFi
leverageinu	levi	LeverageInu
leverj-gluon	l2	Leverj Gluon
lever-network	lev	Lever Network
levin	levin	Levin
levolution	levl	Levolution
lexit-2	lexi	LEXIT
lfgswap-finance	lfg	LFGSwap Finance
lgcy-network	lgcy	LGCY Network
lhcoin	lhcoin	LHCoin
libera-financial	libera	Libera Financial
liber-coin	lbr	LIBER COIN
libero-financial	libero	Libero Financial
libfx	libfx	Libfx
libonomy	lby	Libonomy
libra-credit	lba	Libra Credit
libre	libre	Libre
lichang	lc	Lichang
lido-dao	ldo	Lido DAO
lido-dao-wormhole	ldo	Lido DAO (Wormhole)
lido-on-kusama	wstksm	Lido on Kusama
lido-staked-matic	stmatic	Lido Staked Matic
lido-staked-polkadot	stdot	Lido Staked Polkadot
lido-staked-sol	stsol	Lido Staked SOL
lien	lien	Lien
lif3	lif3	LIF3
lif3-lshare	lshare	LIF3 LSHARE
life-coin	lfc	Life Coin
life-crypto	life	Life Crypto
life-dao	lf	Life DAO
lifetime	lft	Lifetime
life-token-v2	ltnv2	Life v2
lifinity	lfnty	Lifinity
lightcoin	lhc	Lightcoin
light-defi	light	Light Defi
lightening-cash	lic	Lightening Cash
lightning-bitcoin	lbtc	Lightning Bitcoin
lightningcash-gold	lnc	LightningCash
lightningcoin	lc	LightningCoin
lightning-protocol	light	Lightning Protocol
lightstreams	pht	Lightstreams Photon
light-year	lc	Light Year
lightyears	year	Lightyears
likecoin	like	LikeCoin
lil-floki	lilfloki	Lil Floki
lilith-swap	llth	Lilith Swap
lillion	lil	Lillion
lilly-finance	ly	Lilly Token
limcore	limc	LimCore
limestone-network	limex	Limestone Network
limited-euro	leur	Limited Euro
limited-usd	lusd	Limited USD
limitswap	limit	LimitSwap
limocoin-swap	lmcswap	Limocoin Swap
lina	lina	LINA
linda	mrx	Metrix Coin
linear	lina	Linear
linear-protocol	linear	LiNEAR Protocol
linework-coin	lwc	Linework Coin
lingose	ling	Lingose
link	ln	LINK
linka	linka	LINKA
linkart	lar	LinkArt
linkcoin-token	lkn	LinkCoin
linkdao	lkd	LinkDao
linker-coin	lnc	Linker Coin
linkeye	let	Linkeye
link-machine-learning	lml	Link Machine Learning
linkpool	lpl	LinkPool
links	links	Links
linksync	sync	LinkSync
link-yvault	yvlink	LINK yVault
linspirit	linspirit	linSpirit
lion-scrub-money	lion	Lion Scrub Money [OLD]
lion-scrub-money-2	lion	Lion Scrub Money
lion-token	lion	Lion
liq-protocol	liq	LIQ Protocol
liquicats	meow	LiquiCats
liquid-astr	nastr	Liquid ASTR
liquid-collectibles	lico	Liquid Collectibles
liquid-cro	lcro	Liquid CRO
liquid-crowdloan-dot	lcdot	Liquid Crowdloan DOT
liquiddriver	lqdr	LiquidDriver
liquid-finance	liqd	Liquid Finance
liquid-icp	licp	Liquid ICP
liquidifty	lqt	Liquidifty
liquidify	lat	Liquidify
liquid-ksm	lksm	Liquid KSM
liquid-staked-ethereum	lseth	Liquid Staked ETH
liquid-staked-eth-index	lseth	Liquid Staked ETH Index
liquid-staking-crescent	bcre	Liquid Staking Crescent
liquid-staking-dot	ldot	Liquid Staking Dot
liquidswap	lqd	LiquidSwap
liquidus	liq	Liquidus
liquinity	lqnty	Liquinity
liquity	lqty	Liquity
liquity-usd	lusd	Liquity USD
liqwid-finance	lq	Liqwid Finance
lisk	lsk	Lisk
listenify	audio	Listenify
lit	lit	LIT
litebar	ltb	LiteBar
litebitcoin	lbtc	LiteBitcoin
litecash	cash	Litecash
litecoin	ltc	Litecoin
litecoin-cash	lcc	Litecoin Cash
litecoin-plus	spb	SpiderByte
litecoin-sv	lsv	Litecoin SV
litecoin-token	ltk	Litecoin LTK
litecoin-ultra	ltcu	LiteCoin Ultra
litecoinz	ltz	LitecoinZ
litedex	ldx	Litedex
litedoge	ldoge	LiteDoge
litentry	lit	Litentry
liteusd	lite	LiteUSD
litex	lxt	LITEX
litherium	lith	Litherium
lithium-2	lithium	Lithium
lithium-finance	lith	Lithium Finance
lithium-ventures	ions	Lithium Ventures
lithosphere	litho	Lithosphere
lith-token	lith	Lith [OLD]
lition	lit	Lition
little-angry-bunny-v2	lab-v2	Little Angry Bunny v2
little-bunny-rocket	lbr	Little Bunny Rocket
littleghosts-ectoplasm	ecto	LittleGhosts Ectoplasm
littleinu	linu	LittleInu
little-rabbit-v2	ltrbt	Little Rabbit V2
littlesesame	lsc	Littlesesame
little-ugly-duck	lud	Little Ugly Duck
litx	litx	Lith Token
liux	liux	LIUX
livegreen-coin	lgc	LiveGreen Coin
livepeer	lpt	Livepeer
live-swap-coin	lsc	Live Swap Coin
livetrade-token	ltd	LiveTrade
lixir-protocol	lix	Lixir Finance
lizard-token	lizard	Lizard
lizardtoken-finance	liz	LizardToken.Finance
lnko-token	lnko	LNKO
loa-protocol	loa	LOA Protocol
lobby	lby	Lobby
lobster	$lobster	LOBSTER
localcoinswap	lcs	LocalCoinSwap
local-money	local	Local Money
localtrade	ltt	LocalTrade
local-traders	lct	Local Traders
locgame	locg	LOCGame
lockchain	loc	LockTrip
locker-token	lkt	Locker Token
lockness	lkn	Lockness
locometa	loco	LocoMeta
locus-chain	locus	Locus Chain
lodestar	lode	Lodestar
lode-token	lode	LODE Token
lofi	lofi	LOFI
loge-of-the-rings	loge	Loge Of The Rings
logos	log	LOGOS
loki-network	oxen	Oxen
lokr	lkr	Lokr
lol	lol	LOL
loltoken	lol	LOLTOKEN
lonelyfans	lof	LonelyFans
loobr	loobr	LooBr
lookscoin	look	LooksCoin
looksrare	looks	LooksRare
loomi	loomi	Loomi
loom-network	loomold	Loom Network (OLD)
loom-network-new	loom	Loom Network (NEW)
loon-network	loon	Loon Network
loop	loop	LOOP
loopnetwork	loop	LoopNetwork
loopring	lrc	Loopring
loopswap	lswap	LoopSwap
loot	loot	Lootex
loot-dollar	lootdollar	Loot Dollar
loot-token	loot	Loot
lord-of-power-golden-eagle	gde	Lord of Power Golden Eagle
lords	lords	LORDS
lordtoken	ltt	LordToken
loserchick-egg	egg	LoserChick EGG
loser-coin	lowb	Loser Coin
lossless	lss	Lossless
lost-world	lost	Lost World
lotoblock	loto	Lotoblock
lot-trade	lott	LOT.TRADE
loud-market	loud	Loud Market
louvre-finance	louvre	Louvre Finance
lovechain	lov	LoveChain
lovelace-world	lace	Lovelace World
lovely-inu-finance	lovely	Lovely Inu finance
lovely-swap-token	lst	Lovely Swap
lovepot-token	love	LovePot
lox-network	lox	Lox Network
lp-3pool-curve	3crv	LP 3pool Curve
lp-finance	lpfi	LP Finance DAO
lpi-dao	lpi	LPI DAO
lp-renbtc-curve	renbtccurve	LP renBTC Curve
lp-scurve	scurve	LP-sCurve
lp-yearn-crv-vault	lp-ycrv	LP Yearn CRV Vault
lto-network	lto	LTO Network
ltradex	ltex	Ltradex
lua-token	lua	LuaSwap
luca	luca	LUCA
lucent	lcnt	Lucent
lucha	lucha	Lucha
lucidao	lcd	Lucidao
luck2earn	luck	Luck2Earn
luckchain	bash	LuckChain
luckdao	luck	LuckDao
luckstar	lst	Luckstar
lucky-block	lblock	Lucky Block
lucky-cats	katz	Lucky Cats
luckychip	lc	LuckyChip
luckydragon	lucky	LuckyDragon
lucky-lion	lucky	Lucky Lion
lucky-property-development-invest	lpdi	Lucky Property Development Invest
lucky-roo	roo	Lucky Roo
luckytoad	toad	LuckyToad
lucretius	luc	Lucretius
lucro	lcr	Lucro
lucrosus-capital	$luca	Lucrosus Capital
lucy	lucy	LUCY
ludena-protocol	ldn	Ludena Protocol
ludos	lud	Ludos Protocol
luffy-inu	luffy	Luffy
lukso-token	lyxe	LUKSO
lulu-market-luck	luck	LULU Market Luck
lumenswap	lsp	Lumenswap
lumerin	lmr	Lumerin
lumi	lumi	LUMI
lumi-credits	lumi	LUMI Credits
lumiiitoken	lumiii	Lumiii
luminos-mining-protocol	lumi	Luminos Mining Protocol
lum-network	lum	Lum Network
luna-ape-protocol	$lunape	Luna Ape Protocol
lunachow	luchow	LunaChow
lunadoge	loge	LunaDoge
lunafi	lfi	Lunafi
lunagens	lung	LunaGens
luna-inu	linu	Luna Inu
lunaland	lln	LunaLand
lunaone	xln	LunaOne
luna-pad	lunapad	Luna-Pad
lunar	lnr	Lunar [OLD]
lunar-2	lnr	Lunar
luna-rush	lus	Luna Rush
lunatics	lunat	Lunatics
luna-wormhole	lunc	Terra Classic (Wormhole)
lunchdao	lunch	LunchDAO
lunch-money	lmy	Lunch Money
lunes	lunes	Lunes
lung-protocol	l2p	Lung Protocol
lunr-token	lunr	Lunr
lunyr	lun	Lunyr
lusd	lusd	LUSD
lusd3crv-f	lusd3crv	LUSD3CRV-f
lusd-yvault	yvlusd	LUSD yVault
luto-cash	luto	Luto Cash
lux-bio-exchange-coin	lbxc	LUX BIO EXCHANGE COIN
luxcoin	lux	LUXCoin
luxeracing	luxe	LuxeRacing
luxetoken	luxetoken	LuxeToken
luxfi	lxf	LuxFi
luxo	luxo	Luxo
luxor	lux	Luxor
luxtto	lxto	LuxTTO
luxurious-pro-network-token	lpnt	Luxurious Pro Network
luxy	luxy	Luxy
luzion-protocol	lzn	Luzion Protocol
lydia-finance	lyd	Lydia Finance
lyfe-2	lyfe	Lyfe
lyfe-gold	lgold	Lyfe Gold
lyfe-silver	lsilver	Lyfe Silver
lympo	lym	Lympo
lympo-market-token	lmt	Lympo Market
lynkey	lynk	LynKey
lynx	lynx	Lynx
lyocredit	lyo	LYO Credit
lyptus-token	lyptus	Lyptus
lyra	lyr	Lyra
lyra-finance	lyra	Lyra Finance
lys-capital	lys	LYS Capital
m	m	M
m2	m2	M2
m7v2	m7v2	M7V2
macaronswap	mcrn	MacaronSwap
machinecoin	mac	Machinecoin
madagascar-token	$time	Madagascar
mad-bucks	mad	MAD Bucks
madchad	madchad	MadChad
made-in-real-life	mirl	Made In Real Life
mad-hatter-society	madhat	Mad Hatter Society
mad-meerkat-etf	metf	Mad Meerkat ETF
mad-meerkat-optimizer	mmo	Mad Meerkat Optimizer
mad-meerkat-optimizer-polygon	mmo	Mad Meerkat Optimizer (Polygon)
mad-network	mad	MADNetwork
mad-usd	musd	Mad USD
madworld	umad	MADworld
mafacoin	mafa	MafaCoin
maga-coin	maga	MAGA Coin BSC
maga-coin-eth	maga	MAGA Coin ETH
magic	magic	Magic
magic-beasties	bsts	Magic Beasties
magic-birds-token	mbt	Magic Birds
magiccraft	mcrt	MagicCraft
magic-cube	mcc	Magic Cube Coin
magic-cube-finance	mast	Magic Cube Finance
magicdoge	magicdoge	MagicDOGE
magic-eggs	maga	Magic Eggs
magic-elpis-gem	meg	Magic Elpis Gem
magic-internet-money	mim	Magic Internet Money
magic-manor	mgc	Magic Manor
magicofgold	magic	MagicofGold
magic-of-universe	mgc	Magic of Universe
magic-power	mgp	Magic Power
magic-token	magic	MagicLand
magik	magik	Magik
magnetgold	mtg	MagnetGold
magpie	mgp	Magpie
magpiecoin	mgpc	MagpieCoin
mahadao	maha	MahaDAO
maia	maia	Maia
maiar-dex	mex	xExchange
maidcoin	$maid	MaidCoin
maidsafecoin	emaid	MaidSafeCoin
main	main	Main
mainframe	mft	Hifi Finance [OLD]
mainstream-for-the-underground	mftu	Mainstream For The Underground
maison-capital	msn	Maison Capital
maker	mkr	Maker
makes	mks	Makes
makiswap	maki	MakiSwap
malinka	mlnk	Malinka
mamaverse	coinmama	MamaVerse
mammoth-mmt	mmt	Mammoth MMT
manarium	ari	Manarium
manateecoin	mtc	ManateeCoin
manchester-city-fan-token	city	Manchester City Fan Token
mancium	manc	Mancium
mandala-2	mndl	Mandala
mandala-exchange-token	mdx	Mandala Exchange
mandox-2	mandox	MandoX
maneki-neko	neki	Maneki-neko
mangamon	man	MangaMon
mangata-x	mgx	Mangata X
manga-token	$manga	Manga
mangochain	mgp	MangoChain
mangoman-intelligent	mmit	MANGOMAN INTELLIGENT
mango-markets	mngo	Mango
manifold-finance	fold	Manifold Finance
manna	manna	Manna
mantis-network	mntis	Mantis Network
mantra-dao	om	MANTRA
manufactory-2	mnft	ManuFactory
many-worlds	many	Many Worlds
maorabbit	maorabbit	MaoRabbit
mao-zedong	mao	Mao Zedong
mapcoin	mapc	MapCoin
maple	mpl	Maple
mapmetrics	mmaps	MapMetrics
maps	maps	MAPS
marble	$marble	Marble Dao
marble-heroes	mbh	Marble Heroes
marbleprix	marblex7	MarblePrix
marblex	mbx	Marblex
marcopolo	map	MAP Protocol
marginswap	mfi	Marginswap
marhabadefi	mrhb	MarhabaDeFi
maria	maria	Maria
marinade	mnde	Marinade
mariofloki	mrfloki	MarioFloki
market-ledger	ml	Market Ledger
market-making-pro	mmpro	Market Making Pro
marketmove	move	MarketMove
market-neutral-yield-eth	mnye	Market Neutral Yield ETH
marketpeak	peak	PEAKDEFI
marlin	pond	Marlin
marmaj	marmaj	Marmaj
marmalade-token	mard	Marmalade Token
marnotaur	taur	Marnotaur
marosca-inu	marosca	Marosca Inu
mars	mars	Mars
mars4	mars4	MARS4
marscoin	mars	Marscoin
marscolony	clny	MarsColony
marsdao	mdao	MarsDAO
mars-doge	marsdoge	Mars Doge
mars-ecosystem-token	xms	Mars Ecosystem
marshall-rogan-inu	mri	Marshall Inu
mars-inu	marsinu	Mars Inu
mars-protocol-a7fcbcfb-fd61-4017-92f0-7ee9f9cc6da3	mars	Mars Protocol
marsrise	marsrise	MarsRise
marsupilamii	mars	Marsupilamii
marsx	mx	MarsX
martexcoin	mxt	MarteXcoin
martiandoge	martiandoge	MartianDoge
martin-shkreli-inu	msi	Martin Shkreli Inu
martkist	martk	Martkist
marumarunft	maru	marumaruNFT
marvelous-nfts	mnft	Marvelous NFTs
marvininu	marvin	MarvinInu
marvin-inu	marvin	Marvin Inu
marx	marx	MarX
marxcoin	marx	MarxCoin
masari	msr	Masari
mas-finance	mas	MAS FINANCE
maskdoge	md3	MaskDogeV3
mask-network	mask	Mask Network
mask-vault-nftx	mask	MASK Vault (NFTX)
masq	masq	MASQ
mass	mass	MASS
massive-protocol	mav	Massive Protocol
mass-vehicle-ledger	mvl	MVL
masterpiece-maker	mama	Masterpiece Maker
masterwin	mw	MasterWin
mata	mata	Mata
matador-token	mtdr	Matador
matchcup	match	Matchcup
matchpool	gup	Guppy
material	mtrl	Material
materium	mtrm	Materium
math	math	MATH
matic-aave-aave	maaave	Matic Aave Interest Bearing AAVE
matic-aave-dai	madai	Matic Aave Interest Bearing DAI
matic-aave-link	malink	Matic Aave Interest Bearing LINK
matic-aave-usdc	mausdc	Matic Aave Interest Bearing USDC
matic-aave-weth	maweth	Matic Aave Interest Bearing WETH
matic-aave-yfi	mayfi	Matic Aave Interest Bearing YFI
matic-dai-stablecoin	dai-matic	Matic DAI Stablecoin
maticlaunch	mtcl	MaticLaunch
matic-launchpad	maticpad	Matic Launchpad
matic-network	matic	Polygon
maticverse	mverse	MaticVerse
matic-wormhole	maticpo	MATIC (Wormhole)
matrak-fan-token	mtrk	Matrak Fan Token
matrix-ai-network	man	Matrix AI Network
matrixetf	mdf	MatrixETF
matrix-protocol	mtx	Matrix Protocol
matrix-solana-index	msi	Matrix Solana Index
matrixswap	matrix	Matrix Labs
matryx	mtx	MATRYX
matsuswap	matsuswap	MatsuSwap
mavaverse-token	mvx	Mavaverse
max-bidding	$max	Max Bidding
maxcoin	max	Maxcoin
maximus	maxi	Maximus
maximus-base	base	Maximus BASE
maximus-coin	mxz	Maximus Coin
maximus-dao	maxi	Maximus DAO
maximus-deci	deci	Maximus DECI
maximus-lucky	lucky	Maximus LUCKY
maximus-team	team	Maximus TEAM
maximus-trio	trio	Maximus TRIO
maxity	max	Maxity
maxonrow	mxw	Maxonrow
max-property-group	mcf	Max Crowdfund
max-revive	maxr	Max Revive
max-token	max	MAX
maxx-finance	maxx	MAXX Finance
maya-preferred-223	mayp	Maya Preferred
mayc-vault-nftx	mayc	MAYC Vault (NFTX)
maza	mzc	Maza
mbd-financials	mbd	MBD Financials
mbitbooks	mbit	MBitBooks
mcdex	mcb	MUX Protocol
mcdoge	mcdoge	McDoge
mcelo	mcelo	mCELO
mceur	mceur	mcEUR
mcfinance	mcf	MCFinance
mch-coin	mchc	MCH Coin
mci-coin	cyclub	Cyclub
mcity	mct	Mcity
mclaren-f1-fan-token	mcl	McLaren F1 Fan Token
mcn-ventures	mcn	MCN Ventures
mcobit	mct	Mcobit
mcoin1	mcoin	mCoin
mcontent	mcontent	MContent
mdex	mdx	Mdex
mdsquare	tmed	MDsquare
mead	mead	Mead
meanfi	mean	Mean DAO
measurable-data-token	mdt	Measurable Data
meblox-protocol	meb	Meblox Protocol
mechachain	$mecha	Mechanium
mecha-infinity	mec	MECHA
mecha-morphing	mape	Mecha Morphing
mechashiba	mec	MechaShiba
mechaverse	mc	Mechaverse
mech-master	mech	Mech Master
meconcash	mch	Meconcash
medal-of-honour	moh	Medal of Honour
medamon	mon	Medamon
medano	mdo	Medano
media-eye	eye	MEDIA EYE
media-licensing-token	mlt	Media Licensing Token
media-network	media	Media Network
medibit	medibit	MEDIBIT
medibloc	med	Medibloc
medicalchain	mtn	Medicalchain
medical-token-currency	mtc	Doc.com
medicalveda	mveda	MedicalVeda
medic-coin	medic	Medic Coin
mediconnect	medi	MediConnect
medieval-empires	mee	Medieval Empires
medifakt	fakt	Medifakt
medishares	mds	MediShares
medi-token	medi	Medi
medium	mdm	MEDIUM
medooza-ecosystem	mdza	Medooza Ecosystem
medping	mpg	Medping
meebitsdao-pool	mbbt	MeebitsDAO Pool
meeb-master	meeb	Meeb Master
meeb-vault-nftx	meeb	MEEB Vault (NFTX)
meeds-dao	meed	Meeds DAO
meeiro	mee	Meeiro
meerkat-shares	mshare	Meerkat Shares
meetin-token	meti	Meetin Token
meetone	meetone	MEET.ONE
meetple	mpt	Meetple
meflex	mef	MEFLEX
megabonk	mbonk	megaBonk
megacryptopolis	mega	MegaCryptoPolis
mega-protocol	mega	Mega Protocol
megashibazilla	msz	MegaShibaZilla
megatech	mgt	Megatech
megatoken	mega	MegaToken
megaweapon	$weapon	Megaweapon
megaworld	mega	MegaWorld
meh	meh	meh
mei-flex	mf	Mei Flex
me-in	mein	Me-in
meishu	meishu	Meishu
mekkacoin	mek	MekkaCoin
mekkafroggo	mekka	MekkaFroggo
mekka-froggo	lfgo	Mekka Froggo
melalie	mel	MELX
meland-ai	meld	Meland.ai
meld	meld	MELD
meld-gold	mcau	Meld Gold
melecoin	mlc	Melecoin
melega	marco	Melega
meli-games	meli	Meli Games
meliora	mora	Meliora
melody	melody	Melody
melody-sgs	sgs	Melody SGS
melody-sns	sns	Melody SNS
melon	mln	Enzyme
melonheadsprotocol	mhsp	MelonHeadSProtocol
melonx	$mlnx	MELONx
melos-studio	melos	Melos Studio
melo-token	melo	Melo
membrana-platform	mbn	Membrana
memebank	mbk	MeMeBank
memecard	mmc	MemeCard
memecoin	mem	Memecoin
meme-dollar	pina	Meme Dollar
meme-elon-doge-floki	memelon	Meme Elon Doge Floki
memeflate	mflate	Memeflate
meme-inu	meme	Meme Inu
meme-kong	mkong	Meme Kong
meme-lordz	$lordz	Meme Lordz
meme-ltd	meme20	MEME LTD
meme-machine	mema	Meme Machine
meme-network	meme	Meme Network
memenft-official	mnft	MemeNFT Official
memenopoly-money	mnop	Memenopoly Money
memepad	mepad	MemePad
meme-protocol	meme	Meme Protocol
meme-shib	ms	Meme Shib
meme-tao	mtao	MEME TAO
memetic	meme	Memetic
memeverse	meme	Memeverse
memewars	mwar	MemeWars
menapay	mpay	Menapay
mend	mend	Mend
menzy	mnz	Menzy
meowcoin	mewc	MeowCoin
merchant-token	mto	Merchant
merchdao	mrch	MerchDAO
mercor-finance	mrcr	Mercor Finance
merculet	mvp	Merculet
mercurial	mer	Mercurial
mercury	mer	Mercury
merebel	meri	Merebel
merge	merge	Merge
merit-circle	mc	Merit Circle
merkle-network	merkle	Merkle Network
merrychristmas	hohoho	MerryChristmas
merry-christmas-token	mct	Merry Christmas Token
meschain	mes	MesChain
mesefa	sefa	Mesefa
meshbox	mesh	MeshBox
meshswap-protocol	mesh	Meshswap Protocol
meso	meso	Meso
messier	m87	MESSIER
meta	mta	mStable Governance: Meta
metaair	mair	MetaAir
meta-apes-peel	peel	Meta Apes PEEL
metababy	baby	Metababy
metabeat	$beat	MetaBeat
metabet	mbet	MetaBET
metablackout	mbt	MetaBlackout
metabolic	mtbc	Metabolic
metabomb	mtb	MetaBomb
metabrands	mage	MetaBrands
metabridge	mtb	MetaBridge
meta-bsc	meta	Meta BSC
metabullrun	mbr	MetaBullRun
metaburst	mebu	Metaburst
metabusdcoin	mbc	MetaBUSDCoin
meta-capital	mcap	Meta Capital
meta-car	meta car	Meta Car
metacash	meta	MetaCash
metacelo	cmeta	MetaCelo
meta-cloth	meta cloth	Meta Cloth
metacoin	mtc	Metacoin
metacontinental	con	MetaContinental
meta-course	course	Meta Course
metacraft	mct	Metacraft
metacraft-mineral	memi	Metacraft Mineral
meta-dance	mdt	Meta Dance
metaderby	dby	Metaderby
metaderby-hoof	hoof	Metaderby Hoof
metadium	meta	Metadium
metadoctor	medoc	MetaDoctor
meta-doge	metadoge	Meta Doge
metadoge-bsc	metadoge	MetaDoge BSC
metadoge-v2	metadogev2	MetaDoge V2
metadrace	drace	MetaDrace
metadubai	mdb	MetaDubai
metaelfland-token	melt	MetaElfLand Token
metafabric	fabric	MetaFabric
meta-farmer-finance	mff	Meta Farmer Finance
metafastest	metaf	METAFASTEST
metaficial-world	mw	Metaficial World
metafighter	mf	MetaFighter
metafinance	mfi	MetaFinance
meta_finance	mf1	Meta Finance
metafish	fish	Metafish
metafishing	dgc	MetaFishing [OLD]
metafishing-2	dgc	MetaFishing
metaflip	metaflip	MetaFlip
meta-floki	mfloki	Meta Floki
metafluence	meto	Metafluence
metafootball	mtf	MetaFootball
metafooty	mfy	MetaFooty
metagalaxy-land	megaland	Metagalaxy Land
metagame	seed	MetaGame
metagame-arena	mga	Metagame Arena
metagamehub-dao	mgh	MetaGameHub DAO
metagamespace	metags	MetaGameSpace
metagaming-guild	mgg	MetaGaming Guild
metagamz	metag	MetagamZ
metagear	gear	MetaGear
metagochi	mgchi	Metagochi
metagods	mgod	MetaGods
metahamster	mham	Metahamster
metahash	mhc	#MetaHash
metahero	hero	Metahero
meta-house	meta house	Meta House
meta-inu-token	meta	Meta Inu Token
meta-islands	igo	Meta Islands
metajuice	vcoin	Metajuice
metakeeper	mkp	MetaKeeper
metakings	mtk	Metakings
metakombat	kombat	MetaKombat
metal	mtl	Metal DAO
metalama	lama	MetaLama
metaland-dao	meta	Metaland DAO
metaland-gameverse	mst	Monster
metalandmap	mland	MetaLandmap
metal-blockchain	metal	Metal Blockchain
metal-friends	mtls	Metal Friends
metalk	meta	Metalk
metal-music-coin	mtlmc3	Metal Music Coin
metalswap	xmt	MetalSwap
metamall	mall	MetaMall
metamars	metam	MetaMars
metamate	mtm	MetaMate
metamerce	merce	MetaMerce
metamerce-token	mmtkn	MetaMerce Token
midas-miner	mmi	Midas Miner
metamic-e-sports-games	meg	MetaMic E-Sports Games
meta-miner	miner	Meta Miner
metamonkeyai	mmai	MetamonkeyAi
metamoon	metamoon	MetaMoon
metamounts	mount	MetaMounts
metamui	mmui	MetaMUI
meta-musk	meta	Meta Musk
meta-mvrs	mvrs	Meta MVRS
meta-nebulas-ionz	ionz	IONZ
metanept	nept	Metanept
metan-evolutions	metan	Metan Evolutions
metaniagames	metania	MetaniaGames
metano	metano	Metano
metanyx	metx	Metanyx
metaoctagon	motg	MetaOctagon
metapets	metapets	MetaPets
metaplace	mpc	Metaplace
metaplanet	mpl	MetaPlanet
metaplayers-gg	fps	MetaPlayers.gg
metaple-finance	mlx	Metaple Finance
metaplex	mplx	Metaplex
meta-pool	meta	Meta Pool
metapplay	metap	MetapPlay
meta-protocol	mpc	META PROTOCOL
metaq	metaq	MetaQ
metaracers	mrs	MetaRacers
metarare	mtra	MetaRare
metareset	reset	MetaReset
metarim	rim	MetaRim
metarix	mtrx	Metarix
metaroid-nft	metaroid	Metaroid NFT
metars-genesis	mrs	Metars Genesis
meta-ruffy	mr	MetaRuffy (MR)
meta-ruffy-old	mr	Meta Ruffy [OLD]
metarun	mrun	Metarun
metasafemoon	metasfm	MetaSafeMoon
metaseer	metas	Metaseer
meta-shark	mts	Meta Shark
meta-shiba	mshiba	Meta Shiba
metashooter	mhunt	MetaShooter
meta-skinny-hope	metash	Meta Skinny&Hope
metasoccer	msu	MetaSoccer
metaspace	mspace	Metaspace
meta-space-2045	mtw	Meta Space 2045
meta-spatial	spat	Meta Spatial
metaspets	msp	MetaSpets
metasphere	mtsp	Metasphere
meta-sports	msg	Meta Sports
metasportstoken	mst	MetaSportsToken
metastocks	mtsks	MetaStocks
metastrike	mts	Metastrike
metaswap	msc	MetaSwap
meta-to-earn	mte	Meta to Earn
metatoken	mtk	MetaToken
metatoll	tax	MetaToll
metatown	mtown	MetaTown
metatrone	met	Metatrone
meta-utopia	land	Meta Utopia
metavault-dao	mvd	Metavault DAO
metavault-trade	mvx	Metavault Trade
metaverse-dao	mdao	Metaverse DAO
metaverse-dog	mvdg	MetaVerse Dog
metaverse-dualchain-network-architecture	dna	Metaverse DNA
metaverse-etp	etp	Metaverse ETP
metaverse-exchange	metacex	Metaverse Exchange
metaverse-face	mefa	Metaverse Face
metaverse-hub	mhub	Metaverse Hub
metaverse-index	mvi	Metaverse Index
metaverse-index-token	metai	Metaverse Index Token
metaverse-m	m	MetaVerse-M
metaverse-miner	meta	Metaverse Miner
metaverse-network-pioneer	neer	Metaverse.Network Pioneer
metaverse-nft-index	play	Metaverse NFT Index
metaverser	mtvt	Metaverser
metaverse-vr	mevr	Metaverse VR
metaversex	metax	MetaverseX
metavie-token	metavie	Metavie
metavisa	mesa	metavisa
metavpad	metav	MetaVPad
metawars	wars	MetaWars
metawar-token	mtwr	MetaWar Token
metawear	wear	MetaWear
metaweb3pad	metaweb3pa	MetaWeb3Pad
metaworld	mw	MetaWorld
meta-world-game	mtw	Meta World Game
metax	x1	MetaX
metaxiz	mexi	Metaxiz
metaxy	mxy	Metaxy
metazilla	mz	MetaZilla
metazombie	zombie	MetaZombie
meteorite-network	meteor	Meteorite Network
meter	mtrg	Meter Governance
meter-governance-mapped-by-meter-io	emtrg	Meter Governance mapped by Meter.io
meter-stable	mtr	Meter Stable
metfi	mfi	MetFi
metfx-watch-to-earn	mfx	METFX Watch To Earn
method-fi	mthd	Method Finance
metis	mts	Metis MTS
metis-token	metis	Metis
metoo	metoo	Metoo
metoshi	meto	Metoshi
metria	metr	Metria Network
metric-exchange	metric	MetricExchange
metronome	met	Metronome
metroverse	met	Metroverse
mettalex	mtlx	Mettalex
metti-inu	metti	Metti Inu
meverse	mev	MEVerse
mexc-football-fan-token-index	football	MEXC Football Fan Token Index
mexican-peso-tether	mxnt	Mexican Peso Tether
mfet	mfet	MFET
mg-social	mgs	MG.Social
miamicoin	mia	MiamiCoin
miaswap	mia	MiaSwap
mib-coin	mib	MIB Coin
mibr-fan-token	mibr	MIBR Fan Token
microbitcoin	mbc	MicroBitcoin
micro-bitcoin-finance	mbtc	Micro Bitcoin Finance
microchains-gov-token	mcg	MicroChains Gov Token
microcoin	mcc	MicroCoin
microcosm	mic	Microcosm
microcredittoken	1mct	MicroCredit
micromines	micro	Micromines
micromoney	amm	MicroMoney
micronft	mnt	microNFT
micropets	pets	MicroPets
micro-santa-coin	microsanta	Micro Santa Coin
microsoft-tokenized-stock-defichain	dmsft	Microsoft Tokenized Stock Defichain
microtick	tick	Microtick
microtuber	mct	MicroTuber
mida	mida	MIDA
midas	midas	Midas
midas-protocol	mas	Midas Protocol
mie-network	mie	MIE Network
miidas	miidas	Miidas
miku	miku	Miku
milady-vault-nftx	milady	Milady Vault (NFTX)
milestonebased	mile	milestoneBased
mileverse	mvc	MileVerse
military-finance	mil	Military Finance
militia-games	milit	Militia Games
milk	milk	Cool Cats Milk
milk2	milk	CashCow Protocol Milk
milk-alliance	mlk	MiL.k Alliance
milk-and-butter	mb	Milk and Butter
milkshakeswap	milk	Milkshake Swap
milky-finance	mifi	Milky Finance
milkyswap	milky	MilkySwap
milky-token	milky	Milky
millenniumclub	mclb	MillenniumClub Coin
millennium-sapphire	msto	Millennium Sapphire
millimeter	mm	Millimeter
million	mm	Million
millionaire-land	tok	Millionaire Land
milliondollarbaby	mdb	Make DeFi Better
million-monke	mimo	Million Monke
million-pixel	xix	Million Pixel
millionsy	milli	MILLIONSY
millonarios-fc-fan-token	mfc	Millonarios FC Fan Token
milo-inu	milo	Milo Inu
mim	swarm	MIM
mimas-finance	mimas	Mimas Finance
mimatic	mimatic	MAI
mimblewimblecoin	mwc	MimbleWimbleCoin
mimir-token	mimir	Mimir
mimo-parallel-governance-token	mimo	Mimo Governance
mimosa	mimo	Mimosa
mina-protocol	mina	Mina Protocol
minato	mnto	Minato
mincoin	mnc	Mincoin
mindcell	mdc	MindCell
mindcoin	mnd	MindCoin
mindfolk-wood	$wood	Mindfolk Wood
mind-music	mnd	Mind Music
mindol	min	MINDOL
minds	minds	Minds
mindsync	mai	Mindsync
minebase	mbase	Minebase
mine-network	mnet	MINE Network
mineral	mnr	Mineral
minerblox	mblox	MinerBlox
minergate-token	mg	MinerGate
minerjoe	gold	MinerJoe
minersdefi	miners	MinersDefi
miners-of-kadenia	mok	Miners of Kadenia
minerva-wallet	miva	Minerva Wallet
mine-shares	mine	Mine Shares
mines-of-dalarnia	dar	Mines of Dalarnia
mineum	mnm	Mineum
mini	mini	Mini
mini-baby-doge	minibabydoge	Mini Baby Doge
minibitcoin	mbtc	MiniBitcoin
minibtc	minibtc	MiniBTC
minidoge	minidoge	MiniDOGE
minifootball	minifootball	Minifootball
minimals	mms	Minimals
mini-mongoose	minimongoose	mini Mongoose
miningnft	mit	MiningNFT
minionverse	mivrs	Minionverse
minipanther	mp	MiniPanther
minishib-token	minishib	miniSHIB Token
miniverse-dollar	mvdollar	MiniVerse Dollar
minix	mnx	MiniX
minswap	min	Minswap
mint-club	mint	Mint Club
mintcoin	mint	Mintcoin
minted	mtd	Minted
mintera	mnte	Mintera
minter-hub	hub	Minter Hub
minter-network	bip	Minter Network
mint-marble	mim	Mint Marble
minto	btcmt	Minto
mintpad	mint	Mintpad
mintyswap	mintys	MintySwap
miracle-universe	mu	Miracle Universe
mirai-token	mirai	Mirai Labs
miraqle	mql	MiraQle
mirarc-chain	mat	MirArc Chain
mirocana	miro	Mirocana
mirrored-ether	meth	Mirrored Ether
mirror-finance	mirror	Mirror Finance
mirror-protocol	mir	Mirror Protocol
misbloc	msb	Misbloc
mission-helios	helios	Mission Helios
mist	mist	Mist
mithril	mith	Mithril
mithril-share	mis	Mithril Share
mithrilverse	mithril	Mithrilverse
mixin	xin	Mixin
mixmarvel	mix	MixMarvel
mixsome	some	Mixsome
mixtrust	mxt	MixTrust
miyazaki-inu	miyazaki	Miyazaki Inu
mkitty	mkitty	mKitty
mktcash	mch	Mktcash
mktcoin	mkt	MktCoin
mloky	mloky	MLOKY
mm72	mm72	MM72
mmacoin	mma	MMACoin
mma-gaming	mma	MMA Gaming
mmaon	mmaon	MMAON
mmfinance	mmf	MMFinance (Cronos)
mmfinance-polygon	mmf	MMFinance (Polygon)
mmf-money	burrow	MMF Money
mmg-token	mmg	Mad Monkey Guild
mmmluckup7	mmm7	MMMLUCKUP7
mmocoin	mmo	MMOCoin
mms-cash	mcash	MMS Cash
mms-coin	mmsc	MMS Coin
mnmcoin	mnmc	MNMCoin
mo	mo	MO
moar	moar	Moar Finance
mobiecoin	mbx	MobieCoin
mobifi	mofi	MobiFi
mobilecoin	mob	MobileCoin
mobile-crypto-pay-coin	mcpc	Mobile Crypto Pay Coin
mobilego	mgo	MobileGo
mobilian-coin	mbn	Mobilian Coin
mobility-coin	mobic	Mobility Coin
mobipad	mbp	Mobipad
mobist	mitx	Mobist
mobius	mobi	Mobius
mobius-finance	mot	Mobius Finance
mobius-money	mobi	Mobius Money
mobix	mobx	MOBIX
mobox	mbox	Mobox
moby-dick-2	moby	Moby Dick
mochi-inu	mochi	Mochi Inu
mochi-market	moma	Mochi Market
mocossi-planet	mcos	Mocossi Planet
moda-dao	moda	MODA DAO
modden	mddn	Modden
modefi	mod	Modefi
model-x-coin	modx	MODEL-X-coin
modex	modex	Modex
moebius	mobi	Moebius
moeda-loyalty-points	mda	Moeda Loyalty Points
mogu	mogx	Mogu
mogul-productions	stars	Mogul Productions
mojito	mojo	Mojito
mojitoswap	mjt	MojitoSwap
mojo-v2	mojov2	Mojo V2
molecular-future	mof	Molecular Future
mollector	mol	Mollector
moma-protocol	momat	Moma Protocol
momento	momento	Momento
moments	mmt	Moments Market
momentum-2	mass	Momentum
momentum-token	mtm	Momentum MTM
mommon	mmon	Mammon
mommy-doge	mommydoge	Mommy Doge
momo-key	key	MoMo Key
momo-protocol	momo	Momo Protocol
mona	mona	Monaco Planet
monaco	mco	MCO
monacoin	mona	MonaCoin
monavale	mona	Monavale
mondayclub	monday	MondayClub
mondo-community-coin	mndcc	Mondo Community Coin
monerium-eur-money	eure	Monerium EUR emoney
monero	xmr	Monero
monero-classic-xmc	xmc	Monero-Classic
monerov	xmv	MoneroV
mones	mones	Mones
moneta	moneta	Moneta
monetaryunit	mue	MonetaryUnit
monetas	mntg	Monetas
monetha	mth	Monetha
moneybrain-bips	bips	Moneybrain BiPS
moneybyte	mon	Moneybyte
moneyhero	myh	Moneyhero
moneyswap	mswap	MoneySwap
moneytoken	imt	Money IMT
moneytree	money	MoneyTree
monfter	mon	Monfter
mongol-nft	mnft	Mongol NFT
mongoose	mongoose	Mongoose
mongoosecoin	mongoose	MongooseCoin
moniwar	mowa	Moniwar
monk	monk	Monk
monkex	monkex	Monkex
monkeyball	mbs	MonkeyLeague
monkey-king	wukong	Monkey King
monnfts	mon	MONNFTS
monnos	mns	Monnos
monomoney	mono	MonoMoney
mononoke-inu	mononoke-inu	Mononoke Inu
monopoly-meta	mpm	Monopoly Meta
monopoly-millionaire-control	mmc	Monopoly Millionaire Control
monopoly-millionaire-game	mmg	Monopoly Millionaire Game
monox	mono	MonoX
monsoon-finance	mcash	Monsoon Finance
monsta-infinite	moni	Monsta Infinite
monstaverse	monstr	MonstaVerse
monster-adventure-token	mat	Monster Adventure
monster-battle	mbs	Monster Battle
monster-cash-share	mss	Monster Slayer Share
monster-galaxy	ggm	Monster Galaxy
monster-of-god	monx	Monster of God
monsterquest	mqst	MonsterQuest
monsterra	mstr	Monsterra
monsterra-mag	mag	Monsterra MAG
monsters-clan	mons	Monsters Clan
monster-valley	monster	Monster Valley
monster-world	mw	Monster World
monstock	mon	Monstock
monverse	monstr	Monverse
moochii	moochii	Moochii
moola-celo-atoken	mcelo	Moola CELO AToken
moola-celo-dollars	mcusd	Moola Celo Dollars
moola-interest-bearing-creal	mcreal	Moola interest bearing CREAL
moola-market	moo	Moola Market
moomonster	moo	MooMonster
moon	moon	r/CryptoCurrency Moons
moonai	mooi	Moonaï
moonarch	moonarch	Moonarch
moonbeam	glmr	Moonbeam
moonbeans	beans	MoonBeans
moonbird	mbird	Moonbird
moonbirds-nft-index-by-mexc	nmoon	Moonbirds NFT Index by MEXC
mooncake	moon	MoonCake
mooncat-vault-nftx	mooncat	MOONCAT Vault (NFTX)
mooncoin	moon	Mooncoin
moonedge	mooned	MoonEdge
mooner	mnr	Mooner
moonery	mnry	Moonery
mooney	mooney	Moon DAO
moon-eye	me	Moon Eye
moonfarmer	mfm	MoonFarmer
moonfarm-finance	mfo	MoonFarm Finance
moongame	mgt	Moongame
mooni	mooni	Mooni
moonienft	mny	MoonieNFT
moonions	moonion	Moonions
moonka	mka	Moonka
moonkat-finance	mkat	MoonKat Finance
moonlana	mola	MoonLana
moonlift	mltpx	Moonlift Capital
moonlight-metaverse	$mlm	Moonlight Metaverse
moon-light-night	mlnt	Moon Light Night
moonlight-token	moonlight	Moonlight
moon-maker-protocol	mmp	Moon Maker Protocol
moonminer	moonminer	MoonMiner
moon-nation-game	mng	Moon Nation Game
moonpaw	moonpaw	MoonPaw
moonpot	pots	Moonpot
moonpot-finance	moonpot	MoonPot Finance
moon-rabbit	aaa	Moon Rabbit
moonretriever	fetch	MoonRetriever
moonrise	moonrise	MoonRise
moonriver	movr	Moonriver
moon-rocket-coin	mrc	Moon Rocket Coin
moonrock-v2	rock	MoonRock V2
moonscape	mscp	Moonscape
moonsdust	moond	MoonsDust
moonshot	moonshot	Moonshot [OLD]
moonshots-farm	bones	Moonshots Farm
moonstarter	mnst	MoonStarter
moonswap	moon	MoonSwap
moon-token	dodb	DODbase
moontools	moons	MoonTools
moon-tropica	cah	Moon Tropica
moontrust	mntt	MoonTrust
moontrustbsc	mnttbsc	MoonTrustBSC
moonwell	mfam	Moonwell Apollo
moonwell-artemis	well	Moonwell Artemis
moonwolf-io	wolf	moonwolf.io
mops	mops	Mops
moreal	mor	Moreal
moremoney-usd	money	Moremoney USD
more-token	more	Moremoney Finance
mork	mork	MORK
morpher	mph	Morpher
morpheus-labs	mitx	Morpheus Labs
morpheus-network	mnw	Morpheus Network
morpheus-token	pills	Morpheus Swap
morphie	mrfi	Morphie
morpho-network	morpho	Morpho Network
morphswap	ms	Morphswap
mor-stablecoin	mor	Mor Stablecoin
mortaldoge	mortaldoge	MortalDoge
moshiheads	moshi	Moshiheads
mosolid	mosolid	moSOLID
mosquitos-finance	suckr	Mosquitos Finance
moss-carbon-credit	mco2	Moss Carbon Credit
moss-governance	moss	Moss Governance
mossland	moc	Mossland
mosterisland	mi	MosterIsland
motacoin	mota	MotaCoin
mother-earth	mot	Mother Earth
mother-of-memes	mom	Mother of Memes
motionwreck-games	mwg	MotionWreck Games
motiv-protocol	mov	MOTIV Protocol
motocoin	moto	Motocoin
motogp-fan-token	mgpt	MotoGP Fan Token
motoverse	mile	Motoverse
mound-token	mnd	Mound
mouse-haunt	mht	Mouse Haunt
mouseworm	mouseworm	MouseWorm
movecash	mca	MoveCash
move-network	movd	MOVE Network
moverich	mvrc	MoveRich
movey	movey	Movey
movez	movez	MoveZ
moviebloc	mbl	MovieBloc
movingon-finance	movon	MovingOn Finance
movn	mov	MOVN
mp3	mp3	MP3
mrweb-finance	ama	MrWeb Finance [OLD]
mrweb-finance-2	ama	MrWeb Finance
msgsender	msg	MsgSender
mshare	mshare	MShare
msol	msol	Marinade staked SOL
mstable-btc	mbtc	mStable BTC
mstation	mst	MStation
mtg-token	mtg	MTG Token
mtop	mtop	MTOP
mt-pelerin-shares	mps	Mt Pelerin Shares
mttcoin	mttcoin	MTTCoin
mt-token	mt	MT Token
mu-coin	mu	Mu Coin
mu-continent	mu	Mu Continent
mudra-mdr	mdr	Mudra MDR
muesliswap-milk	milk	MuesliSwap MILK
muesliswap-yield-token	myield	MuesliSwap Yield
mugen-finance	mgn	Mugen Finance
mu-gold	mug	Mu Gold
mu-inu	muinu	Mu Inu
multichain	multi	Multichain
multi-chain-capital-2	mcc	Multi-Chain Capital
multi-farm-capital	mfc	Multi-Farm Capital
multigame	multi	Multigame
multipad	mpad	MultiPad
multiplanetary-inus	inus	MultiPlanetary Inus
multiplier	mxx	Multiplier
multiplier-bsc	bmxx	Multiplier (BSC)
multi-strategies-capital	msc	Multi Strategies Capital
multivac	mtv	MultiVAC
multiverse	ai	Multiverse
multiverse-capital	mvc	Multiverse Capital
multiversepad	mtvp	MultiversePad
mu-meme	mume	Mu Meme
mummy-finance	mmy	Mummy Finance
muna	muna	Muna
munch-token	munch	Munch
mundocrypto	mct	Mundocrypto
mundo-token	$mundo	MUNDO
muni	muni	MUNI
murasaki	mura	Murasaki
mus	mus	Musashi Finance
musclex	m-x	MuscleX
musd	musd	mStable USD
muse-2	muse	Muse DAO
muse-ent-nft	msct	Muse ENT NFT
museum-of-crypto-art	moca	Museum of Crypto Art
mushe	xmu	Mushe
musicfi	mf	MusicFi
musk	musk	Musk
musk-doge	mkd	Musk Doge
musk-gold	musk	MUSK Gold
musk-melon	melon	Musk Melon
musk-metaverse	metamusk	Musk Metaverse
muso-finance-2	muso	MUSO Finance
must	must	Must
mutant-froggo	froggo	Mutant Froggo
mute	mute	Mute
muu-inu	$muu	MUU
muuu	muuu	Muuu Finance
muverse	mu	Muverse
mvpad	mvd	MvPad
mvs-multiverse	mvs	MVS Multiverse
mxc	mxc	MXC
mxgp-fan-token	mxgp	MXGP Fan Token
mxm	mxm	MXM
mxmboxceus-token	mbe	MxmBoxcEus Token
mx-token	mx	MX
mx-token-2	mxt	MX TOKEN
mybit-token	myb	MyBit
mybricks	bricks	MyBricks
myce	yce	MYCE
mycelium	myc	Mycelium
my-ceremonial-event	myce	MY Ceremonial Event
my-defi-legends	dlegends	My DeFi Legends
my-defi-pet	dpet	My DeFi Pet
my-farm-token	mft	My Farm Token
my-identity-coin	myid	My Identity Coin
my-liquidity-partner	mlp	My Liquidity Partner
my-master-war	mat	My Master War
mymessage	mesa	myMessage
my-neighbor-alice	alice	My Neighbor Alice
myntpay	mynt	MyntPay
myobu	myobu	Myōbu
mypiggiesbank	piggie	MyPiggiesBank
mypoints-e-commerce	mypo	MyPoints E-Commerce
myriadcoin	xmy	Myriad
myriad-social	myria	Myriad Social
mysterium	myst	Mysterium
mystery	myst	MYSTERY
mystic-poker	myp	Mystic Poker
myteamcoin	myc	Myteamcoin
mytheria	myra	Mytheria
mythic-ore	more	Mythic Ore
mythos	myth	Mythos
myth-token	myth	Myth
mytoken	mt	MyToken
mytrade	myt	Mytrade
mytvchain	mytv	MyTVchain
n00dle	n00d	n00dle
nabob	nabob	Nabob
nabox	nabox	Nabox
nacho-finance	nacho	Nacho Finance
nada-protocol-token	nada	NADA Protocol Token
naffiti	naff	Naffiti
nafter	naft	Nafter
nafty	nafty	Nafty
naga	ngc	NAGA
naga-kingdom	naga	Naga Kingdom
nagaswap	bnw	NagaSwap
nahmii	nii	Nahmii
naka-bodhi-token	nbot	Naka Bodhi
nakamoto-games	naka	Nakamoto Games
name-changing-token	nct	Name Change
namecoin	nmc	Namecoin
nami-corporation-token	nami	Nami Corporation
nano	xno	Nano
nano-bitcoin-token	nbtc	Nano Bitcoin
nanobyte	nbt	NanoByte
nano-dogecoin	indc	Nano Dogecoin
nanometer-bitcoin	nmbtc	NanoMeter Bitcoin
naos-finance	naos	NAOS Finance
napoleon-x	npx	Napoleon X
napoli-fan-token	nap	Napoli Fan Token
narfex	nrfx	Narfex
nasa-doge	nasadoge	Nasa Doge
nasdacoin	nsd	Nasdacoin
nasdex-token	nsdx	NASDEX
natas-token	natas	NaTaS Token
natiol	nai	Natiol
nation3	nation	Nation3
native-utility-token	nut	Native Utility
natural-farm-union-protocol	nfup	Natural Farm Union Protocol
nature-based-offset	nbo	Nature Based Offset
natus-vincere-fan-token	navi	Natus Vincere Fan Token
nav-coin	nav	Navcoin
navibration	navi	Navibration
naxar	naxar	Naxar
nayuta-coin	nc	Nayuta Coin
nblh	nblh	NBLH
nbox	nbox	NBOX
ndau	ndau	Ndau
ndb	ndb	NDB
near	near	NEAR Protocol
nearpad	pad	NearPad
nearstarter	nstart	NEARStarter
neblio	nebl	Neblio
nebulas	nas	Nebulas
nebulatoken	nebula	NebulaToken
neeo	neeo	NEEO
nef-rune-rune-game	nef	NEF Rune (Rune.Game)
neftipedia	nft	NEFTiPEDiA
nefty	nefty	NeftyBlocks
neighbourhoods	nht	Neighbourhoods
neko	neko	NEKO
nekocoin	nekos	Nekocoin
neko-network	neko	Neko Network
nelo-metaverse	nelo	NELO Metaverse
nelore-coin	nlc	Nelore Coin
nem	xem	NEM
nemesis	nms	Nemesis
nemesis-dao	nms	Nemesis DAO
nemesis-wealth-projects-bsc	nms	Nemesis Wealth Projects BSC
nemo	nemo	NEMO
neo	neo	NEO
neofi	neofi	NeoFi
neon	neon	Neon
neon-exchange	nex	Nash
neonomad-finance	nni	Neonomad Finance
neopin	npt	Neopin
neorbit	safo	SAFEONE CHAIN
neos-credits	ncr	Neos Credits
neo-tokyo	bytes	Neo Tokyo
neoworld-cash	nash	NeoWorld Cash
neoxa	neox	Neoxa
neptune-mutual	npm	Neptune Mutual
nerian-network	nerian	Nerian Network
nerva	xnv	Nerva
nerve-finance	nrv	Nerve Finance
nerveflux	nerve	NerveFlux
nervenetwork	nvt	NerveNetwork
nervos-network	ckb	Nervos Network
nest	nest	Nest Protocol
nest-arcade	nesta	Nest Arcade
nest-egg	negg	Nest Egg
nestegg-coin	egg	NestEgg Coin
nesten	nit	Nesten
nestree	egg	Nestree
neta	neta	NETA
netcoin	net	Netcoin
netcoincapital	ncc	Netcoincapital
netflix-tokenized-stock-defichain	dnflx	Netflix Tokenized Stock Defichain
nether	ntr	Nether
netkoin	ntk	Netkoin
netm	ntm	Netm
neton	nto	Neton
netswap	nett	Netswap
netvrk	ntvrk	Netvrk
network-capital-token	netc	Network Capital Token
netzero	nzero	NETZERO
neumark	neu	Neumark
neuron-chain	neuron	Neuron Chain
neuroni-ai	neuroni	Neuroni AI
neurotoken	ntk	Neuro NTK
neutra-finance	neu	Neutra Finance
neutrino	xtn	Neutrino Index Token
neutrino-system-base-token	nsbt	Neutrino System Base
neutron	ntrn	Neutron
neutron-1	ntrn	Neutron Coin
neuy	neuy	NEUY
nevacoin	neva	NevaCoin
newb-farm	newb	NewB.Farm
new-bitshares	nbs	New BitShares
newdex-token	dex	Newdex
new-earth-order-money	neom	New Earth Order Money
new-frontier-presents	nfp	New Frontier Presents
new-landbox	land	LandBox
newo-coin	newo	NEWO Coin
new-order	newo	New Order
new-paradigm-assets-solution	npas	New Paradigm Assets Solution
newscrypto-coin	nwc	Newscrypto Coin
newsolution-2-0	nste	NewSolution 2.0
newton-project	new	Newton Project
newtowngaming	ntg	NEWTOWNGAMING
new-world-order	state	New World Order
new-year-resolution	nyr	New Year Resolution
new-year-token	nyt	New Year
newyorkcoin	nyc	NewYorkCoin
newyork-exchange	nye	NewYork Exchange
nexacoin	nexa	Nexa
nexalt	xlt	Nexalt
nexdax	nt	NexDAX
nexo	nexo	NEXO
nextdao	nax	NextDAO
next-defi-protocol	nxdf	NeXt-DeFi Protocol
next-earth	nxtt	Next Earth
nextech-network	nx	Nxtech Network
nextexchange	next	NEXT
next-level	nxl	Next Level
next-token	nxt	Next NXT
nextype-finance	nt	NEXTYPE Finance
nexum	nexm	Nexum
nexus	nxs	Nexus
nexus-asa	gp	Nexus ASA
nexus-beth-token-share-representation	neth	Nexus bETH token share representation
nexus-bluna-token-share-representation	nluna	Nexus bLuna token share representation
nexus-dubai	nxd	Nexus Dubai
nexus-governance-token	psi	Nexus Protocol
nexuspad	nexus	Nexuspad
nexus-token	nexus	Nexus Crypto Services
nezuko-inu	nezuko	Nezuko Inu
nft11	nft11	NFT11
nft2stake	nft2$	NFT2STAKE
nft-alley	alley	NFT Alley
nft-art-finance	nftart	NFT Art Finance
nftascii	nftascii	NFTASCII
nftb	nftb	NFTb
nftblackmarket	nbm	NFTBlackmarket
nftbomb	nbp	NFTBomb
nftbooks	nftbs	NFTBooks
nft-champions	champ	NFT Champions
nftcircle	nftc	NFTCircle
nft-crosschain	crc	NFT Crosschain
nftdao	nao	NFTDAO
nfteyez	eye	NftEyez
nftfundart	nfa	NFTFundArt
nftfy	nftfy	Nftfy
nftgamingstars	gs1	NFTGamingStars
nft-global-platform	nftg	NFT Global Platform
nftify	n1	NFTify
nftime	nftm	Nftime
nft-index	nfti	NFT Index
nftlaunch	nftl	NFTLaunch
nftlootbox	loot	LootBox.io
nft-maker	$nmkr	NMKR
nftmall	gem	NFTmall
nftmart-token	nmt	NFTMart
nftmusic	music	NFTMusic.ai
nftpad	nftpad	NFTPad
nft-platform-index	nftp	NFT Platform Index
nft-protocol	nft	NFT Protocol
nftpunk-finance	nftpunk	NFTPunk.Finance
nftrade	nftd	NFTrade
nft-royal-token	nrt	NFT Royal
nft-soccer-games	nfsg	NFT Soccer Games
nft-stars	nfts	NFT Stars
nft-starter	nst	NFT Starter
nftstyle	nftstyle	NFTStyle
nft-tech	nftt	NFT Tech
nft-tone	tone	NFT Tone
nft-track-protocol	ntp	NFT Track Protocol
nftwiki	nftk	NFTWiki
nft-worlds	wrld	NFT Worlds
nftx	nftx	NFTX
nfty-token	nfty	NFTY
nfx-coin	nfxc	NFX Coin
niftify	nift	Niftify
niftsy	niftsy	Envelop (Niftsy)
nifty-league	nftl	Nifty League
niftypays	nifty	NiftyPays
nifty-token	nfty	NFTY DeFi Protocol
nightingale-token	ngit	Nightingale Token
night-life-crypto	nlife	Night Life Crypto
niifi	niifi	NiiFi
nil-dao	nil	Nil DAO
nimbus	nbu	Nimbus
nimbus-governance-token	gnbu	Nimbus Governance
nimbus-utility	nimb	Nimbus Utility
nimiq-2	nim	Nimiq
ninenoble	nnn	Ninenoble
ninja-panda-inu	npi	Ninja Panda Inu
ninja-protocol	ninja	Ninja Protocol
ninja-squad	nst	Ninja Squad
ninky	ninky	Idle Ninja Online
ninneko	nino	Ninneko
nintia-estate	ninti	Nintia Estate
niob	niob	NIOB
niobio-cash	nbr	Niobio
niobium-coin	nbc	Niobium Coin
nippon-lagoon	nlc	Nippon Lagoon
niros	niros	Niros
nirvana-ana	ana	Nirvana ANA
nirvana-chain	nac	Nirvana Chain
nirvana-meta-mnu-chain	mnu	Nirvana Meta MNU Chain
nirvana-nirv	nirv	Nirvana NIRV
nirvana-prana	prana	Nirvana prANA
nitro	nitro	Nitro
nitrodoge	nitrodoge	nitroDOGE
nitroex	ntx	NitroEX
nitrofloki	nifloki	NitroFloki
nitro-league	nitro	Nitro League
nitro-network	ncash	Nitro Network
nitroshiba	nishib	NitroShiba
nix-bridge-token	voice	Voice
nkcl-classic	nkclc	NKCL Classic
nkn	nkn	NKN
nnsdao-protocol	ndp	NnsDAO Protocol
noah-coin	noahp	Noah Decentralized State Coin
noah-s-ark-coin	nac	Noah's Ark Coin
noa-play	noa	NOA PLAY
nobility	nbl	Nobility
noblecoin	nobl	NobleCoin
nobo-finance	nobf	Nobo Finance
nobunaga	nbng	Nobunaga
nocapcoin	ncc	NoCapCoin
nodebunch	noch	NodeBunch
nodeify	ndfi	Nodeify
noderunners	ndr	Node Runners
nodeseeds	nds	Nodeseeds
nodestats	ns	Nodestats
nodetrade	mnx	Nodetrade
nodle-network	nodl	Nodle Network
nody	nody	Nody
noe-crypto-bank	noe	NOE GLOBAL
nogoaltoken	ino	NoGoal
noia-network	noia	Syntropy
noir-phygital	noir	Noir Phygital
noku	noku	Noku
nole-npc	npc	NPC DAO
no-limit-ape	nla	No Limit Ape
nolimitcoin	nlc	NoLimitCoin
nomad-exiles	pride	Nomad Exiles
nominex	nmx	Nominex
non-fungible-history	nfh2	Non-Fungible History
non-fungible-media-token	nfmt	Non Fungible Media Token
non-fungible-toke	toke	Non-Fungible TOKE
non-fungible-yearn	nfy	Non-Fungible Yearn
no-one	noone	No One
nora-token	nra	Nora
nord-finance	nord	Nord Finance
nosana	nos	Nosana
noshit	nsh	NoShit
nosnitches	nosnitch	Nosnitches
nostra	nos	Nostra
nostra-uno	uno	UNO
nosturis	ntrs	Nosturis
nota	usnota	NOTA
notable	nbl	Notable
not-another-shit-altcoin	nasa	Not Another Shit Altcoin
note	note	Note
not-financial-advice	nfai	Not Financial Advice
nothing	nada	Nothing
notional-finance	note	Notional Finance
novacoin	nvc	Novacoin
nova-finance	nova	Nova Finance
novara-calcio-fan-token	nov	Novara Calcio Fan Token
novem-gold	nnn	Novem Gold
novem-pro	nvm	Novem Pro
nowar	nowar	Nowar
nowarshiba	nshiba	Nowarshiba
nowlage-coin	nac	Nowlage Coin
npccoin	npc	NPCcoin
npc-coin	npc	NPC Coin
npick-block	npick	NPick Block
n-protocol	n	N Protocol
nrgy-defi	nrgy	NRGY Defi
nshare	nshare	NSHARE
nsights	nsi	nSights
nss-coin	nss	NSS Coin
nsur-coin	nsur	NSUR Coin
nsure-network	nsure	Nsure Network
nthchain	nth	NTHCHAIN
nucleus-vision	ncash	Nucleus Vision
nuco-cloud	ncdt	Nuco.Cloud
nucypher	nu	NuCypher
nudes	nudes	NUDES
nugencoin	nugen	Nugencoin
nukplan	nkpl	Nukplan
nuls	nuls	Nuls
number-1-token	nr1	Number 1
numbers-protocol	num	NUM Token
numeraire	nmr	Numeraire
numisme	nume	NumisMe
numitor	numi	Numitor
nuna	nuna	Nuna
nunet	ntx	NuNet
nunu-spirits	nnt	Nunu Spirits
nurifootball	nrfb	NuriFootBall
nusa-finance	nusa	NUSA
nusd	susd	sUSD
nusd-hotbit	nusd	nUSD (HotBit)
nutgain	nutgv2	NUTGAIN
nutsdao	nuts	NutsDAO
nvidia-tokenized-stock-defichain	dnvda	Nvidia Tokenized Stock Defichain
nvirworld	nvir	NvirWorld
nvl-project	nvl	NVL Project
nxd-next	nxdt	NXD Next
nxm	nxm	Nexus Mutual
nxt	nxt	NXT
nxusd	nxusd	NXUSD
nyan-cat	ncat	NCAT
nyancoin	nyan	Nyancoin
nyan-v2	nyan-2	Nyan V2
nycccoin	nyc	NewYorkCityCoin
nym	nym	Nym
nyx-token	nyxt	Nyx
nyzo	nyzo	Nyzo
nzd-stablecoin	nzds	New Zealand Dollar Stablecoin
o3-swap	o3	O3 Swap
o5o	o5o	O5O
oasis-2	xos	OASIS
oasis-city	osc	Oasis City
oasis-network	rose	Oasis Network
oasys	oas	Oasys
oath	oath	OATH
obol	obol	Obol
obortech	obot	Obortech
obrok	obrok	OBRok
observer-coin	obsr	Observer
obsidium	obs	Obsidium
obtoken	obt	OB
ocavu-network	ocavu	Ocavu Network
occamfi	occ	OccamFi
occamx	ocx	OccamX
oceanex	oce	OceanEX
oceanland	oland	OceanLand
ocean-protocol	ocean	Ocean Protocol
oceans-finance-v2	oceansv2	Oceans Finance
oceans-swap	odex	Oceans Swap
oceidon-blox	oblox	Oceidon Blox
ociswap	oci	Ociswap
oc-protocol	ocp	OC Protocol
octafarm	octf	Octafarm
octane-protocol-token	octane	Octane Protocol
octaplex-network	plx	Octaplex Network
oction	octi	Oction
octocoin	888	Octocoin
octofi	octo	OctoFi
octogamex	ogt	OctoGamex
octopus-network	oct	Octopus Network
octopus-protocol	ops	Octopus Protocol
octorand	octo	Octorand
octus-bridge	bridge	Octus Bridge
octus-social-media-market	octsmm	Octus Social Media Market
oculus-vision	ocv	Oculus Vision
oddz	oddz	Oddz
odem	ode	ODEM
odin-protocol	odin	Odin Protocol
odop	odop	oDOP
oduwa-coin	owc	Oduwa Coin
odyssey	ocn	Odyssey
odysseywallet	odys	OdysseyWallet
oec-bch	bchk	OEC BCH
oec-binance-coin	bnb	OEC Binance Coin
oec-btc	btck	OEC BTC
oec-chainlink	linkk	OEC Chainlink
oec-dai	daik	OEC DAI
oec-dot	dotk	OEC DOT
oec-etc	etck	OEC ETC
oec-eth	ethk	OEC ETH
oec-fil	filk	OEC FIL
oec-ltc	ltck	OEC LTC
oec-shib	shibk	OEC SHIB
oec-token	okt	OKC
oec-tron	trxk	OEC Tron
oec-uni	unik	OEC UNI
ofero	ofe	Ofero
official-crypto-cowboy-token	occt	Official Crypto Cowboy
offline	off	Offline
offshift	xft	Offshift
ofi-cash	ofi	OFI.cash
og-fan-token	og	OG Fan Token
oh-finance	oh	Oh! Finance
ohm-coin	ohmc	Ohmcoin
ohmd	$wsohmd	OHMD
oho-blockchain	oho	OHO Blockchain
oikos	oks	Oikos
oilage	oil	OILage
oiler	oil	Oiler
oin-finance	oin	OIN Finance
oiocoin	oioc	OIOCoin
ojamu	oja	Ojamu
oje-token	oje	Oje
okage-inu	okage	Okage Inu
okaleido	oka	Okaleido
okami-lana	okana	Okami Lana
okay-bears-floor-index	okayb	Okay Bears Floor Index
okb	okb	OKB
okcash	ok	Okcash
okdex	okdex	okdex
okex-fly	okfly	Okex Fly
okeycoin	okey	OKEYCOIN
okidoki-social	doki	Okidoki Social
ok-lets-go	oklg	ok.lets.go.
okletsplay	oklp	OkLetsPlay
okratech-token	ort	Okratech
okse	okse	Okse
okuru	xot	Okuru
okx-staked-dot1	okdot1	OKX Staked DOT1
okx-staked-dot2	okdot2	OKX Staked DOT2
old-bitcoin	bc	Old Bitcoin
olecoin	ole	OleCoin
olive	olv	OLIVE
olivecash	olive	Olive Cash
oloid	oloid	OLOID
olympic-doge	olympic doge	Olympic Doge
olympus	ohm	Olympus
olympus-v1	ohm	Olympus v1
olyverse	oly	Olyverse
omax-token	omax	Omax
ombre	omb	Ombre
omchain	omc	Omchain
omega	omega	OMEGA
omega-particle	omp	Omega Particle
omega-protocol-money	opm	Omega Protocol Money
omisego	omg	OMG Network
omm-tokens	omm	Omm
omni	omni	Omni
omniaverse	omnia	OmniaVerse
omni-consumer-protocol	ocp	Omni Consumer Protocol
omnidex	charm	OmniDex
omni-real-estate-token	ort	Omni Real Estate
omnis	omnis	OMNIS
omnisea	osea	Omnisea
omniwhirl	whirl	OmniWhirl
omotenashicoin	mtns	OmotenashiCoin
onbuff	onit	ONBUFF
one	one	One
one-basis-cash	obs	One Basis Cash
onebtc	onebtc	Legacy oneBTC
one-cash	onc	One Cash
onegetcoin	ogc	Onegetcoin
one-hundred-million-inu	ohmi	One Hundred Million Inu
oneichi	oneichi	oneICHI
one-ledger	olt	OneLedger
onemoon	onemoon	OneMoon
one-piece	onepiece	ONE PIECE
onerare	orare	OneRare
onering	ring	OneRing
oneroot-network	rnt	OneRoot Network
one-share	ons	One Share
onespace	1sp	Onespace
oneswap-dao-token	ones	OneSwap DAO
one-world-coin	owo	One World Coin
ong	ong	Ontology Gas
onigiri	onigiri	Onigiri
onigiri-neko	onigi	Onigiri Neko
oni-token	oni	ONINO
online-cold-wallet	ocw	Online Cold Wallet
online-expo	expo	Expo
only1	like	Only1
onooks	ooks	Onooks
onston	onston	Onston
ontology	ont	Ontology
ontpay	ontp	ONTPAY
onus	onus	ONUS
onx-finance	onx	OnX Finance
onyx	onyx	Onyx
oobit	obt	Oobit
oogear	og	Oogear
oogi	oogi	OOGI
ookeenga	okg	Ookeenga
ooki	ooki	Ooki
oolongswap	olo	OolongSwap
ooze	ooze	Ooze
opacity	opct	Opacity
opalcoin	auop	Opalcoin
openai-erc	openai erc	OpenAI ERC
openalexa-protocol	oap	OpenAlexa Protocol
openanx	oax	OAX
openblox	obx	OpenBlox
opendao	sos	OpenDAO
open-governance-token	open	OPEN Governance
openleverage	ole	OpenLeverage
openlink	olink	OpenLink
openlive-nft	opv	OpenLive NFT
opennity	opnn	Opennity
openocean	ooe	OpenOcean
open-platform	open	Open Platform
open-proprietary-protocol	opp	Open Proprietary Protocol
openstream-world	osw	OpenStream World
openswap	oswap	OpenSwap
openswap-token	openx	OpenSwap.One
openx-locked-velo	opxvevelo	OpenX Locked Velo
openxswap	openx	OpenXSwap
openxswap-gov-token	xopenx	OpenXSwap Gov. Token
operon-origins	oro	Operon Origins
opes-wrapped-pe	wpe	OPES (Wrapped PE)
opipets	opip	OpiPets
opium	opium	Opium
oppa	oppa	OPPA
oppa-token	oppa	OPPA Token
optical-bitcoin	obtc	Optical Bitcoin
optimism	op	Optimism
optimismpad	opp	OptimismPad
optimus	optcm	Optimus
optimus-finance	fin	Optimus Finance
optimus-opt	opt	Optimus OPT
optimus-opt2	opt2	Optimus OPT2
optimus-opt3	opt3	Optimus OPT3
option-panda-platform	opa	Option Panda Platform
option-room	room	OptionRoom
opulous	opul	Opulous
opx-finance	opx	OPX Finance
opyn-squeeth	osqth	Opyn Squeeth
oraclechain	oct	OracleChain
oracle-dao	orc	Oracle Dao
oracleswap	oracle	OracleSwap
oracle-system	orc	Oracle System
oracolxor	xor	Oracolxor
oragonx	orgn	OragonX
oraichain-token	orai	Oraichain
oraidex	oraix	OraiDEX
orakler	orkl	Orakler
orakuru	ork	Orakuru
orao-network	orao	ORAO Network
orbis	orbc	Orbis
orbitau-taureum	taum	Orbitau Taureum
orbit-bridge-klaytn-belt	obelt	Orbit Bridge Klaytn BELT
orbit-bridge-klaytn-binance-coin	obnb	Orbit Bridge Klaytn Binance Coin
orbit-bridge-klaytn-ethereum	oeth	Orbit Bridge Klaytn Ethereum
orbit-bridge-klaytn-handy	ohandy	Orbit Bridge Klaytn Handy
orbit-bridge-klaytn-matic	omatic	Orbit Bridge Klaytn MATIC
orbit-bridge-klaytn-orbit-chain	oorc	Orbit Bridge Klaytn Orbit Chain
orbit-bridge-klaytn-ripple	oxrp	Orbit Bridge Klaytn Ripple
orbit-bridge-klaytn-usdc	ousdc	Orbit Bridge Klaytn USDC
orbit-bridge-klaytn-usd-tether	ousdt	Orbit Bridge Klaytn USD Tether
orbit-bridge-klaytn-wrapped-btc	owbtc	Orbit Bridge Klaytn Wrapped BTC
orbit-chain	orc	Orbit Chain
orbitcoin	orb	Orbitcoin
orbit-token	orbit	First On The Moon ORBIT
orbler	orbr	Orbler
orbs	orbs	Orbs
orca	orca	Orca
orca-avai	avai	Orca AVAI
orcadao	orca	Orca DAO
orchid-protocol	oxt	Orchid Protocol
orclands-metaverse	orc	Orclands Metaverse
order-of-the-apeverse	oav	Order of the Apeverse
oreoswap	oreo	OreoSwap
ore-token	ore	ORE
organix	ogx	Organix
orient-walt	htdf	Orient Walt
original-crypto-coin	tusc	The Universal Settlement Coin
origindao	og	OriginDAO
origin-dollar	ousd	Origin Dollar
origin-dollar-governance	ogv	Origin Dollar Governance
origin-protocol	ogn	Origin Protocol
origin-sport	ors	Origin Sport
origintrail	trac	OriginTrail
origo	ogo	Origo
origyn-foundation	ogy	ORIGYN Foundation
orion-cash	orc	Orion Cash
orion-money	orion	Orion Money
orion-protocol	orn	Orion Protocol
orkan	ork	Orkan
orlando-chain	orl	Orlando Chain
orlycoin	orly	Orlycoin
ormeus-cash	omc	Ormeus Cash
ormeuscoin	orme	Ormeus Coin
ormeus-ecosystem	eco	Ormeus Ecosystem
oro	oro	ORO
ort-rune-rune-game	ort	ORT Rune (Rune.Game)
oryxfi	oryx	OryxFi
osis	osis	OSIS
osk	osk	OSK
osmiumcoin	os76	OsmiumCoin
osmosis	osmo	Osmosis
otcbtc-token	otb	OTCBTC
otherdao	othr	OtherDAO
otium-technologies	otium	Otium Technologies
otocash	oto	OTOCASH
otterclam	clam	OtterClam
otter-finance	otr	Otter Finance
ouro-governance-share	ogs	Ouro Governance Share
ouro-stablecoin	ouro	Ouro Stablecoin
ouse	ouse	Ouse
outer-ring	gq	Outer Ring MMO
outpost	out	OutPost
outrace	ore	Outrace
ovato	ovo	Ovato
overlay-protocol	ovl	Overlay Protocol
overline-emblem	emb	Overline Emblem
overload-game	ovl	Overlord Game
overlord	lord	Overlord
ovr	ovr	Ovr
owgaming	ow	OWGaming
owldao	owl	OwlDAO
owloper	owl	Owloper Owl
ownix	onx	Ownix
ownly	own	Ownly
own-token	own	OWN Token
oxbitcoin	0xbtc	0xBitcoin
oxbull-solana	oxs	Oxbull Solana
oxbull-tech-2	oxb	Oxbull Tech
oxfinance	oxfi	Oxfinance
oxsolid	oxsolid	oxSOLID
oxygen	oxy	Oxygen
oxymetatoken	omt	OxyMetaToken
oxyo2	ox2	OxyO2
p2p-solutions-foundation	p2ps	P2P solutions foundation
p2p-taxi	p2ptxt	p2p taxi
paccoin	pac	PAC Protocol
pacific	paf	Pacific
pacific-defi	pacific	Pacific DeFi
packageportal	port	PackagePortal
packetchain	ptcl	Packetchain
packswap	pact	PactSwap
pacoca	pacoca	Pacoca
pagan-gods-fur-token	fur	Pagan Gods Fur
page	page	Page
page-network	pgx	Page Network
paid-network	paid	PAID Network
paint	paint	MurAll
paint-swap	brush	Paint Swap
pakcoin	pak	Pakcoin
palace	paa	Palace
paladin	pal	Paladin
paladin-dao	pal	Paladin DAO
palantir-tokenized-stock-defichain	dpltr	Palantir Tokenized Stock Defichain
palette	plt	Palette
palgold	palg	PalGold
pallapay	palla	Pallapay
palmpay	palm	PalmPay
palmswap	palm	PalmSwap
pampther	pampther	Pampther
pana-dao	pana	PANA
pancake-bunny	bunny	Pancake Bunny
pancake-games	gcake	Pancake Games
pancake-hunny	hunny	Hunny Finance
pancakelock	plock	PancakeLock
pancakepoll	ppoll	PancakePoll
pancakeswap-token	cake	PancakeSwap
pancaketools	tcake	PancakeTools
pandacoin	pnd	Pandacoin
panda-coin	panda	Panda Coin
pandadao	panda	PandaDAO
pando	pando	Pando
pandora-cash	pcash	Pandora Cash
pandora-protocol	pndr	Pandora Protocol
pandora-spirit	psr	Pandora Spirit
pando-token	ptx	PandoProject
pando-usd	pusd	Pando USD
pangea-governance-token	stone	PANGEA GOVERNANCE TOKEN
pangolin	png	Pangolin
pangolin-flare	pfl	Pangolin Flare
pangolin-hedera	pbar	Pangolin Hedera
pangolin-songbird	psb	Pangolin Songbird
panicswap	panic	PanicSwap
pankuku	kuku	panKUKU
pantheon-x	xpn	PANTHEON X
panther	zkp	Panther Protocol
pantos	pan	Pantos
panvala-pan	pan	Panvala Pan
papa-doge	papadoge	Papa Doge
paparazzi	pazzi	Paparazzi
paper-dab1cd41-029d-4207-b87f-fd98d6fe737c	$paper	$PAPER
paper-dao	ppr	Paper DAO
paper-fantom	paper	Paper
pappay	pappay	Pappay
paprprintr-finance	papr	Paprprintr Finance
parachute	par	Parachute
paradigm-zero	pz	Paradigm Zero
paradise-defi	pdf	Paradise Defi
paradisefi	eden	ParadiseFi
paradisehotel-nft	pht	ParadiseHotel NFT
paradox-metaverse	paradox	Paradox Metaverse
paragen	rgen	Paragen
paragonsdao	pdt	ParagonsDAO
paralink-network	para	Paralink Network
parallelcoin	duo	ParallelCoin
parallel-finance	para	Parallel Finance
paras	paras	Paras
parasol-finance	psol	Parasol Finance
parasset	aset	Parasset
parastate	state	ParaState
paraswap	psp	ParaSwap
paratoken-2	para	Para
parex	prx	Parex
paribu-net	prb	Paribu Net
paribus	pbx	Paribus
paris-saint-germain-fan-token	psg	Paris Saint-Germain Fan Token
parrotly	pbirb	Parrotly
parrot-protocol	prt	Parrot Protocol
parrot-usd	pai	Parrot USD
parsiq	prq	PARSIQ
parsl	seed	Parsl
par-stablecoin	par	Parallel
particl	part	Particl
particle-2	prtcle	Particle
particle-technology	part	Particle Technology
partneroid	ptr	Partner Coin
parts-of-four-coin	p4c	Parts of Four Coin
partyfi	pfi	PartyFi
pascalcoin	pasc	Pascal
pasha	pasha	Pasha
passive-income	psi	Passive Income
pastel	psl	Pastel
pathdao	path	PathDAO
pathfundv2	path	PathFundV2
patientory	ptoy	Patientory
patron	pat	Patron
paul-token	paul	PAUL
pavecoin	pvn	Pavecoin
pavia	pavia	Pavia
paw	paw	Paw
pawn-2	pawn	Pawn
pawn-my-nft	pnft	Pawn My NFT
paws-funds	paws	Paws Funds
pawswap	paw	PAWSWAP
pawthereum	pawth	Pawthereum
pawtocol	upi	Pawtocol
paw-v2	paw	Paw V2
pax-gold	paxg	PAX Gold
paxos-standard	usdp	Pax Dollar
pax-world	paxw	pax.world
payaccept	payt	PayAccept
payb	payb	PayB
paybandcoin	pybc	PaybandCoin
paybit	paybit	PayBit
paybolt	pay	PayBolt
paycent	pyn	Paycent
paycer-protocol	pcr	Paycer Protocol
pay-coin	pci	Paycoin
paycon-token	con	Paycon
paydex	dpay	PayDex
payflow	pft	PayFlow
paygo	paygo	PayGo
pay-it-now	pin	Pay It Now
paymastercoin	pmc	PayMasterCoin
paynet-coin	payn	PAYNET
paypolitan-token	epan	Paypolitan
payrue	propel	Propel
paytomat	pti	Paytomat
payturn	ptr	Payturn
payyoda	yot	PayYoda
payz-payments	payz	Payz Payments
pbtc35a	pbtc35a	pBTC35A
pchain	pi	Plian
pdbc-defichain	dpdbc	PDBC Defichain
pdshare	pdshare	PDSHARE
pdx-coin	pdx	PDX Coin
peace-dao	peace	Peace DAO
peace-token	pet	Peace
peach-finance	peech	Peach Finance
peachfolio	pchf	Peachfolio
peacockcoin-eth	pekc	Peacockcoin (ETH)
pea-farm	pea	Pea Farm
peak-finance	peak	Peak Finance
peakmines-peak	peak	Peakmines PEAK
peak-token	pktk	Peak Token
peanut	nux	Peanut
pear	pear	Pear
peardao	pex	PearDAO
pearl-finance	pearl	Pearl Finance
pecora-network	pen	Pecora Network
peecoin-charts	peecoin	PeeCoin Charts
peercoin	ppc	Peercoin
peerex-network	perx	PeerEx Network
peerguess	guess	PeerGuess
peet-defi	pte	Peet DeFi
pegasus-pow	$pgs	Pegasus
pegasys	psys	Pegasys
pegaxy-stone	pgx	Pegaxy Stone
pegazus-finance	peg	Pegazus Finance
pegnet	peg	PegNet
pele-network	pele	PELE Network
pembrock	pem	Pembrock
pencil-dao	pencil	Pencil DAO
pendle	pendle	Pendle
penguin-finance	pefi	Penguin Finance
penguin-karts	pgk	Penguin Karts
penguin-party-fish	fish	Penguin Party Fish
penny-token	penny	Penny Token
penrose-finance	pen	Penrose Finance
pension-plan	pp	Pension Plan
peony-coin	pny	Peony Coin
peoples-punk	dddd	People's Punk
peoplez	lez	Peoplez
peos	peos	pEOS
pepe-bet	pepebet	PEPE.bet
pepedex	ppdex	Pepedex
pepegold	peps	PEPS Coin
pepegold-6ea5105a-8bbe-45bc-bd1c-dc9b01a19be7	pepe	PEPEGOLD
pera-finance	pera	Pera Finance
perfect-world	pfw	Perfect World
peri-finance	peri	PERI Finance
perion	perc	Perion
perlin	perl	PERL.eco
permission-coin	ask	Permission Coin
perpetual-protocol	perp	Perpetual Protocol
perpetuum-coin	prp	Perpetuum Coin
perp-inu	perpi	Perp Inu
perseus-fintech	prs	Perseus Fintech
persia	persia	Persia
persib-fan-token	persib	Persib Fan Token
persistence	xprt	Persistence
persistence-staked-xprt	stkxprt	pSTAKE Staked XPRT
perth-mint-gold-token	pmgt	Perth Mint Gold Token
peruvian-national-football-team-fan-token	fpft	Peruvian National Football Team Fan Token
pesabase	pesa	Pesabase
peseta-digital	ptd	Peseta Digital
peseta-token	pst	Peseta Token
petals	pts	Petals
peth	peth	pETH
peth18c	peth18c	pETH18C
petoverse	peto	Petoverse
petrodollar	xpd	PetroDollar
petroleum-oil	oil	Petroleum OIL
pet-store	psbd	Pet Store
pett-network	pett	Pett Network
pexcoin	pex	Pexcoin
pftm	pftm	pFTM
pgala	pgala	pGALA
pgov	pgov	PGOV
pha	pha	Phala Network
phaeton	phae	Phaeton
phant	pnt	Phant
phantasia	fant	Phantasia
phantasma	soul	Phantasma
phantasma-energy	kcal	Phantasma Energy
phantom-protocol	phm	Phantom Protocol
phenix-finance-2	phnx	Phenix Finance (Cronos)
phenix-finance-polygon	phnx	Phenix Finance (Polygon)
philcoin	phl	Philcoin
phobos-token	pbos	Phobos Token
phoenix	phx	Phoenix
phoenixcoin	pxc	Phoenixcoin
phoenixdao	phnx	PhoenixDAO
phoenix-defi-finance	pnixs	Phoenix Defi Finance
phoenix-global	phb	Phoenix Global
phoenix-protocol-b7a9513c-36e9-4a6b-b6ae-6a1a76bb913e	pp	Phoenix Protocol
phoenix-token	phx	Phoenix Finance
phoneum	pht	Phoneum
phonon-dao	phonon	Phonon DAO
phore	phr	Phore
phoswap	pho	Phoswap
photochromic	phcr	PhotoChromic
photonswap	photon	PhotonSwap
phunk-vault-nftx	phunk	PHUNK Vault (NFTX)
phuntoken	phtk	Phun Token
phuture	phtr	Phuture
phuture-defi-index	pdi	Phuture DeFi Index
physis	phy	Physis
pias	pias	PIAS
pibble	pib	Pibble
picasso	pica	PICASSO
piccolo-inu	pinu	Piccolo Inu
picipo	picipo	Picipo
pick	pick	PICK
pickle-finance	pickle	Pickle Finance
picogo	pico	PicoGo
piconnect	pico	PiConnect
piction-network	pxl	Piction Network
piedao-balanced-crypto-pie	bcp	PieDAO Balanced Crypto Pie
piedao-btc	btc++	PieDAO BTC++
piedao-defi	defi++	PieDAO DEFI++
piedao-defi-large-cap	defi+l	PieDAO DEFI Large Cap
piedao-defi-small-cap	defi+s	PieDAO DEFI Small Cap
piedao-dough-v2	dough	PieDAO DOUGH v2
piedao-yearn-ecosystem-pie	ypie	PieDAO Yearn Ecosystem Pie
pige-inu	pinu	Pige Inu
pigeoncoin	pgn	Pigeoncoin
pigeon-sol	pgnt	Pigeon Sol
pig-finance	pig	Pig Finance
piggy	piggy	Piggy
piggy-bank-token	piggy	PiggyBank
piggy-finance	piggy	Piggy Finance
piggy-share	pshare	Piggy Share
pigs-2	afp	PIGS
pikachu	pika	Pika
pikaster	mls	Metaland Shares
pillar	plr	Pillar
pilot	ptd	Pilot
pimride	pim	PIMRIDE
pi-network-defi	pinetworkdefi	Pi Network DeFi
pi-network-iou	pi	Pi Network
pinkcoin	pink	Pinkcoin
pinkelon	pinke	PinkElon
pinkie-inu	pinkie	Pinkie Inu
pinkmoon	pinkm	PinkMoon
pinknode	pnode	Pinknode
pink-panda	pinkpanda	Pink Panda
pinkpea-finance	pea	PinkPea.Finance
pinksale	pinksale	PinkSale
pinkslip-finance	pslip	Pinkslip Finance
pinkswap-token	pinks	PinkSwap
pintu-token	ptu	Pintu
piogold	pio	PioGold
pippi-finance	pipi	Pippi Finance
pi-protocol	pip	Pi Protocol
piratecash	pirate	PirateCash
pirate-chain	arrr	Pirate Chain
piratecoin	piratecoin☠	PirateCoin
pirate-dice	booty	Pirate Dice
piratera	pira	Piratera
piratesking	pkt	PiratesKing
pirate-x-pirate	pxp	Pirate x Pirate
pirichain	piri	Pirichain
piston	pstn	Piston
pist-trust	pist	Pist Trust
pitbull	pit	Pitbull
pitbull-inu	piti	Pitbull Inu
pitch-fxs	pitchfxs	Pitch FXS
pitquidity-capital	pitqc	Pitquidity Capital
pivot-token	pvt	Pivot
pivx	pivx	PIVX
pivx-lite	pivxl	Pivx Lite
pixel-doge	pxdoge	Pixel Doge
pixelpotus	pxl	PixelPotus
pixels-so	pixl	Pixels.so
pixelverse	pixel	PixelVerse
pixeos	pixeos	PixEOS
pixiaai	pixia	PixiaAI
pixie	pix	Pixie
pixiu-finance	pixiu	Pixiu Finance
pixl-coin-2	pxlc	Pixl Coin
pixls-vault-nftx	pixls	PIXLS Vault (NFTX)
pizza-game	pizza	Pizza Game
pizza-nft	$pizza	Pizza NFT
pizza-pug-coin	ppug	Pizza Pug Coin
pizzaswap	pizza	PizzaSwap
pizza-usde	pizza	PIZZA
pkg-token	pkg	PKG
pkt	pkt	PKT
placeh	phl	Placeholders
place-war	place	PlaceWar Governance
plair	pla	Plair
planet	pla	PLANET
planet-alliance-star-dao	star	Planet Alliance STAR DAO
planetapeclub	plac	PlanetApeClub
planetcats	catcoin	PlanetCats
planet-finance	aqua	Planet Finance
planet-infinity	pli	Planet infinity
planet-sandbox	psb	Planet Sandbox
planetwatch	planets	PlanetWatch
plant-empires	pefi	Plant Empires
plant-exodus	pexo	Plant Exodus
plant-vs-undead-token	pvu	Plant vs Undead
plasma-finance	ppay	Plasma Finance
plastiks	plastik	Plastiks
plata-network	plata	Plata Network
platincoin	plc	PlatinCoin
platinx	ptx	PlatinX
plato-farm	mark	Plato Farm
platoncoin	pltc	PlatonCoin
platon-network	lat	PlatON Network
platypus-finance	ptp	Platypus Finance
play2live	luc	Level-Up Coin
play4cash	p4c	Play4Cash
playa3ull-games	3ull	Playa3ull Games
playcent	pcnt	Playcent
playchip	pla	PlayChip
playdapp	pla	PlayDapp
player-2	deo	Player 2
playermon	pym	Playermon
playervsplayercoin	pvp	PlayerVsPlayerCoin
playfuel	plf	PlayFuel
playgame	pxg	PlayGame
playground	playa	Playground
playground-waves-floor-index	waves	Playground Waves Floor Index
play-it-forward-dao	pif	Play It Forward DAO
playkey	pkt	PlayKey
playmarket	pmt	DAO PlayMarket 2.0
playmusic	play	Playmusic
playnity	ply	PlayNity
playpad	ppad	PlayPad
playposeidon-nft	ppp	PlayPoseidon NFT
plc-ultima	plcu	PLC Ultima
plearn	pln	PLEARN
pleasure-coin	nsfw	Pleasure Coin
plebe-gaming	pleb	Plebe Gaming
pledge	plgr	Pledge
pledgecamp	plg	Pledgecamp
plenty-dao	plenty	Plenty DeFi
plex	plex	PLEX
plgnet	plug	PL^Gnet
plotx	plot	PlotX
plug-chain	pc	Plug Chain
plugin	pli	Plugin
plunge	plg	Plunge
pluracoin	plura	PluraCoin
plusonecoin	plus1	PlusOneCoin
pluton	plu	Pluton
plutonian-dao	pld	Plutonian DAO
plutopepe	pluto	PlutoPepe
pluto-pluto	pluto	Pluto PLUTO
plutusdao	pls	PlutusDAO
plutusfi	plut	PlutusFi
pmg-coin	pmg	PMG Coin
pmxx	pmxx	PMXX
pnetwork	pnt	pNetwork
pn-token	pn	PN
poa-network	poa	POA Network
poc-blockchain	poc	POC Blockchain
poc-chain	pocc	POC Chain
pochi-inu	pochi	Pochi Inu
pocket-arena	poc	Pocket Arena
pocket-battles-nft-war	pkt	Pocket Battles: NFT War
pocketcoin	pkoin	Pocketcoin
pocket-doge	pckt	Pocket
pocket-network	pokt	Pocket Network
pocmon-2	mon	PocMon
pocoland	poco	Pocoland
poet	poe	Po.et
pofi	pofi	PoFi
pog-coin	pog	PolygonumOnline
poglana	pog	Poglana
point-coin	point	Point Coin
point-network	point	Point Network
pointpay	pxp	PointPay
poison-finance	poi$on	Poison Finance
pokedx	pdx	PokeDX
pokelon	pokelon	POKELON
poken	pkn	Poken
pokeplay-token	ppc	PokePlay Token
pokerfi	pokerfi	PokerFi
polar	polar	POLAR
polaris	polar	Polarisdefi
polaris-finance-orbital	orbital	Polaris Finance Orbital
polaris-share	pola	Polaris Share
polars	pol	Polars
polar-sync	polar	Polar Sync
polar-token	polar	Polaris Finance Polar
polinate	poli	Polinate
polis	polis	Polis
polkabridge	pbr	PolkaBridge
polka-city	polc	Polkacity
polka-classic	dotc	Polka Classic
polkadex	pdex	Polkadex
polkadomain	name	PolkaDomain
polkadot	dot	Polkadot
polkaex	pkex	PolkaEx
polkafantasy	xp	PolkaFantasy
polkafoundry	pkf	Firebird
polkainsure-finance	pis	Polkainsure Finance
polkally	kally	Kally
polkamarkets	polk	Polkamarkets
polkapet-world	pets	PolkaPet World
polkaplay	polo	NftyPlay
polkarare	prare	Polkarare
polkasocial-network	psn	Polkasocial Network
polkastarter	pols	Polkastarter
polkastation	polkas	PolkaStation
polkaswap	pswap	Polkaswap
polka-ventures	polven	Polka Ventures
polkawar	pwar	PolkaWar
polker	pkr	Polker
pollchain	poll	Pollchain
pollen	pln	Pollen
pollen-coin	pcn	Pollen Coin
pollux-coin	pox	Pollux Coin
polly	polly	Polly Finance
polly-defi-nest	ndefi	Polly DeFi Nest
polyalpha-finance	alpha	PolyAlpha Finance
polybeta-finance	beta	PolyBeta Finance
polybius	plbt	Polybius
polycake-finance	pcake	PolyCake Finance
polycat-finance	fish	Polycat Finance
polychain-monsters	pmon	Polychain Monsters
polychain-monsters-genesis	pmlg	Polychain Monsters Genesis
polycub	polycub	PolyCub
polydoge	polydoge	PolyDoge
polyfarm-egg	egg	PolyFarm EGG
polygamma	gamma	PolyGamma Finance
polygen	pgen	Polygen
polygod	gull	PolyGod
polygold	polygold	PolyGold
polygon-babydoge	polybabydoge	Polygon BabyDoge
polygon-ecosystem-index	peco	Amun Polygon Ecosystem Index
polygonfarm-finance	spade	PolygonFarm Finance
polygon-hbd	phbd	Polygon HBD
polygon-hive	phive	Polygon Hive
polylastic	polx	Polylastic
polylauncher	angel	Polylauncher
polymath	poly	Polymath
poly-maximus	poly	POLY Maximus
polymesh	polyx	Polymesh
polypad	polypad	PolyPad
poly-peg-mdex	hmdx	Poly-Peg Mdex
polypug	polypug	PolyPug
polypup	pup	PolyPup
polyquity	pyq	PolyQuity
polyquity-dollar	pyd	PolyQuity Dollar
polyroll	roll	Polyroll
polysage	sage	Polysage
polyshark-finance	shark	PolyShark Finance
polyshield	shi3ld	PolyShield
polysports	ps1	POLYSPORTS
polyswarm	nct	PolySwarm
polytrade	trade	Polytrade
polywhale	krill	Polywhale
polywolf	moon	Polywolf
polyx	pxt	POLYX
polyyeld-token	yeld	PolyYeld
polyyield-token	yield	PolyYield
polyyork	york	PolyYork
polyzap	pzap	PolyZap
pomeranian	pom	Pomeranian
pomeranian-eth	pom	Pomeranian ETH
pomerium	pmr	Pomerium
pom-governance	pomg	POM Governance
pomi	pomi	Pomi
pomo	pomo	Pomo
pompom	pom	PomPom
pontem-network	pont	Pontem Network
pontoon	toon	Pontoon
ponydao	pnyd	PonyDAO
pony-index	pony	PONY Index
ponzicoin	ponzi	PonziCoin
pooch	pooch	Pooch
poochain	poop	Poochain
poocoin	poocoin	PooCoin
poodle	poodl	Poodl
poodlefi	pfi	PoodleFi
poo-doge	poo doge	Poo Doge
poofcash	poof	PoofCash
poof-token	poof	Poof Token
poogrow	poogrow	PooGrow
poolcoin	pool	POOLCOIN
poollotto-finance	plt	Poollotto.finance
pool-party	pp	Pool Party
pooltogether	pool	PoolTogether
poolz-finance	poolz	Poolz Finance
poomoon	poo	POOMOON
poopcoin	poop	PoopCoin
poopsicle	poop	Poopsicle
poordoge	poordoge	PoorDoge
poorpleb	pp	PoorPleb
pop	pop!	POP
pop-chest-token	pop	POP Network
popcoin	pop	Popcoin
popcorn	pop	Popcorn
popkon	popk	POPKON
populous	ppt	Populous
populous-xbrl-token	pxt	Populous XBRL
poriverse	riken	Poriverse
porkswap	pswap	PorkSwap
pornrocket	pornrocket	PornRocket
porta	kian	Porta
portals-ivory-index	ivry	Portals Ivory Index
porte-token	porte	Porte
port-finance	port	Port Finance
portify	pfy	Portify
portion	prt	Portion
portugal-national-team-fan-token	por	Portugal National Team Fan Token
portuma	por	Portuma
pos-32	pos32	PoS-32
pos-coin	pos	POS Coin
poseidon-2	psdn	Poseidon
poseidon-finance	psdn	Poseidon Finance
poseidon-ocean	psdnocean	Poseidon OCEAN
position-token	posi	Position
positron-token	pot	Positron
posschain	poss	Posschain
postcoin	post	PostCoin
posthuman	phmn	POSTHUMAN
potato	potato	Potato
potcoin	pot	Potcoin
potent-coin	ptt	Potent Coin
potentiam	ptm	Potentiam
potfolio	ptf	Potfolio
poundtoken	gbpt	poundtoken
powabit	powa	Powabit
pow-doge	dogw	PoW Doge
powerfan	pfan	PowerFan
powerful	pwfl	Powerful
power-index-pool-token	pipt	Power Index Pool
power-ledger	powr	Power Ledger
power-nodes	power	Power Nodes
power-of-deep-ocean	podo	Power Of Deep Ocean
powerswap	power	PowerSwap
powertrade-fuel	ptf	PowerTrade Fuel
power-vault	powv	Power Vault
powpad	pp	Powpad
powsea	sea	PowSea
powswap	pow	Powswap
pqbert	pqbert	pQBERT
prcy-coin	prcy	PRivaCY Coin
predictcoin	pred	Predictcoin
prelax	peax	Prelax
prema	prmx	PREMA
premia	premia	Premia
premio	premio	Premio
prepo	ppo	prePO
pre-retogeum	prtg	Pre-Retogeum
presaledao	af-presaledao	PresaleDAO
presale-world	presale	Presale.World
presearch	pre	Presearch
primal-2	prm	Primal Network
primal-b3099cd0-995a-4311-80d5-9c133153b38e	primal	PRIMAL
primas	pst	Primas
primate	primate	Primate
prime	d2d	Prime
prime-chain	pmc	Prime Chain
primecoin	xpm	Primecoin
prime-dai	pdai	Prime DAI
prime-numbers	prnt	Prime Numbers Ecosystem
primex-finance	pmx	Primex Finance
prime-xi	pxi	Prime-XI
primo-dao	primo	Primo DAO
princess-striker-gem	prsg	Princess Striker Gem
prism	prism	Prism
prism-governance-token	xprism	Prism Governance
prism-protocol	prism	Prism Protocol
privacoin	prvc	PrivaCoin
privacyswap	prv	PrivacySwap
privapp-network	bpriva	Privapp Network
privateum	pri	Privateum
privatix	prix	Privatix
privcy	priv	PRiVCY
privilege	prvg	Privilege
prizm	pzm	Prizm
probably-nothing	prbly	Probably Nothing
probinex	pbx	Probinex
probit-exchange	prob	Probit
professional-fighters-league-fan-token	pfl	Professional Fighters League Fan Token
project202	p202	Project 202
project21	p21	Project21
project-babel	pbt	Project Babel
project-carecoin	caresv2	Project CareCoin
project-galaxy	gal	Galxe
project-inverse	xiv	Planet Inverse
projectmars	mars	ProjectMars
project-oasis	oasis	ProjectOasis
project-quantum	qbit	Project Quantum
project-with	wiken	Project WITH
projectx	xil	Xillion
project-x	nanox	Project-X
projectx-d78dc2ae-9c8a-45ed-bd6a-22291d9d0812	prox	ProjectX
projekt-gold	gold	Projekt Gold
prometeus	prom	Prom
prometheus-token	pro	Peak Finance Prometheus
promise-token	promise	Promise
promodio	pmd	Promodio
proof-of-apes	poa	Proof Of Apes
proof-of-degen	bnb2.0	Proof of Degen
proof-of-gorila	pog	Proof Of Gorila
proof-of-liquidity	pol	Proof Of Liquidity
proof-of-memes	eth2.0	Proof Of Memes - Ethereum
proof-of-memes-pomchain	pom	Proof Of Memes
propel-token	pel	Propel PEL
property-blockchain-trade	pbt	PROPERTY BLOCKCHAIN TRADE
prophet	pro	Prophet
propland	prop	Propland
props	props	Props
propy	pro	Propy
prospectorcrane	crane$	ProspectorCrane
prosper	pros	Prosper
prosperity-gold	prgd	Prosperity Gold
prostarter-token	prot	ProStarter
protector-roge	proge	Protector Roge
protectors-of-the-realm	wer1	Protectors of the Realm
proteo-defi	proteo	Proteo DeFi
protocol-zero	zro	Protocol Zero
protocon	pen	Protocon
protofi	proto	Protofi
proton	xpr	Proton
proton-coin	pro	Proton Coin
proton-loan	loan	Proton Loan
protoreality-games	prgc	ProtoReality Games
province	maple	Province
proximax	xpx	ProximaX
proxy	prxy	Proxy
proxynode	prx	ProxyNode
proxy-swap	proxy	Proxy Swap
pruf-protocol	pruf	PRüF Protocol
pryz	pryz	Pryz
pspace	pspace	pSPACE
pstake-finance	pstake	pSTAKE Finance
pstake-staked-atom	stkatom	pSTAKE Staked ATOM
pstake-staked-bnb	stkbnb	pSTAKE Staked BNB
pstake-staked-eth	stketh	pSTAKE Staked ETH
psyche	usd1	Psyche
psycho-doge	psychodoge	Psycho Doge
psy-coin	psy	PSY Coin
psyoptions	psy	PsyOptions
ptokens-btc	pbtc	pTokens BTC [OLD]
ptokens-btc-2	pbtc	pTokens BTC
ptokens-ore	ore	ORE Network
ptx	ptx	ProtocolX
pube-finance	pube	Pube Finance
pub-finance	pint	Pub Finance
public-index-network	pin	Public Index Network
public-mint	mint	Public Mint
publish	news	PUBLISH
puddingswap	pud	PuddingSwap
pudgy-vault-nftx	pudgy	PUDGY Vault (NFTX)
puff	puff	PUFF
puglife	pugl	PugLife
puli-inu	puli	Puli
pulsar-coin	plsr	Pulsar Coin
pulseapecoin	$plsa	PulseApeCoin
pulsebitcoin	plsb	PulseBitcoin
pulsedoge	pulsedoge	PulseDoge
pulsedogecoin	plsd	PulseDogecoin
pulsefloki	plsf	PulseFloki
pulsepad	plspad	PulsePad
pulse-token	pulse	PulseMarkets
pumapay	pma	PumaPay
puml-better-health	puml	PUML Better Health
pumlx	pumlx	PUMLx
pumpopoly	pumpopoly	Pumpopoly
pumptopia	ptpa	Pumptopia
punchy-token	punch	Punchy Token
pundi-x	npxs	Pundi X [OLD]
pundi-x-2	pundix	Pundi X
pundi-x-nem	npxsxem	Pundi X NEM
pundi-x-purse	purse	Pundi X PURSE
punk-panda-messenger	ppm	Punk Panda Messenger
punks-comic	punks	PUNKS Comic
punks-comic-pow	pow	POW
punk-shiba	punks	Punk Shiba
punk-vault-nftx	punk	Punk Vault (NFTX)
pupazzi-punk-brise-of-sun	pps	Pupazzi Punk Brise Of Sun
pup-doge	pupdoge	Pup Doge
pupper	pup	Pupper
puppets-arts	puppets	Puppets Arts
purchasa	pca	Purchasa
purefi	ufi	PureFi
puregold-token	pgpay	PGPay
puriever	pure	Puriever
purpose	prps	Purpose
purr-vault-nftx	purr	PURR Vault (NFTX)
pusd	pusd	PUSD_Polyquity
pusd-2	pusd	PUSd
pussy-financial	pussy	Pussy Financial
pusuke-inu	pusuke	Pusuke Inu
putincoin	put	PUTinCoin
puzzle-and-dragons-x	padx	Puzzle And Dragons X
puzzle-swap	puzzle	Puzzle Swap
pw-gold	pwg	PW-GOLD
pye-2	pye	PYE
pylon-eco-token	petn	Pylon Eco Token
pylon-protocol	mine	Pylon Protocol
pyram-token	pyram	Pyram
pyrexcoin	gpyx	GoldenPyrex
pyrk	pyrk	Pyrk
pyromatic	pyro	PYROmatic
pyrrho-defi	pyo	Pyrrho
q2	q2	Pocketful of Quarters
qanplatform	qanx	QANplatform
qao	&#127760;	QAO
qash	qash	QASH
qatar	qatar	QAtar
qatargrow	qatargrow	QatarGrow
qatar-inu	qatar	Qatar Inu
qatar-inu-token	qatar	Qatar Inu Token
qawalla	qwla	Qawalla
qbao	qbt	Qbao
qchain-qdt	qdt	QChain QDT
q-dao-governance-token-v1-0	qdao	Q DAO Governance v1.0
qian-second-generation-dollar	qsd	QIAN Second Generation Dollar
qi-dao	qi	Qi Dao
qie	qie	QI Blockchain
qiswap	qi	QiSwap
qitchain-network	qtc	Qitcoin
qitmeer-network	meer	Qitmeer Network
qlindo	qlindo	QLINDO
qlink	qlc	Kepple
qmall	qmall	Qmall
qmcoin	qmc	QMCoin
qobit	qob	Qobit
qoda-finance	qodex	Qoda Finance
qoiniq	qiq	QoinIQ
qowatt	qwt	QoWatt
qqq-token	qqq	Poseidon Network
qqq-tokenized-stock-defichain	dqqq	Invesco QQQ Trust Defichain
qredit	xqr	Qredit
qredo	qrdo	Qredo
qrkita-token	qrt	Qrkita
qroni	qni	Qroni
qtoken	qto	Qtoken
qtum	qtum	Qtum
quack	quack	QUACK
quadency	quad	Quadency
quadrans	qdt	Quadrans
quadrant-protocol	equad	Quadrant Protocol
quai-dao	quai	Quai Dao
quai-network	quai	Quai Network
quannabu	qbu	Quannabu
quantfury	qtf	Quantfury
quantic	quantic	Quantic
quantis	quan	Quantis
quantland	qlt	Quantland
quant-network	qnt	Quant
quantstamp	qsp	Quantstamp
quantum-assets	qa	Quantum Assets
quantum-resistant-ledger	qrl	Quantum Resistant Ledger
quantum-tech	qua	Quantum Tech
quarashi	qua	Quarashi
quark	qrk	Quark
quark-chain	qkc	QuarkChain
quartz	qtz	Quartz
quasacoin	qua	Quasacoin
qube-2	qube	Qube
qubit	qbt	Qubit
quebecoin	qbc	Quebecoin
questra-finance	qfi	QUESTRA FINANCE
quick	quick	Quickswap [OLD]
quickchart	quickchart	QuickChart
quick-mining	qm	Quick Mining
quicksilver	qck	Quicksilver
quickswap	quick	Quickswap
quickx-protocol	qcx	QuickX Protocol
quidax	qdx	Quidax
quidd	quidd	Quidd
quid-ika	quid	Quid Ika
quinads	quin	QUINADS
quincoin	qin	QUINCOIN
quint	quint	Quint
quipuswap-governance-token	quipu	QuipuSwap Governance
quiverx	qrx	QuiverX
quizdrop	qdrop	QuizDrop
quiztok	qtcon	Quiztok
quo	quo	Quoll Finance
quontral	quon	Quontral
quorum	rum	Quorum
quoth	quoth	Quoth
quotient	xqn	Quotient
r34p	r34p	R34P
rabbit2023	rabbit	Rabbit2023
rabbit-finance	rabbit	Rabbit Finance
rabbit-halloween	rh31	Rabbit Halloween
rabbitswap	rabbit	RabbitSwap
rabity-finance	rbf	Rabity Finance
rabona	ra	Rabona
rac	rac	RAC
racefi	racefi	RaceFi
race-kingdom	atoz	Race Kingdom
racex	racex	RaceX
racing-club-fan-token	racing	Racing Club Fan Token
racoon	rac	Racøøn
rad	rad	RAD
radar	radar	Radar
radial-finance	rdl	Radial Finance
radiant	rxd	Radiant
radiant-capital	rdnt	Radiant Capital
radicle	rad	Radicle
radio-caca	raca	Radio Caca
radio-hero	raho	Radio Hero
radioreum	theradio	Radioreum
radioshack	radio	RadioShack
radium	val	Validity
radix	xrd	Radix
rae-token	rae	Receive Access Ecosystem
rafflet	raf	Rafflet
rage-fan	rage	Rage.Fan
raggiecoin	rag	RaggieCoin
rai	rai	Rai Reflex Index
raicoin	rai	Raicoin
raiden-network	rdn	Raiden Network
raider-aurum	aurum	Raider Aurum
raider-inu	raid	Raider Inu
raid-token	raid	Raid
rai-finance	sofi	RAI Finance
railgun	rail	Railgun
rainbowtoken	rainbowtoken	RainbowToken
rainbow-token	rnbw	HaloDAO
rainbow-token-2	rbw	Crypto Unicorns Rainbow
rainicorn	$raini	Raini
rainmaker-games	rain	Rainmaker Games
rainspirit	rainspirit	rainSPIRIT
rai-yvault	yvrai	RAI yVault
rake-finance	rak	Rake Finance
rally-2	rly	Rally
rally-solana	srly	Rally (Solana)
ramenswap	ramen	RamenSwap
ramestta	rama	Ramestta
ramifi	ram	Ramifi Protocol
ramp	ramp	RAMP [OLD]
ranbased	ranb	RANBASED
random	rndm	Random
rangers-fan-token	rft	Rangers Fan Token
rangers-protocol-gas	rpg	Rangers Protocol
rankerdao	ranker	RankerDao
ran-x-crypto	rxc	Ran x Crypto
rapids	rpd	Rapids
rapidz	rpzx	Rapidz
raptoreum	rtm	Raptoreum
raptor-finance-2	rptr	Raptor Finance
rare	rare	Rare
rare-ball-shares	rbp	Rare Ball Potion
rare-fnd	fnd	Rare FND
raresama	poop	Raresama
rarible	rari	Rarible
rari-governance-token	rgt	Rari Governance
rasko	rasko	rASKO
rasta-finance	rasta	Rasta Finance
ratboy-bsc	wentxn	RatBoy BSC
ratecoin	xra	Ratecoin
ratio-finance	ratio	Ratio Protocol
ratio-stable-coin	usdr	Ratio Stable Coin
ratscoin	rats	Ratscoin
ratscoin-team-dao	ratsdao	Ratscoin Team Dao
ravelin-finance	rav	Ravelin Finance
rave-names	rave	Rave Names
ravencoin	rvn	Ravencoin
ravencoin-classic	rvc	Ravencoin Classic
raven-dark	xrd	Raven Dark
ravendex	rave	Ravendex
ravenmoon	rvm	RavenMoon
raven-protocol	raven	Raven Protocol
rax	rax	RAX
raydium	ray	Raydium
ray-network	xray	Ray Network
rays	rays	RAYS
raze-network	raze	Raze Network
razor-network	razor	Razor Network
rbxsamurai	rbxs	RBXSamurai
rbx-token	rbx	RBX
rccc	rccc	RCCC
rc-celta-de-vigo-fan-token	cft	RC Celta de Vigo Fan Token
rcd-espanyol-fan-token	enft	RCD Espanyol Fan Token
rchain	rev	RChain
reach-dao	$read	Reach DAO
readfi	rdf	ReadFi
readon	read	ReadON
realfevr	fevr	RealFevr
realfinance-network	refi	Realfinance Network
realio-network	rio	Realio
realital-metaverse	reta	Realital Metaverse
reallink	real	RealLink
realliq	rlq	Realliq
realm	realm	Realm
realmoneyworld	rmw	RealMoneyWorld
realms-of-ethernity	reth	Realms of Ethernity
realms-of-ruby	ruby	Realms of Ruby
real-realm	real	Real Realm
real-sociedad-fan-token	rso	Real Sociedad Fan Token
realtract	ret	RealTract
real-usd	usdr	Real USD
realy-metaverse	real	Realy Metaverse
reapchain	reap	ReapChain
reaper-token	reaper	Reaper
rebase-aggregator-capital	$react	Rebase Aggregator Capital
rebel-bots	rbls	Rebel Bots
rebellion-dao	reb	Rebellion DAO
rebellion-protocol	rebl	Rebellion Protocol
rebeltradertoken	rtt	RebelTrader
rebit	keyt	Rebit
reborn	rb	REBorn
rebus	rebus	Rebus
recast1	r1	Recast1
recession-coin	econ	Recession Coin
recharge	rcg	Recharge
recharge-finance	r3fi	Recharge Finance
recovery-right-token	rrt	Recovery Right
recycle-x	rcx	Recycle-X
recycling-cyc	cyc	Recycling CYC
red	red	Red
redacted	btrfly	Redacted
redacted-money	red	Redacted Money
redancoin	redan	REDANCOIN
reddcoin	rdd	Reddcoin
red-falcon	rfn	Red Falcon
redfeg	redfeg	RedFeg
redfireants	rants	redFireAnts
redfox-labs-2	rfox	RFOX
redi	redi	REDi
red-kishu	redkishu	Red Kishu
redlight-chain	redlc	Redlight Chain
redlight-node-district	playmates	Redlight Node District
redmars	rmars	REDMARS
redpanda-earth-v2	redpanda	RedPanda Earth V2
red-pill	rpp	Red Pill
redpill-2	rpill	RedPill
red-pulse	phb	Phoenix Global [OLD]
redstone	redstone	RedStone
red-token	red	RED TOKEN
redux-protocol	rdx	Redux Protocol
reef	reef	Reef
refereum	rfr	Refereum
ref-finance	ref	Ref Finance
refi	refi	Reimagined Finance
refinable	fine	Refinable
reflect-finance	rfi	reflect.finance
reflecto	rto	Reflecto
reflecto-usd	rusd	Reflecto USD
reflex	rfx	Reflex
reflexer-ungovernance-token	flx	Reflexer Ungovernance
reflex-finance-v2	reflex	Reflex Finance V2
reforestation-mahogany	rmog	Reforestation Mahogany
reftoken	ref	Ref
refugees-token	$rfg	Refugees
regen	regen	Regen
regularpresale	regu	RegularPresale
rei-network	rei	REI Network
rektskulls	rekt	RektSkulls
relaxable	relax	Relaxable
relay-token	relay	Relay Chain
release-ico-project	rel	RELEASE
relevant	rel	Relevant
relic	relic	Relic
relictumpro-genesis-token	gtn	RelictumPro Genesis Token
relite-finance	reli	Relite Finance
reltime	rtc	Reltime
rematicegc	rmtx	RematicEGC
remex	rmx	RemeX
remi	remi	REMI
remme	rem	Remme
rena-finance	rena	RENA Finance
renbch	renbch	renBCH
renbtc	renbtc	renBTC
render-token	rndr	Render
rendoge	rendoge	renDOGE
renewable-energy	ret	Renewable Energy
renfil	renfil	renFIL
rens	rens	Rens
rentberry	berry	Rentberry
rentible	rnb	Rentible
renzec	renzec	renZEC
repo	repo	Repo Coin
represent	rpt	Represent
reptilian	rptc	Reptilian
republic-credits	rpc	Republic Credits
republic-protocol	ren	REN
request-network	req	Request
researchcoin	rsc	ResearchCoin
reserve	rsv	Reserve
reserve-rights-token	rsr	Reserve Rights
resfinex-token	res	Resfinex Token
resource-protocol	source	ReSource Protocol
restore-truth-token	rtt	Restore Truth
retawars-goldrose-token	grt	Retawars GoldRose Token
retawatch	rtw	RETAWATCH
reth	reth	rETH
reth2	reth2	rETH2
retire-token	retire	Retire
retrocade	rc	RetroCade
retromoon	retro	Retromoon
retsuko	suko	Retsuko
rev3al	rev3l	REV3AL
revain	rev	Revain
revault-network	reva	Revault Network
revenant	gamefi	Revenant
revenue-coin	rvc	Revenue Coin
reverse	rvrs	Reverse
revest-finance	rvst	Revest Finance
revival	rvl	REVIVAL
revivalx	rvlx	RevivalX
revoai	revoai	revoAI
revoland	revo	Revoland
revolotto	rvl	Revolotto
revolt	revt	Revolt
revolt-2-earn	rvlt	Revolt 2 Earn
revolutiongames	rvlng	RevolutionGames
revolution-populi	rvp	Revolution Populi
revoluzion	rvz	Revoluzion
revolve-games	rpg	Revolve Games
revomon	revo	Revomon
revuto	revu	Revuto
revv	revv	REVV
reward-cycle	rc	Reward Cycle
rewardeum	reum	Rewardeum
rewardiqa	rew	Rewardiqa
rewardscoin	rwsc	RewardsCoin
rewards-token	rewards	Rewards Token
re-water	wtr	re:water
rex-token	xrx	Rex
rhegic2	rhegic2	rHEGIC2
rhinofi	dvf	Rhino.fi
rhinos-finance	rho	Rhinos Finance
rho-token	rho	Rho
rhythm	rhythm	Rhythm
ribbit	ribt	Ribbit
ribbon-finance	rbn	Ribbon Finance
rice	rice	Rice
riceswap	rice	RiceSwap
rice-wallet	rice	Rice Wallet
rich	rch	Rich
richcity	rich	RichCity
richie	rich	Richie 2.0
richierich-coin	rich	RichieRich Coin
richochet	ric	Ricochet
richquack	quack	Rich Quack
rich-santa	santa	Rich Santa
richverse	riv	Richverse
rickmortydoxx	rickmortydoxx	RickMortyDoxx
ricnatum	rcnt	Ricnatum
ride_finance	rides	Rides Finance
ride-my-car	ride	Ride My Car
ridge	ridge	Ridge
ridotto	rdt	Ridotto
riecoin	ric	Riecoin
rifi-united	ru	RIFI United
rif-token	rif	RSK Infrastructure Framework
rigel-finance	rigel	Rigel Finance
rigel-protocol	rgp	Rigel Protocol
rigoblock	grg	RigoBlock
rijent-coin	rtc	Rijent Coin
rikkei-finance	rifi	Rikkei Finance
rimaunangis	rxt	RIMAUNANGIS
rin-finance-coin	rifico	Rin Finance Coin
ring	ring	Ring
ring-financial	ring	RING Financial
rio-defi	rfuel	RioDeFi
riot-racers	riot	Riot Racers
ripae	pae	Ripae
ripae-avax	pavax	Ripae AVAX
ripae-pbnb	pbnb	Ripae pBNB
ripae-pmatic	pmatic	Ripae pMATIC
ripio-coin	rpc	Ripio Coin
ripio-credit-network	rcn	Ripio Credit Network
ripple	xrp	XRP
ripple-alpha	xla	Ripple Alpha
rise	rise	Rise
risecoin	rsc	Risecoin
risehero	rise	RiseHero
rise-of-defenders	rdr	Rise of Defenders
rise-of-elves	roe	Rise of Elves
rise-of-empire	roemp	Rise Of Empire
rise-of-nebula	ron	Rise Of Nebula
riseupv2	riv2	RiseUpV2
risu	risu	Risu
risuchainswap	rcs	RisuChainSwap
ritestream	rite	ritestream
rito	rito	Rito
ri-token	ri	Xiotri RI
riverboat	rib	RiverBoat
rizespor-token	rize	Rizespor Token
rizon	atolo	RIZON
rloop	rloop	rLoop
rmrk	rmrk	RMRK
road	road	ROAD
roar-token	roar	SOL Tigers Roar
roarts	roar	RoArts
robinos	rbn	Robinos
robocock-ultra-world	gken	Robocock Ultra World
robodoge-coin	robodoge	RoboDoge Coin
robofi-token	vics	RoboFi
robo-inu-finance	rbif	Robo Inu Finance
robonomics-network	xrt	Robonomics Network
robonomics-web-services	rws	Robonomics Web Services
roboots	rbo	Roboots
robot	robot	Robot
robotina	rox	Robotina
robo-token	robo	Robo
robot-warriors	metabot	Robot Warriors
robust-token	rbt	Robust
rocket-bunny	bunny	Rocket Bunny
rocketbusd	rocketbusd	RocketBUSD
rocketcoin-2	rocket	RocketCoin
rocketdoge	rd	RocketDoge
rocketfi	rocketfi	RocketFi
rocket-global-coin	rckc	Rocket Global Coin
rocket-pool	rpl	Rocket Pool
rocket-pool-eth	reth	Rocket Pool ETH
rocket-raccoon	roc	Rocket Raccoon
rocket-raccoon-v2	roc	Rocket Raccoon V2
rocketverse	rkv	RocketVerse
rocketx	rvf	RocketX exchange
rocki	rocki	Rocki
rock-n-rain-coin	rnrc	Rock N Rain Coin
rocks-idle-game	rocks	Rocks Idle Game
rocky-inu	rocky	Rocky Inu
roco-finance	roco	Roco Finance
rodeo-coin	rodeo	Rodeo Coin
roge	roge	Rogue Doge
rogin-ai	rog	ROGin AI
rogue-coin	rogue	Rogue Coin
roima-inc	rmai	ROIMA INC
rolaz-gold	rgld	Rolaz Gold
rollbit-coin	rlb	Rollbit Coin
rollium	rlm	MarbleVerse
rome	rome	Rome
rond	rond	ROND
ronin	ron	Ronin
ronpaulcoin	rpc	RonPaulCoin
roobee	roobee	Roobee
rook	rook	Rook
rooster-battle	rice	Rooster Battle
root	root	Root
rootkit	root	Rootkit
rootstock	rbtc	Rootstock RSK
rope	$rope	Rope
rope-token	rope	Rope Token
ror-universe	ror	ROR Universe
rose	rose	Rose
roseon-finance	rosn	Roseon Finance
rotharium	rth	Rotharium
rotten	rot	Rotten
round-dollar	rd	Round Dollar
roundrobin-protocol-token	rrt	RoundRobin Protocol
round-x	rndx	Round X
roush-fenway-racing-fan-token	roush	Roush Fenway Racing Fan Token
route	route	Router Protocol
rover-inu	rover	Rover Inu
rovi-protocol	rovi	ROVI Protocol
rowan-coin	rwn	Rowan Coin
roxe	roc	Roxe
royale	roya	Royale
royal-gold	rgold	Royal Gold
royal-protocol	roy	Royal Protocol
royal-smart-future-token	rsft	ROYAL SMART FUTURE TOKEN
rps-league	rps	Rps League
rss3	rss3	RSS3
rubic	rbc	Rubic
rubidium	rbd	Rubidium
rubix	rbt	Rubix
rublix	rblx	Rublix
ruby	ruby	RUBY
ruby-currency	rbc	Ruby Currency
ruby-play-network	ruby	Ruby Play Network
ruff	ruff	Ruff
r-u-generous	rug	R U Generous
rugpull-prevention	rugpull	Rugpull Prevention
rug-radio	rug	RUG RADIO
rugzombie	zmbe	RugZombie
ruler-protocol	ruler	Ruler Protocol
run	run	Run
runblox	rux	RunBlox
run-burn	rbt	Run&Burn
runearner	runearn	RunEarner
rune-shards	rxs	Rune Shards
runner-land	rltv2	RLTv2
run-together	run	Run Together
rupee	rup	Rupee
rupiah-token	idrt	Rupiah Token
rusd	rusd	rUSD
rushcoin	rush	RushCoin
rutheneum	rth	Rutheneum
ruufcoin	ruuf	RuufCoin
ruyi	ruyi	Ruyi
rxcdnatoken	dna	RxcDna
rxcgames	rxcg	RXCGames
ryi-unity	ryiu	RYI Unity
ryo	ryo	Ryo Currency
ryoma	ryoma	Ryoma
ryoshis-vision	ryoshi	Ryoshis Vision
ryoshi-token	ryoshi	Ryoshi
s4fe	s4f	S4FE
sabaka-inu	sabaka inu	Sabaka Inu
saber	sbr	Saber
sacred-tails	st	Sacred Tails
sadbaby-2	sdby	Sadbaby
saddle-finance	sdl	Saddle Finance
safcoin	saf	SafCoin
safe	safe	Safe Token
safe-anwang	safe	SAFE(AnWang)
safe-baby-shiba	sbsh	Safe Baby Shiba
safebank	safebank	SafeBank
safebank-token	sbank	SafeBank BSC
safebitcoin	safebtc	SafeBitcoin
safeblast	blast	SafeBlast
safecapital	scap	SafeCapital
safechaintoken	sct	Safechain
safeclassic	safeclassic	SafeClassic
safe-coin-2	safe	SafeCoin
safecookie	safecookie	SafeCookie
safe-deal	sfd	SafeDeal
safedogecoin-v2	safedoge	SafeDogeCoin V2
safedollar	sdo	SafeDollar
safedollar-shares	sds	SafeDollar Shares
safe-earn	safearn	Safe Earn
safeearth	safeearth	SafeEarth
safegem	gems	Safegem
safehamsters	safehamsters	SafeHamsters
safe-haven	sha	Safe Haven
safeinsure	sins	SafeInsure
safelaunch	sfex	SafeLaunch
safelcarus	safeicarus	SafeIcarus
safemars	safemars	Safemars
safemars-protocol	smars	Safemars Protocol
safememe	sme	SafeMeme
safemoney	safemoney	SafeMoney
safemoneybsc	safemoney	SafeMoneyBSC
safemoon	safemoon	SafeMoon [OLD]
safemoon-1996	sm96	Safemoon 1996
safemoon-2	sfm	SafeMoon
safemoon-inu	smi	SafeMoon Inu
safemoon-swap	sfms	SafeMoon Swap
safemoon-zilla	sfz	Safemoon Zilla
safenami	safenami	SafeNami
safe-nebula	snb	Safe Nebula
safepal	sfp	SafePal
safepe	loox	SafePe
safeplus	$splusv2	SafePlus V2
safermoon	safermoon	SAFERMOON
safe-seafood-coin	ssf	Safe SeaFood Coin
safe-shield	sfshld	Safe Shield
safestar	safestar	Safestar
safesun	safesun	SafeSun
safeswap-online	swap	SafeSwap Online
safeswap-token	ssgtx	Safeswap SSGTX
safe-token	safe	Safe
safetrees	trees	Safetrees
safe-universe	sfu	Safe Universe
safewhale	swhal	SafeWhale
safewolf	sw	SafeWolf
safezone	safezone	SafeZone [OLD]
safezone-2	safezone	SafeZone
saffron-finance	sfi	saffron.finance
safle	safle	Safle
safuchain	safu	Safuchain
safufide	safest	SafuFide
safu-protocol	safu	SAFU Protocol
safutitano	safti	SafuTitano
safuu	safuu	SAFUU
saharadao	mng	SaharaDAO
sai	sai	Sai
saiko-the-revival	saiko	Saiko - The Revival
sail	sail	SAIL
saint-inu	saint	Saint Inu
saint-ligne	stle	Saint Ligne
saint-token	saint	Saint
saitama-inu	saitama	Saitama
saitamax	saitax	SaitamaX
saitanobi	saitanobi	Saitanobi
saitarealty	srlty	SaitaRealty
saito	saito	Saito
saitoki-inu	saitoki	Saitoki Inu
saiyan-inu	sayan	Saiyan Inu
sak3	sak3	SAKE
sakaryaspor	skry	Sakaryaspor
sake-token	sake	SakeSwap
sakhalin-husky	sahu	Sakhalin Husky
sakura	sku	Sakura
sakura-neko	neko	Sakura Neko
sakura-planet	sak	Sakura Planet
salary	slr	Salary
salary-mining	slrm	Salary Mining
salmon	slm	Salmon
salmonation	sui	Salmonation
salo-players	salo	Salo Players
salt	salt	SALT
saltmarble	sml	Saltmarble
salus	sls	SaluS
samecoin	same	Samecoin
samo-inu	sinu	Samo INU
samoyedcoin	samo	Samoyedcoin
samsunspor-fan-token	sam	Samsunspor Fan Token
samurai-legends	smg	Samurai Legends
samusky-token	samu	Samusky
sanctum	sanctum	Sanctum
sandclock	quartz	Sandclock
san-diego-coin	sand	San Diego Coin
sandwich-network	$sandwich	Sandwich Network
sangkara	misa	Sangkara
sanin-inu	sani	Sanin Inu
sanji-inu	sanji	Sanji Inu
sanliurfaspor-token	urfa	Sanliurfaspor Token
sanshu-inu	sanshu	Sanshu Inu
santaclaus	santa	Santaclaus
santa-coin-2	santa	Santa Coin
santa-floki-v2	hohoho	Santa Floki v2.0
santa-inu	saninu	Santa Inu
santiment-network-token	san	Santiment Network
santos-fc-fan-token	santos	Santos FC Fan Token
sao-paulo-fc-fan-token	spfc	Sao Paulo FC Fan Token
sapchain	sap	Sapchain
sapien	spn	Sapien
sappchat	app	SappChat
sapphire	sapp	Sapphire
sarabichain	sarabi	SarabiChain
saracens-fan-token	sarries	Saracens Fan Token
sarcophagus	sarco	Sarcophagus
sashimi	sashimi	Sashimi
satelstar	stsr	SatelStar
satisfinance	sat	SatisFinance
satopay	stop	SatoPay
sator	sao	Sator
satoshicity	city	SatoshiCity
satoshi-island	stc	Satoshi Island
satoshi-monsters	ssm	Satoshi Monsters
satoshiswap-2	swap	SatoshiSwap
satozhi	satoz	Satozhi
satt	satt	SaTT
saturna	sat	Saturna
saucerswap	sauce	SaucerSwap
saudi-shiba-inu	saudishib	SAUDI SHIBA INU
saunafinance-token	sauna	SaunaFinance
sav3	sav3	SAV3
savage	savg	SAVAGE
savanna	svn	Savanna
saveanimal	saveanimal	SaveAnimal
save-baby-doge	babydoge	Save Baby Doge
savebritney	sbrt	SaveBritney
savedroid	svd	Savedroid
saveplanetearth	spe	SavePlanetEarth
savetheworld	save	SaveTheWorld
savix	svx	Savix
sawa-crypto	sawa	SAWA Crypto
sax-token	sax	IdleStoneage SAX
saylor-moon	smoon	SaylorMoon
sbet	sbet	SBET
sbf-coin	sbfc	SBF Coin
sbtc	sbtc	sBTC
sbu-honey	bhny	SBU Honey
scalara-nft-index	nfti	Scalara NFT Index
scaleswap-token	sca	Scaleswap
scallop	sclp	Scallop
scalpingcoin	scalp	SCALPingcoin
scan-defi	scan	Scan DeFi
scarab-finance	scarab	Scarab Finance
scarcity	scx	Scarcity
scardust	scard	SCARDust
scarecrow	scare	ScareCrow
scarface-finance	scar	Scarface Finance
scarface-lion	sfl	ScarFace Lion
scary-bunny	sb	Scary Bunny
s-c-corinthians-fan-token	sccp	S.C. Corinthians Fan Token
schain-wallet	scha	Schain Wallet
schillingcoin	sch	Schilling-Coin
scholarship-coin	scho	Scholarship Coin
schrodinger	kitty dinger	Schrodinger
sci-coin	sci	SCI Coin
scientia	scie	Scientia
scientix	scix	Scientix
scifi-index	scifi	SCIFI Index
sc-internacional-fan-token	saci	SC Internacional Fan Token
scolcoin	scol	Scolcoin
sconex	sconex	SCOneX
scoobi-doge	scoobi	Scoobi Doge
scootercoin	scoot	ScooterCoin
scopecoin	xscp	ScopeCoin
scopuly-token	scop	Scopuly
scorai	scorai	scORAI
scorefam	sft	Scorefam
score-token	sco	Score
scotty-beam	scotty	Scotty Beam
scouthub	hub	Scouthub
scrap	scrap	Scrap
scratch	scratch	Scratch
scream	scream	Scream
scriv	scriv	SCRIV
scro	scroh	Scro
scroll-token	xd	Data Transaction XD
scrooge	scrooge	Scrooge
scrooge-junior	scrooge jr	SCROOGE JUNIOR
scry-info	ddd	Scry.info
scrypta	lyra	Scrypta
sculptor	sculpt	Sculptor
sdao	sdao	SDAO
sea	sea	Sea
seachain	seachain	SeaChain
seadog-metaverse	seadog	Seadog Metaverse
seahorsechain	seah	SeahorseChain
seamlessswap-token	seamless	SeamlessSwap
seancecircle	seance	SeanceCircle
seasy	seasy	SEASY
seatlabnft	seat	SeatlabNFT
seba	seba	Seba
sechain	snn	SeChain
secret	scrt	Secret
secret-erc20	wscrt	Secret (ERC20)
secret-finance	sefi	Secret Finance
secret-skellies-society	$crypt	Secret Skellies Society
secretsky-finance	ssf	SecretSky Finance
secretum	ser	Secretum
secretworld	ssd	SecretWorld
secure-cash	scsx	Secure Cash
secured-moonrat-token	smrat	Secured MoonRat
sedo-pow-token	sedo	SEDO POW
seed2need	silo	Seed2Need
seedbox	sbx	SeedBox
seeded-network	seeded	Seeded Network
seedify-fund	sfund	Seedify.fund
seedling	sdln	Seedling
seedon	seon	Seedon
seeds	seeds	Seeds
seedswap	snft	SeedSwap
seedswap-token	seed	SeedSwap SEED
seed-venture	seed	Seed Venture
seek-tiger	sti	Seek Tiger
seele	seele	Seele
seen	seen	SEEN
seesaw	ssw	Seesaw
seigniorage-shares	share	Seigniorage Shares
seiren-games-network	serg	Seiren Games Network
sektor-token	sektor	Sektor Token
sekuritance	skrt	Sekuritance
sekuya	skuy	Sekuya
selfbar	sbar	Selfbar
selfkey	key	SelfKey
semicon1	smc1	semicon1
senate	senate	SENATE
sendcrypto	sendc	SendCrypto
sense	sense	Sense
sense4fit	sfit	Sense4FIT
sensei	sensei	Sensei
sensi	sensi	Sensi
sensitrust	sets	Sensitrust
senso	senso	SENSO
senspark	sen	Senspark
sentiment-token	sent	Sentiment
sentinel	dvpn	Sentinel
sentinel-chain	senc	Sentinel Chain
sentinel-group	dvpn	Sentinel [OLD]
sentinel-protocol	upp	Sentinel Protocol
sentivate	sntvt	Sentivate
sentre	sntr	Sentre
seor-network	seor	SEOR Network
septillion	spt	Septillion
serenity	seren	Serenity
serenity-financial	srnt	Serenity Financial
serey-coin	sry	Serey Coin
serum	srm	Serum
serum-ser	ser	Serum SER
serum-wormhole-from-ethereum	srmet	Serum (Wormhole from Ethereum)
sescrt	sescrt	StakeEasy Secret Derivative Token
seth	seth	sETH
seth2	seth2	sETH2
sether	seth	Sether
setter-protocol	set	Setter Protocol
seur	seur	sEUR
severe-rise-games	srgt	Severe Rise Games
sewer-rat-social-club-chiz-token	chiz	Sewer Rat Social Club CHIZ Token
sexcoin	sxc	Sexcoin
sf-capital	sfcp	SF Capital
s-finance	sfg	S.Finance
sgd-tracker	blusgd	SGD Tracker
shabu-shabu	kobe	Shabu Shabu
shack	shack	Shack
shade-cash	shade	Shade Cash
shade-protocol	shd	Shade Protocol
shadows	dows	Shadows
shadow-token	shdw	Shadow
shaggy-token	shag	SHAGGY TOKEN
shakita-inu	shak	Shakita Inu
shaman	shaman	Shaman
shaman-king-inu	shaman	Shaman King Inu [OLD]
shambala	bala	Shambala
shanum	shan	Shanum
shapeshift-fox-token	fox	ShapeShift FOX
shard	shard	Shard Coin
shard-2	shard	Shard
shardeum	shm	Shardeum
shardus	ult	Shardus
sharedstake-governance-token	sgtv2	SharedStake Governance v2
sharering	shr	Share
shark	shark	Shark
shazu	shazu	Shazu
shd-cash	shdc	SHD Cash
shebolleth-commerce	sbecom	SheBollETH Commerce
sheepasheep	ylgy	SheepAsheep
sheeptoken	sheep	Sheep
sheesh	sheesh	Sheesh
sheesha-finance	sheesha	Sheesha Finance (BEP20)
sheesha-finance-erc20	sheesha	Sheesha Finance (ERC20)
sheesha-finance-polygon	msheesha	Sheesha Finance Polygon
sheikh-inu	shinu	Sheikh Inu
shelby-token	sby	Shelby
shelling	shl	Shelling
shell-token	shell	Shell
shen	shen	Shen
shengweihu	shengweihu	Shengweihu
shepherd-inu	sinu	Shepherd Inu
shera	shr	shera [OLD]
shera-2	shr	Shera
sherlock	sher	Sherlock
shiba-bsc	shibsc	SHIBA BSC
shibacash	shibacash	ShibaCash
shiba-classic	shibc	Shiba Classic
shibacorgi	shico	ShibaCorgi
shibadoge	shibdoge	ShibaDoge
shiba-dollars	shibadollars	Shiba Dollars
shiba-elon	eshib	Shiba Elon
shibaelonverse	shibev	ShibaElonVerse
shiba-evil	sbe	Shiba Evil
shiba-fantom	shiba	Shiba Fantom
shiba-floki	floki	Shiba Floki Inu
shibaforest	shf	ShibaForest
shibagalaxy	shibgx	ShibaGalaxy
shibagun	shibgun	Shibagun
shibai-labs	slab	ShibAI Labs
shiba-inu	shib	Shiba Inu
shiba-inu-classic	shibic	SHIBIC
shiba-inu-empire	shibemp	Shiba Inu Empire
shiba-inu-mother	shibm	Shiba Inu Mother
shiba-inu-wormhole	shib	Shiba Inu (Wormhole)
shibaken-finance	shibaken	Shibaken Finance
shibalana	shiba	Shibalana
shiba-light	shibt	Shiba Light
shibalite	shiblite	ShibaLite
shibamon	shibamon	Shibamon
shibana	bana	Shibana
shibanft	shibanft	ShibaNFT
shiba-nodes	shino	Shiba Nodes
shiba-predator	qom	Shiba Predator
shiba-punkz	spunk	Shiba Punkz
shibapup	shibapup	ShibaPup
shibarium-dao	shibdao	Shibarium DAO
shib-army	shibarmy	Shib Army
shibatsuka	stsuka	ShibaTsuka
shiba-universe	shibu	Shiba Universe
shibavax	shibx	Shibavax
shibaverse	verse	Shibaverse
shibaverse-token	shiver	Shibaverse SHIVER
shiba-watch	shibaw	Shiba Watch
shibaw-inu	shibaw	ShibaW Inu
shiba-world-cup	swc	Shiba World Cup
shib-cake	shibcake	SHIB CAKE
shibchain	sc	ShibChain
shibcraft	shft	Shibcraft
shibdoge-sc	shibdoge	ShibDoge SC
shibelon	shibelon	ShibElon
shibgeki	shibgeki	Shibgeki
shib-generating	shg	Shib Generating
shibgf	shibgf	SHIBGF
shibgotchi	shibgotchi	SHiBGOTCHi
shibird	shird	Shibird
shibkiller	shibkiller	ShibKiller
shibmerican	shibmerican	Shibmerican
shibmoon-sc	shibm	ShibMoon SC
shibnaut	shibn	Shibnaut
shibnobi	shinja	Shibnobi
shiboki-2	shiboki	Shiboki
shibonk	shibo	ShibonkBSC
shibonk-311f81df-a4ea-4f31-9e61-df0af8211bd7	sbonk	SHIBONK
shibosu-a4432072-cdc3-4f03-b781-46937463ea98	shibo	Shibosu
shibqueen	shibqueen	ShibQueen
shibrobi	shiborg	ShibRobi
shibrwd	srwd	ShibRWD
shibtama	shibtama	Shibtama
shibui-dao	shibui	Shibui DAO
shibu-life	shibu	Shibu Life
shibuya-white-rabbit	wrab	Shibuya White Rabbit
shibvinci	shiv	ShibVinci
shiden	sdn	Shiden Network
shido	shido	Shido
shield	xsh	SHIELD
shield-bsc-token	shdb	Shield BSC Token
shield-dao	sld	Shield (SLD)
shield-finance	coli	Coliquidity
shield-network	shieldnet	Shield Network
shield-protocol-2	shield	Shield Protocol
shih-tzu	shih	Shih Tzu
shihtzu-exchange	stzu	Shihtzu Exchange
shih-tzu-inu	shih-tzu	Shih Tzu Inu
shika-finance	shika	Shika Finance
shikoku	shik	Shikoku
shikoku-inu	shiko	Shikoku Inu
shila-inu	shil	Shila Inu
shilling	sh	Shilling
shill-token	shill	SHILL Token
shilly-bar	shbar	Shilly Bar
shimmer	smr	Shimmer
shina-inu	shi	Shina Inu
shinchan-token	shinnosuke	ShinChan
shinedao	shn	ShineDAO
shinemine	shine	ShineMine
shinji-inu	shinji	Shinji Inu
shinjiro	shox	Shinjiro
shinjiru-inu	shinji	Shinjiru Inu
shinshu-inu	shinshu	Shinshu Inu
shintama	shintama	Shintama
shinuri	shinuri	Shinuri
shipchain	ship	ShipChain
shipitpro	shpp	ShipItPro
shiplay	sply	ShiPlay
shirainu	shr	ShiraINU
shirtum	shi	Shirtum
shiryo-inu	shiryo-inu	Shiryo
shita-kiri-suzume	suzume	Shita-kiri Suzume
shitcoin	shit	ShitCoin
shitzu	shitzu	Shitzu
shiwa	shiwa	Shiwa
shkooby-inu	shkooby	SHKOOBY INU
shoebill-coin	shbl	Shoebill Coin
shoefy	shoe	ShoeFy
shontoken	shon	Shon
shoot	shoo	SHOOT
shopayment	spay	Shopayment
shopdi	shod	Shopdi
shopnext	next	ShopNEXT [OLD]
shopnext-loyalty-token	next	ShopNext Loyalty Token
shopnext-reward-token	ste	ShopNEXT Reward Token
shopping-io	spi	Shopping.io OLD
shopping-io-token	shop	Shopping.io
shorty	shorty	Shorty
showcase-token	sho	Showcase
showhand	hand	ShowHand
showtime-potocol	stp	ShowTime Potocol
shping	shping	Shping
shree	shr	SHREE
shroom-finance	shroom	Niftyx Protocol
shrooms	shrm	Shrooms
shuey-rhon-inu	shuey	Shuey Rhon Inu
shuffle-by-hupayx	sfl	SHUFFLE by HUPAYX
shumi	shumi	SHUMI
shuna-inuverse	shunav2	Shuna Inuverse
shuts-wave	swave	shuts Wave
shyft-network-2	shft	Shyft Network
siacashcoin	scc	SiaCashCoin
siacoin	sc	Siacoin
siambitcoin	sbtc	SiamBitcoin
siaprime-coin	scp	ScPrime
sibcoin	sib	SIBCoin
siberian-husky	shusky	Siberian Husky
sicash	sic	SICash
siddcoin	sidd	Siddcoin
sidekick-token	sk	SideKick
sideshift-token	xai	SideShift
sidus	sidus	Sidus
sienna	sienna	Sienna
sienna-erc20	wsienna	Sienna [ERC-20]
sif	sif	Sif
sifchain	erowan	Sifchain
sifu-vision	sifu	SIFU
sign	sign	Sign
signal	sgnl	Signal
signal-token	sig	Signal SIG
signata	sata	Signata
signaturechain	sign	SignatureChain
signed	sign	Signed
signum	signa	Signum
sikka	sikka	SIKKA
silent-notary	ubsn	Silent Notary
sil-finance	sil	SIL Finance V2
silk	silk	Spider Tanks
silo-finance	silo	Silo Finance
silva-token	silva	Silva
silvercashs	svc	Silvercashs
silverstonks	sstx	Silver Stonks
silver-tokenized-stock-defichain	dslv	iShares Silver Trust Defichain
simba-empire	sim	Simba Empire
simba-inu	simbainu	Simba Inu
simba-storage-token	sst	SIMBA Storage
simba-token	simba	Simba
simbcoin-swap	smbswap	SimbCoin Swap
simple-masternode-coin	smnc	Simple Masternode Coin
simple-token	ost	OST
simpli-finance	simpli	Simpli Finance
simply	simply	Simply
simp-token	simp	Simp
simracer-coin	src	Simracer Coin
sincere-cate	$scate	Sincere Cate
sincere-doge	sdoge	Sincere Doge
sinceredogedao	sdao	SincereDogeDAO
sin-city	sin	Sinverse
sinfinite	sfn	Sinfinite
singh	singh	Singh
single-earth	merit	Single Earth
single-finance	single	Single Finance
sing-token	sing	Sing
sing-token-avalanche	sing	Sing (Avalanche)
sing-token-bsc	sing	Sing (BSC)
sing-token-ftm	sing	Sing FTM
singulardtv	sngls	SingularDTV
singularity	sgly	Singularity
singularitydao	sdao	SingularityDAO
singularitynet	agix	SingularityNET
sint-truidense-voetbalvereniging-fan-token	stv	Sint-Truidense Voetbalvereniging Fan Token
sipher	sipher	Sipher
siren	si	Siren
sirin-labs-token	srn	Sirin Labs
sirius-finance	srs	Sirius Finance
sishi-finance	sishi	Sishi Finance
siuuu	siu	Siuuu
sivasspor	siv	Sivasspor
six-network	six	SIX Network
sjwcoin	sjw	SJWCoin
skale	skl	SKALE
skate-metaverse-coin	smc	Skate Metaverse Coin
skeb	skeb	Skeb
skey-network	skey	Skey Network
skillchain	ski	Skillchain
skinchain	skc	SKINCHAIN
skincoin	skin	SkinCoin
sklay	sklay	sKLAY
skraps	skrp	Skraps
skrumble-network	skm	Skrumble Network
skull	skull	Skull
sky-bandit-coin	sbc	Sky Bandit Coin
skycoin	sky	Skycoin
skyplay	skp	SKYPlay
skyrim-finance	skyrim	Skyrim Finance
skyup	su	skyup
sky-v2	sky	SkyToken
skyward-finance	skyward	Skyward Finance
slam-token	slam	Slam
slay-to-earn	slay2earn	Slay To Earn
sleepearn-finance	sen	SleepEarn Finance
sleepfuture	sleepee	SleepFuture
sleepy-shib	sleepy-shib	Sleepy-Shib
sleepy-sloth	sleepy	Sleepy Sloth Finance
slimcoin	slm	Slimcoin
slime-royale-cupid-essence	sce	Slime Royale Cupid Essence
slime-royale-gold	srg	Slime Royale Gold
slnv2	slnv2	SLNV2
slothcoin	sloth	SlothCoin
small-doge	sdog	Small Doge
small-fish-cookie	sfc	Small Fish Cookie
smart-block-chain-city	sbcc	Smart Block Chain City
smartcash	smart	SmartCash
smartcoin-2	smrt	SmartCoin
smart-coin-smrtr	smrtr	SmarterCoin
smartcredit-token	smartcredit	SmartCredit
smart-donation-coin	sdc	Smart Donation Coin
smart-electrum	select	Smart Electrum
smartfi	smtf	SmartFi
smartlands	dnt	Definder Network
smartlink	smak	Smartlink
smartlox	smartlox	SmartLOX
smart-marketing-token	smt	Smart Marketing
smart-medical-coin	smc	Smart Medical Coin
smartmesh	smt	SmartMesh
smart-mfg	mfg	Smart MFG
smart-money-coin	smc	Smart Money Coin
smartnft	smartnft	SmartNFT
smartofgiving	aog	smARTOFGIVING
smartpad-2	pad	SmartPad
smart-reward-token	srt	Smart Reward Token
smartshare	ssp	Smartshare
smart-shiba	smartshib	Smart Shiba
smart-token	smart	Smart
smart-valor	valor	Smart Valor
smart-wallet-token	swt	Smart Wallet
smart-world-union	swu	Smart World Union
smarty-pay	spy	Smarty Pay
smash-cash	smash	Smash Cash
smaugs-nft	smg	Smaugs NFT
smd-coin	smd	SMD Coin
smegmars	smgm	SMEGMARS
smelt	smelt	Smelt
smg	smg	SMG
smile-coin	smile	Smile Coin
smileycoin	smly	Smileycoin
smolting-inu	smol	Smolting Inu
smooth-love-potion	slp	Smooth Love Potion
smoothy	smty	Smoothy
smpcoin	smpc	SMPCOIN
smscodes	smsct	SMSCodes
smurfsinu	smurf	SmurfsINU
snail-trail	slime	Snail Trail
snake-city	snct	Snake City
snake-token	snk	CryptoSnake
snapex	snap	SnapEx
snapy	spy	Snapy
snetwork	snet	Snetwork
snfts-seedify-nft-space	snfts	Seedify NFT Space
snkrz	skz	SNKRZ
snook	snk	Snook
snoshares	snoshare	Snoshares
snovio	snov	Snovian.Space
snow	icz	Snow
snowballtoken	snowball	Snowball Token
snowball-token	snob	Snowball
snowbank	sb	Snowbank
snowblossom	snow	SnowBlossom
snowcrash-token	nora	SnowCrash
snowdog	sdog	Snowdog
snowflake	$snow	Snowflake
snowswap	snow	Snowswap
snowtomb	stomb	Snowtomb
snowtomb-lot	slot	Snowtomb LOT
snx-yvault	yvsnx	SNX yVault
soakmont	skmt	Soakmont
soba-token	soba	SOBA
so-cal	sct	So Cal
socaverse	soca	Socaverse
soccer-crypto	sot	Soccer Crypto
soccer-galaxy	sog	Soccer Galaxy
soccerhub	sch	SoccerHub
soccerinu	soccer	SoccerInu
soccers-dog	sd	Soccers Dog
socean-staked-sol	scnsol	Socean Staked Sol
socialblox	sblx	SocialBlox
social-capitalism-2	socap	Social Capitalism
social-good-project	sg	SocialGood
sociall	scl	Sociall
social-send	send	Social Send
socialswap-token	sst	Social Swap
socialx-2	sosx	SocialX
socialxclub	sxc	SocialxClub
socilink	soc	SociLink
socol	simp	SO-COL
soda-coin	soc	SODA Coin
sodatsu	sodatsu	Sodatsu
soft-dao	soft	Soft DAO
soga-project	soga	SOGA Project
sokuswap	soku	SokuSwap
solabrador	solab	Solabrador
solace	solace	SOLACE
solace-coin	solace	Solace Coin
solalambo	sob	SolaLambo
solana	sol	Solana
solana-ecosystem-index	soli	Solana Ecosystem Index
solana-inu	inu	Solana Inu
solana-nut	solnut	Solana Nut
solana-paws	paws	Solana Paws
solanaprime	prime	SolanaPrime
solanasail-governance-token	gsail	SolanaSail Governance
solanax	sold	Solanax
sola-ninja	snj	Sola Ninja
solanium	slim	Solanium
solanyx	syx	Solanyx
solape-token	solape	SOLAPE
solar	solar	Solar
solarbeam	solar	Solarbeam
solar-bear	solbear	Solar Bear
solar-energy	seg	Solar Energy
solareum-wallet	xsb	Solareum Wallet
solarflare	flare	Solarflare
solar-full-cycle	sfc	Solar Full Cycle
solaris-betting-token	sbt	Solaris Betting Token
solaris-finance	slr	Solaris Finance
solarix	solarix	SOLARIX
solarminex	smx	SolarMineX
solarmoon	solar	Solarmoon
solarr	slrr	Solarr
sola-token	sola	SOLA
sola-x	sax	SOLA-X
sol-baby-doge	sbabydoge	SOL Baby Doge
solbank-token	sbnk	Solbank
solberg	slb	Solberg
solberry	solberry	SolBerry
solbit	sbt	SOLBIT
solcash	solcash	SOLCash
solcats	meow	Solcats
solchicks-shards	shards	SolChicks Shards
solchicks-token	chicks	SolChicks
solcial	slcl	Solcial
solclout	sct	SolClout
solcondoms	condoms	SolCondoms
solcubator	solc	Solcubator
soldate-token	date	SolDate
solderland	sldr	Solderland
soldex	solx	Soldex
soldiernodes	sld	SoldierNodes
soldo	sld	Soldo
soldoge	sdoge	SolDoge
solend	slnd	Solend
solex-finance	slx	Solex Finance
solfarm	tulip	Tulip Protocol
solfina	solfi	Solfina
solfire-finance	fire	Solfire Finance
sol-flowers	flwr	SOL Flowers
solge	solge	Solge
solice	slc	Solice
solideth	solideth	SolidETH
solidex	sex	Solidex
solidly	solid	Solidly v1
solidlydex	solid	Solidly
solid-protocol	solid	Solid Protocol
solidsex-tokenized-vesolid	solidsex	SOLIDsex: Tokenized veSOLID
solily-protocol	lily	Solily Protocol
solit	slt	Solit
sollama-utilities	sollama	Sollama Utilities
solminter	smrt	Solminter
solo-coin	solo	Sologenic
solomon-defi	slm	Solomon Defi
solootbox-dao	box	Solootbox DAO
solo-vault-nftx	solo	SOLO Vault (NFTX)
soloxcoin	sl	SoloxCoin
solpad-finance	solpad	Solpad Finance
solpatrol-bail	bail	SolPatrol Bail
solpay-finance	solpay	SolPay Finance
solrazr	solr	SolRazr
solrise-finance	slrs	Solrise Finance
solster	str	Solster
soltato-fries	fries	Soltato FRIES
solum	solum	Solum
soluna	slna	Soluna
solust	solust	solUST
solve-care	solve	SOLVE
solvent	svt	Solvent
solvia	sva	Solvia
solview	solv	Solview
solv-protocol	solv	Solv Protocol
sol-wormhole	sol	SOL (Wormhole)
solx-gaming-guild	sgg	SolX Gaming Guild
solyard-finance	yard	Solyard Finance
sombra-network	smbr	Sombra
somdej	sdc	Somdej
somee-advertising-token	sat	SoMee Advertising
somee-social	somee	SoMee.Social
somee-social-old	ong	SoMee.Social [OLD]
somesing	ssx	SOMESING Exchange
sommelier	somm	Sommelier
somnium	som	Somnium
spool-dao-token	spool	Spool DAO
somnium-space-cubes	cube	Somnium Space CUBEs
sonar	ping	Sonar
sonarwatch	sonar	SonarWatch
songbird	sgb	Songbird
songcoin	song	SongCoin
sonic-suite	sonic	Sonic Suite
sonm	snm	SONM
sonne-finance	sonne	Sonne Finance
sonocoin	sono	SonoCoin
son-of-doge-v2	sod	Son of Doge
soonaverse	soon	Soonaverse
sopay	sop	SoPay
sora	xor	Sora
sorachancoin	sora	SorachanCoin
sora-synthetics	xst	SORA Synthetics
sora-synthetic-usd	xstusd	SORA Synthetic USD
sora-validator-token	val	Sora Validator
sos-foundation	sos	SOS Foundation
sota-finance	sota	SOTA Finance
soul-dog-city-bones	bones	Soul Dogs City Bones
soulocoin	soulo	SouloCoin
soulsaver	soul	Soulsaver
souls-of-meta	som	Souls of Meta
soul-swap	soul	Soul Swap
sound-coin	sound	Sound Coin
souni-token	son	Souni
soup-finance	soup	Soup Finance
sourceless	str	Sourceless
source-protocol	srcx	Source Protocol
southxchange-coin	sxcc	SouthXchange Coin
sov	sov	SOV
sovi-token	sovi	Sovi
sovryn	sov	Sovryn
sowl	sowl	SOWL
soy-finance	soy	Soy Finance
spacechain-erc-20	spc	SpaceChain (ERC-20)
spacecoin	space	Spacecoin
spacecorgi	scorgi	SpaceCorgi
space-corsair-key	sck	Space Corsair Key
spacecowboy	scb	SpaceCowBoy
space-crypto	spg	Space Crypto
spacedawgs	dawgs	SpaceDawgs
spacefalcon	fcon	SpaceFalcon
spacegoat-token	sgt	SpaceGoat
spacegrime	grimex	SpaceGrime
space-hamster	hams	Space Hamster
space-iz	spiz	SPACE-iZ
spacelens	space	Spacelens
space-link	splink	Space Link
spacemine	mine	SpaceMine
space-misfits	smcw	Space Misfits
space-monkey-token	monke	Space Monkey MONKE
spacen	sn	SpaceN
space-ore	spo	Space Ore
spacepi	spacepi	SpacePi
spacerat	srat	SpaceRat
space-rebase	space	Space Rebase
space-rebase-xusd	xusd	Space Rebase XUSD
spacerobotdao	srd	SpaceRobotDao
spaceshipx	xship	XSHIP
spaceshipx-ssx	ssx	SpaceShipX SSX
space-sip	sip	Space SIP
space-soldier	soldier	Space Soldier
spaceswap-milk2	milk2	Spaceswap MILK2
spaceswap-shake	shake	Spaceswap SHAKE
spacetoast	spacetoast	SpaceToast
space-token	space	ApeRocket Space
space-token-bsc	space	Space Token BSC
spacevikings	svt	SpaceVikings
spacexlife	safe	SpaceXliFe
space-xmitter	sx	Space Xmitter
spacey-2025	spay	SpaceY 2025
spain-national-fan-token	snft	Spain National Football Team Fan Token
spankchain	spank	SpankChain
sparklab	spark	SparkLab
sparkle-coin	sctk	Sparkle Coin
sparkpoint	srk	SparkPoint
sparkpoint-fuel	sfuel	SparkPoint Fuel
sparks	spk	SparksPay
sparq	sparq	Sparq
spartacats	purr	Spartacats
spartacus	spa	Spartacus
spartacus-money	lambda	Spartacus Money
spartan	300	Spartan
spartancoin	spn	SpartanCoin
spartan-protocol-token	sparta	Spartan Protocol
spartan-token	spa	Spartans
spdr-s-p-500-etf-trust-defichain	dspy	SPDR S&P 500 ETF Trust Defichain
spectra	spc	Spectra
spectrecoin	alias	Alias
spectresecuritycoin	xspc	SpectreSecurityCoin
spectrum	spt	SPECTRUM
spectrum-finance	$spf	Spectrum Finance
spectrum-token	spec	Spectrum Protocol
speedcash	scs	Speedcash
speed-mining-service	sms	Speed Mining Service
speed-star-joc	joc	Speed Star JOC
speed-star-speed	speed	Speed Star SPEED
speed-star-star	star	Speed Star STAR
spellfire	spellfire	Spellfire
spell-token	spell	Spell
sperax	spa	Sperax
sperax-usd	usds	Sperax USD
sphere	sphr	Sphere
sphere-finance	sphere	Sphere Finance
sphere-social	sat	Social Activity
spheresxs	sxs	SphereSXS
spherium	sphri	Spherium
spheroid-universe	sph	Spheroid Universe
sphinxel	spx	Sphinxel
sphynx	sphynx	Sphynx
sphynxfi	sf	SphynxFi
sphynx-labs	sphynx	Sphynx Labs
spice	spice	Spice Token
spice-dao	spice	Spice DAO
spiceeuro	euros	SpiceEURO
spice-trade	spice	Spice Trade
spiceusd	usds	SpiceUSD
spiderdao	spdr	SpiderDAO
spillways	spillways	Spillways
spinada-cash	spin	Spinada Cash
spindle	spd	SPINDLE
spintop	spin	Spintop
spiral	spr	Spiral
spiritdao-ghost	ghost	SpiritDAO Ghost
spiritswap	spirit	SpiritSwap
spitz-chain	spc	Spitz Chain
splinterlands	sps	Splintershards
splyt	shopx	SHOPX
spookeletons-token	spkl	Spookeletons
spookyhalloweenfloki	shf	SpookyHalloweenFloki
spookyshiba-2	spky	SpookyShiba
spookyswap	boo	Spookyswap
spooky-uni	spku	Spooky Uni
spore	spore	Spore
spores-network	spo	Spores Network
sporkdao	spork	SporkDAO
sport	sport	SPORT
sport-and-leisure	snl	Sport and Leisure
sportium	sprt	Sportium
sportoken	spt	Sportoken
sports-2k75	s2k	Sports 2K75
sports-bet	sbet	Sports Bet
sportsicon	$icons	SportsIcon
sportsverse	sv	Sportsverse
sporty	sporty	Sporty
sportzchain	spn	Sportzchain
spot	spot	Spot
spotrax	spox	Spotrax
spots	spt	Spots
spring	spring	Spring
sprink	sprink	Sprink
sprint-coin	sprx	Sprint Coin
spritzmoon-crypto	spritzmoon	SpritzMoon Crypto Token
sprouts	sprts	Sprouts
sproutsextreme	spex	SproutsExtreme
spume	spume	Spume
spunk-vault-nftx	spunk	SPUNK Vault (NFTX)
sqgl-vault-nftx	sqgl	SQGL Vault (NFTX)
squad	squad	Superpower Squad
square-token	squa	Square
squawk	squawk	Squawk [OLD]
squawk-2	squawk	Squawk
squeeze-token	squeeze	Squeeze
squid-game	squid	Squid Game
squidgrow	squidgrow	SquidGrow
squid-moon	sqm	Squid Moon
squirrel-finance	nuts	Squirrel Finance
squirt-game	squirt	Squirt Game
squishiverse	slime	SquishiVerse
srnartgallery	sact	srnArtGallery
srnartgallery-tokenized-arts	sista	srnArtGallery Tokenized Arts
srune	srune	sRUNE
ssv-network	ssv	SSV Network
stabilize	stbz	Stabilize
stabilize-bsc	stbb	Stabilize BSC
stabilize-token	set	Stabilize SET
stabilize-usd	susd	Stabilize USD
stable-asset	sta	STABLE ASSET
stabledoc-token	sdt	Stabledoc
stablefund-usd	sfusd	StableFund USD
stable-one-rocket	srocket	Stable One Rocket
stableusd	usds	Stably USDS
stablexswap	stax	StableXSwap
stabl-fi	cash	Stabl.fi
stacker-ventures	stack	Stacker Ventures
stackos	stack	StackOS
stacktical	dsla	DSLA Protocol
stacy	stacy	Stacy
stade-francais-paris-fan-token	sfp	Stade Français Paris Fan Token
stader	sd	Stader
stader-bnbx	bnbx	Stader BNBx
stader-lunax	lunax	Stader LunaX
stader-maticx	maticx	Stader MaticX
stader-nearx	nearx	Stader NearX
stader-sftmx	sftmx	Stader sFTMX
stadium	std	Stadium
stadium-pepe	spep	Stadium Pepe
stafi	fis	Stafi
stakeborg-dao	standard	Stakeborg DAO
stakecube	scc	Stakecube
staked-aave-balancer-pool-token	stkabpt	Staked Aave Balancer Pool Token
stake-dao	sdt	Stake DAO
stake-dao-crv	sdcrv	Stake DAO CRV
staked-celo	stcelo	Staked Celo
staked-ether	steth	Lido Staked Ether
staked-frax-ether	sfrxeth	Staked Frax Ether
staked-icx	sicx	Staked ICX
staked-kcs	skcs	Staked KCS
staked-near	stnear	Staked NEAR
staked-tarot	xtarot	Staked TAROT
stakedthorus	stho	Staked Thorus
staked-wemix	stwemix	Staked WEMIX
staked-yearn-crv-vault	st-ycrv	Staked Yearn CRV Vault
stakeeasy-bjuno	bjuno	StakeEasy bJuno
stakeeasy-juno-derivative	sejuno	StakeEasy Juno Derivative
stake-goblin	goblin	Stake Goblin
stake-link	sdl	stake.link
stakemoon	smoon	Stakemoon
staker	str	Staker
staker-dao	stkr	Staker DAO
stakewise	swise	StakeWise
stakewise-reward-gno	rgno	StakeWise Reward GNO
stamen-tellus-token	stt	Stamen Tellus Token
standard-euro	seuro	Standard Euro
standard-protocol	stnd	Standard Protocol
standard-token	tst	The Standard Token
stand-cash	sac	Stand Cash
stand-share	sas	Stand Share
star-atlas	atlas	Star Atlas
star-atlas-dao	polis	Star Atlas DAO
starbase	star	Starbase
starbaseuniverse	suni	StarbaseUniverse
starbots	bot	Starbots
starbots-gear	gear	Starbots GEAR
starchain	stc	StarChain
star-chain	star	Star Chain
starchi	elixir	Starchi
starcoin	stc	Starcoin
starfish-finance	sean	Starfish Finance
starfish-os	sfo	StarFish OS
starfish-os-igt	igt	Starfish OS IGT
stargate-finance	stg	Stargate Finance
stargaze	stars	Stargaze
starkmeta	smeta	StarkMeta
starlaunch	stars	StarLaunch
starlay-finance	lay	Starlay Finance
starlink	starl	StarLink
starly	starly	Starly
starmon-token	smon	StarMon
starname	iov	Starname
starpad	srp	Starpad
starplay	stpc	StarPlay
starsharks	sss	StarSharks
starsharks-sea	sea	StarSharks SEA
starship	starship	StarShip
starship-token	stars	StarShip Stars
starslax	sslx	StarSlax
star-wars-cat	swcat	Star Wars Cat
starwire	str	Starwire
starworks-global-ecosystem	starx	STARX
starz	stz	Starz
stasis-eurs	eurs	STASIS EURO
stat	stat	STAT
stater	str	Stater
statera	sta	Statera
statik	statik	Statik
sta-token	sta	STA
stats	stats	STATS
status	snt	Status
stay	stay	STAY
staykx	stx	StaykX
staysafu	safu	StaySAFU
staysbase	sbs	StaysBASE
steakbank-finance	sbf	SteakBank Finance
steakhut-finance	steak	SteakHut Finance
steaks-finance	steak	Steaks Finance
stealthcoin	xst	Stealth
steam-exchange	steamx	Steam Exchange
steel	steel	Steel
steem	steem	Steem
steem-dollars	sbd	Steem Dollars
stelia	stelia	Stelia
stellar	xlm	Stellar
stellar-diamond	xld	Stellar Diamond
stellarinu	stellarinu	StellarInu
stellaswap	stella	StellaSwap
stellite	xla	Scala
stemx	stemx	STEMX
step	step	Step
step-app-fitfi	fitfi	Step App
stepex	spex	StepEx
step-finance	step	Step Finance
stepg	stepg	STEPG
step-hero	hero	Step Hero
step-hero-soul	step	Step Hero Soul
stepn	gmt	STEPN
stepwatch	swp	Stepwatch
stepwatch-land-token	swld	Stepwatch Land Token
stepwell	stw	StepWell
stfu-labs	stfu	STFU Labs
stfx	stfx	STFX
stickman-battleground	stman	Stickman Battleground
stilton	stilt	Stilton
stilton-musk	stilton	Stilton Musk [OLD]
stima	stima	STIMA
stimmy	stimmy	$STIMMY
sting	stn	Sting
stingdefi	sdfi	StingDefi
stipend	spd	Stipend
stkatom	stkatom	stkATOM
stkd-scrt	stkd	Stkd SCRT
stobox-token	stbu	Stobox
ston	ston	Ston
stoneage-nft	ges	Stoneage NFT
stonedao	sdt	StoneDAO
stoned-ape-crew-index	sac	Stoned Ape Crew Index
stone-token	stn	Stone
stonk-2	stonk	Stonk
stonkleague	aegis	StonkLeague
stopelon	stopelon	StopElon
storage-area-network-anywhere	sana	Storage Area Network Anywhere
storepay	spc	Storepay
storiqa	stq	Storiqa
storj	storj	Storj
storm	stmx	StormX
storm-bringer-token	stb	Storm Bringer
storm-token	storm	Storm
storx	srx	StorX
story	story	Story
stox	stx	Stox
stp-network	stpt	STP
strains	sfn	Strains
straitsx-indonesia-rupiah	xidr	XIDR
stratis	strax	Stratis
stratos	stos	Stratos
strawberry-share	$straw	Strawberry Share
strayacoin	nah	Strayacoin
streakk	stkk	Streakk
stream2earn	streamn	Stream2Earn
streamcoin	strm	StreamCoin
streamer-inu	streamerinu	Streamer Inu
stream-protocol	stpl	Stream Protocol
streamr	data	Streamr
streamr-xdata	xdata	Streamr XDATA
streeth	streeth	STREETH
street-runner	srg	Street Runner
stride	strd	Stride
stride-staked-atom	statom	Stride Staked Atom
stride-staked-juno	stjuno	Stride Staked Juno
stride-staked-osmo	stosmo	Stride Staked Osmo
strike	strk	Strike
strikecoin	strx	StrikeX
stripcoin	strip	StripCoin
strip-finance	strip	Strip Finance
strips-finance	strp	Strips Finance
stripto	strip	Stripto
strite	stri	Strite
strong	strong	Strong
stronger	strngr	Stronger
stronghands	shnd	StrongHands
stronghands-finance	ishnd	StrongHands Finance
stronghands-masternode	shmn	StrongHands Masternode
stronghold-token	shx	Stronghold
strongnode	sne	StrongNode
structure-finance	stf	Structure Finance
strudel-finance	trdl	Strudel Finance
strx-finance	sfi	STRX Finance
student-coin	stc	Student Coin
studyum	stud	Studyum
style	style	Style
stylike-governance	styl	Stylike Governance
subdao	gov	SubDAO
subme	sub	Subme
substratum	sub	Substratum
success-inu	success	SUCCESS INU
succession	sccn	Succession
such-shiba	such	Such Shiba
sucrecoin	xsr	Sucrecoin
sudoswap	sudo	sudoswap
sugarbounce	tip	SugarBounce
sugarchain	sugar	Sugarchain
sugar-kingdom	candy	Sugar Kingdom
sukhavati-network	skt	Sukhavati Network
suku	suku	SUKU
summer	summer	Summer
summoners-arena-essence	sae	Summoners Arena Essence
sumokoin	sumo	Sumokoin
sumotex	smtx	SUMOTEX
sumswap	sum	SumSwap
suncontract	snc	SunContract
sundaeswap	sundae	SundaeSwap
sunder-goverance-token	sunder	Sunder Goverance
suneku	suneku	Suneku
sunflower-finance	sfo	Sunflower Finance
sunflower-land	sfl	Sunflower Land
sunflower-token	stk	Sunflower Token
sunny-aggregator	sunny	Sunny Aggregator
sunnysideup	ssu	SunnySideUp
sunrise	sunc	Sunrise
sun-token	sun	Sun Token
supa-foundation	supa	SUPA Foundation
supe-infinity	supe	Supe Infinity
super-athletes-token	sat	Super Athletes Token
superbid	superbid	SuperBid
superbonds	sb	SuperBonds
superciety	super	PeerMe SUPER
supercoin	super	SuperCoin
super-coinview-token	scv	Super CoinView
superfarm	super	SuperVerse
super-hero	sh	Super Hero
superlauncher-dao	launch	Superlauncher
supermegahyperdoge	smhdoge	SuperMegaHyperDoge
supernova	snt	Supernova
superpower-squad	ecg	Superpower Squad ECG
super-protocol-token	tee	Super Protocol Token
superrare	rare	SuperRare
super-rare-ball-shares	srbp	Super Rare Ball Potion
super-shiba	$sshiba	Super Shiba
superstep	sgmt	SuperStep
super-three-kingdoms	stk	Super Three Kingdoms
supertx-governance-token	sup	SuperTx Governance
superwalk	grnd	SuperWalk
super-zero	sero	SERO
supplycon	splc	SupplyCon
support-doge	supd	Support Doge
supremacy	sups	Supremacy
supreme-finance	hype	Supreme Finance
supreme-finance-hypes	hypes	Supreme Finance HYPES
suprenft	snft	SupreNFT
suqa	sin	SINOVATE
sureremit	rmt	SureRemit
surfexutilitytoken	surf	SurfExUtilityToken
surf-finance	surf	Surf.Finance
surf-live	surf	Surf Live
surfswap	tide	Surfswap
surge-inu	surge	Surge Inu
survival-game-online	surv	Survival Game Online
surviving-soldiers	ssg	Surviving Soldiers
survivor	$srv	Survivor
susd-yvault	yvsusd	sUSD yVault
sushi	sushi	Sushi
sushiba	sushiba	Sushiba
sushi-yvault	yvsushi	SUSHI yVault
sustainable-energy-token	set	Sustainable Energy
suterusu	suter	Suterusu
suvereno	suv	Suvereno
suzaku	suza	Suzaku
swace	swace	Swace
swagbucks	bucks	SwagBucks
swag-finance	swag	SWAG Finance
s-wallet-protocol	swp	S-Wallet Protocol
swamp-coin	swamp	Swamp Coin
swampy	swamp	Swampy
swanlana	swan	Swanlana
swap	xwp	Swap
swapdex	sdxb	SwapDEX
swaperry	perry	Swaperry
swapfish	fish	SwapFish
swapfolio	swfl	Swapfolio
swapify	swify	Swapify
swapp	swapp	SWAPP Protocol
swapped-finance	swpd	Swapped Finance
swappery-token	swpr	The Swappery
swappi	ppi	Swappi
swapr	swpr	Swapr
swaptracker	swpt	SwapTracker
swapx	xwap	SwapX
swapxi-token	swapxi	SwapXI
swapz-app	swapz	SWAPZ.app
swarm	swm	Swarm Network
swarm-bzz	bzz	Swarm
swarm-city	swt	Swarm City
swarm-markets	smt	Swarm Markets
swash	swash	Swash
sway-social	sway	Sway Social
sweatcoin	sweat	Sweatcoin (Sweat Economy)
sweep-token	sweep	Sweep Token
sweettoken	swt	SweetToken
swell-network	swell	Swell Network
sweply	swply	Sweply
swerve-dao	swrv	Swerve
swerve-protocol	swerve	SWERVE Protocol
swftcoin	swftc	SWFTCOIN
swgtoken	swg	SWG
swiftcash	swift	SwiftCash
swiftlance-token	swl	Swiftlance
swinca-2	swi	Swinca
swing	swing	Swing
swingby	swingby	Swingby
swing-dao	swing	Swing DAO
swing-xyz	$swing	Swing.xyz
swipe	sxp	SXP
swirltoken	swirl	Swirl
swissborg	chsb	SwissBorg
swiss-nft-fund	swissnftfund	Swiss NFT Fund
switch	esh	Switch
switcheo	swth	Carbon Protocol
swivel-governance	swiv	Swivel Governance
swole-doge	swole	Swole Doge
swop	swop	Swop
sword-bsc-token	swdb	Sword BSC Token
swtcoin	swat	SWTCoin
swusd	swusd	Swerve.fi USD
sx-network	sx	SX Network
sya-x-flooz	sya	SaveYourAssets
sybc-coin	sybc	SYBC Coin
syfin	syf	Syfin
sylo	sylo	Sylo
syltare	syl	SYLTARE
symbiosis-finance	sis	Symbiosis Finance
symbol	xym	Symbol
symmetric	symm	Symmetric
symverse	sym	SymVerse
synapse-2	syn	Synapse
synapse-network	snp	Synapse Network
syncdao-governance	sdg	SyncDAO Governance
synchrobitcoin	snb	SynchroBitcoin
synchrocoin	syc	SynchroCoin
synchrony	scy	Synchrony
sync-network	sync	Sync Network
syndicate-2	synr	MOBLAND
synesis-one	sns	Synesis One
synex-coin	minecraft	Synex Coin
synthetic-ftt	xftt	Synthetic FTT
synthetic-sol	xsol	Synthetic SOL
synthetic-usd	xusd	Synthetic USD
synthetify-token	sny	Synthetify
synth-ousd	ousd	Synth oUSD
sypool	syp	Sypool
syrup-finance	srx	Syrup Finance
syscoin	sys	Syscoin
t	t	T
t23	t23	T23
tabank	tab	Tabank
taboo-token	taboo	Taboo
tabtrader	ttt	TabTrader
tacos	taco	Tacos
tadpole-finance	tad	Tadpole
tagcoin	tag	Tagcoin
tag-protocol	tag	Tag Protocol
tagrcoin	tagr	TAGRcoin
tahu	tahu	TAHU
tai	tai	tBridge
tail	tail	Tail
tails	tails	Tails
tajcoin	taj	TajCoin
takamaka-green-coin	tkg	Takamaka
takeda-shin	takeda	Takeda Shin
takepile	take	Takepile
taki	taki	Taki
taklimakan-network	tan	Taklimakan Network
tako-token	tako	Tako
talaria-inu	tali	Talaria Inu
talecraft	craft	TaleCraft
talent	tnt	Talent
talent-token	ttx	Talent TTX
taler	tlr	Taler
talkado	talk	Talkado
talken	talk	Talken
tamadoge	tama	Tamadoge
tama-finance	tama	Tama Finance
tangent	tang	Tangent
tangle	tngl	Tangle
tangoswap	tango	TangoSwap
tank-battle	tbl	Tank Battle
tank-gold	tgold	Tank Gold
tanks	tanks	Tanks
tanuki-token	tanuki	Tanuki
tao-te-ching	ttc	Tao Te Ching
tap	xtp	Tap
tap-fantasy	tap	Tap Fantasy
tap-fantasy-mc	tfmc	Tap Fantasy MC
tapio-protocol	tap	Tapio Protocol
tapme-token	tap	TAPME
tapmydata	tap	TapX
taraxa	tara	Taraxa
tardigrades-finance	trdg	TRDGtoken
tari-world	tari	Tari World
tarmex	tarm	Tarmex
tarot	tarot	Tarot
taroverse	taro	Taroverse
taroverse-gold	tgold	Taroverse Gold
tart	tart	Tartarus Finance
tastenft	taste	TasteNFT
tate-token	topg	Tate Token
taxa-token	txt	Taxa Network
tax-haven-inu	taxhaveninu	Tax Haven Inu
tazor	tazor	Tazor
tbcc	tbcc	TBCC
t-bitcoin	tbtc	τBitcoin
tbtc	tbtc	tBTC
tcgcoin	tcgcoin	TCGCoin
tcgcoin-2-0	tcg2	TCGCoin 2.0
tcg-verse	tcgc	TCG Verse
tcoin-fun	tco	Tcoin.fun
tdoge	tdoge	τDoge
teadao	tea	TeaDAO
team-heretics-fan-token	th	Team Heretics Fan Token
team-vitality-fan-token	vit	Team Vitality Fan Token
teaswap-art	tsa	Teaswap Art
tea-token	tea	Tea
technoland	techno	Technoland
techpay	tpc	Techpay
techtrees	ttc	TechTrees
tecracoin	tcr	TecraCoin ERC20
tectonic	tonic	Tectonic
teddy-dog	tdg	Teddy Dog
teddy-doge	teddy	Teddy Doge
teddy-doge-v2	teddy v2	Teddy Doge V2
teddy-dollar	tsd	Teddy Dollar
te-food	tone	TE-FOOD
tegro	tgr	Tegro
tehbag	bag	tehBag
teh-golden-one	gold 1	Teh Golden One
tekcoin	tek	TEKcoin
telcoin	tel	Telcoin
telefy	tele	Telefy
telegram-inu	tinu	Telegram Inu
teleport	port	Teleport
tellor	trb	Tellor
telos	tlos	Telos
telos-coin	telos	Teloscoin
temco	temco	TEMCO
temdao	tem	TemDAO
templardao	tem	Templar DAO
temple	temple	TempleDAO
tempus	temp	Tempus
temtem	tem	Temtum
ten	tenfi	TEN
ten-best-coins	tbc	Ten Best Coins
tender-fi	tnd	Tender.fi
tendies	tend	Tendies
teneo	ten	Teneo
tenset	10set	Tenset
tenshi	tenshi	Tenshi
tenup	tup	Tenup
ten-wallet	tenw	TEN Wallet
tenx	pay	TenX
terablock	tbc	TeraBlock
terareum	tera	Terareum
tera-smart-money	tera	TERA
teritori	tori	Teritori
ternio	tern	Ternio
terracoin	trc	Terracoin
terraform-dao	terraform	Terraform DAO
terra-luna	lunc	Terra Luna Classic
terra-luna-2	luna	Terra
terra-name-service	tns	Terra Name Service
terran-coin	trr	Terran Coin
terra-poker-token	tpt	Terra Poker Token
terrausd	ustc	TerraClassicUSD
terrausd-wormhole	ust	TerraUSD (Wormhole)
terra-world-token	twd	Terra World
teseract	tess	Tesseract
teslafunds	tsf	Transaction Service Fee
tesla-inu	tesinu	Tesla Inu
tessla-coin	tsla	Tessla Coin
tether	usdt	Tether
tether-6069e553-7ebb-487e-965e-2896cd21d6ac	zusdt	Zilliqa-bridged USDT
tether-avalanche-bridged-usdt-e	usdte	Tether Avalanche Bridged (USDT.e)
tether-eurt	eurt	Euro Tether
tether-gold	xaut	Tether Gold
tether-pow	usdw	Tether Pow
tether-usd-celer	ceusdt	Tether USD - Celer
tether-usd-pos-wormhole	usdtpo	Tether USD (PoS) (Wormhole)
tether-usd-wormhole	usdtso	Tether USD (Wormhole)
tether-usd-wormhole-from-ethereum	usdtet	Tether USD (Wormhole from Ethereum)
tethys-finance	tethys	Tethys Finance
tetu	tetu	TETU
tetubal	tetubal	tetuBAL
tetuqi	tetuqi	tetuQi
texan	texan	Texan
texas-protocol	txs	Texas Protocol
tezos	xtz	Tezos
tfs-token	tfs	TFS
tg-dao	tgdao	TG DAO
tgold	txau	tGOLD
tgrade	tgd	Tgrade
thales	thales	Thales
the-4th-pillar	four	4thpillar technologies
the-abyss	abyss	Abyss
the-akragas-decadrachm	thead	The Akragas Decadrachm
the-amaze-world	amze	The Amaze World
the-ape	ta	The Ape
the-ape-society	society	The Ape Society
the-apis	api	The APIS
the-atlas-coin	$atlas	The Atlas Coin
the-bend	bend	The Bend
thebigcoin	big	TheBigCoin
the-big-five	bft	The Big Five
the-bitcoin-family	family	The Bitcoin Family
theca	theca	Theca
the-cat-inu	thecat	The Cat Inu
the-champcoin	tcc	The ChampCoin
the-citadel	thecitadel	The Citadel
the-commission	cmsn	The Commission
the-coop-network	gmd	The Coop Network
the-corgi-of-polkabridge	corgib	The Corgi of PolkaBridge
the-crypto-prophecies	tcp	The Crypto Prophecies
the-crypto-you	milk	The Crypto You
the-daox-index	daox	The DAOX Index
the-debt-box	debt	The Debt Box
the-doge-nft	dog	The Doge NFT
the-dragon-gate	koi	The Dragon Gate
the-dynasty	dyt	The Dynasty
the-employment-commons-work-token	work	The Employment Commons Work
the-essential-coin	esc	The Essential Coin
the-everlasting-parachain	elp	The Everlasting Parachain
the-fire-token	xfr	The Fire
theflashcurrency	tfc	TheFlashCurrency
the-forbidden-forest	forestplus	The Forbidden Forest
theforce-trade	foc	TheForce Trade
thefutbolcoin	tfc	TheFutbolCoin
the-genesis-block	genblok	The Genesis Block
the-golden-dog	dog	The Golden Dog
the-graph	grt	The Graph
the-guest-list	tgl	The Guest List
the-hash-speed	ths	The Hash Speed
theholyrogercoin	roger	TheHolyRogerCoin
the-husl	husl	The HUSL
the-k0de	k0de	The $k0de
the-killbox-game	kbox	The Killbox Game
the-laboratory	$lab	The Laboratory
the-landlord	lndlrd	The Landlord
the-last-war	tlw	The Last War
the-legend-of-deification	tlod	The Legend of Deification
the-mars	mrst	Mars Token
the-meebits	nmeebits	The Meebits
the-meme-finance	mefi	The meme finance
the-midas-touch-gold	tmtg	The Midas Touch Gold
the-monopolist	mono	The Monopolist
thena	the	Thena
the-neighbours	neibr	The Neighbours
the-neko	neko	The Neko
the-next-world-coin	tnc	The Next World Coin
the-node	the	THENODE
the-open-network	ton	Toncoin
theos	theos	Theos
theoscoin	ths	Theoscoin
the-pablo-token	pablo	The Pablo
the-parallel	prl	The Parallel
the-path-of-light	yori	The Path Of Light
the-people-coin	peeps	The People’s Coin
the-philosophers-stone	tpos	The Philosophers Stone
the-phoenix	fire	The Phoenix
the-plant-dao	sprout	The Plant Dao
the-protocol	the	The Protocol
the-randomdao	rnd	The RandomDAO
the-realm-defenders	trd	The Realm Defenders
the-real-tsygan	tsygan	The Real Tsygan
the-reaper	rpr	The Reaper
the-rug-game	trg	The Rug Game
the-sandbox	sand	The Sandbox
the-sandbox-wormhole	sand	The Sandbox (Wormhole)
the-sharks-fan-token	sharks	The Sharks Fan Token
thesolandao	sdo	TheSolanDAO
the-space	space	The Space
the-sprint-token	tst	The Sprint Token
the-starship-finance	bip	The Starship Finance
the-sun-rises	sunrise	The Sun Rises
thetadrop	tdrop	ThetaDrop
theta-fuel	tfuel	Theta Fuel
the-tale-of-osaku	osaku	The Tale of Osaku
thetan-arena	thg	Thetan Arena
thetan-coin	thc	Thetan Coin
theta-token	theta	Theta Network
the-three-kingdoms	ttk	The Three Kingdoms
the-tokenized-bitcoin	imbtc	The Tokenized Bitcoin
the-troller-coin	troller	The Troller Coin
the-virtua-kolect	tvk	The Virtua Kolect
the-wasted-lands	wal	The Wasted Lands
the-web3-project	twep	The Web3 Project
the-winkyverse	wnk	The Winkyverse
the-wolf-pack	pack	The Wolf Pack
the-xenobots-project	xeno	The Xenobots Project
the-youth-pay	typ	The Youth Pay
thingschain	tic	Thingschain
thingsgo-online	tgo	ThingsGo.Online
thor	thor	ThorFi
thorchain	rune	THORChain
thorchain-erc20	rune	THORChain (ERC20)
thoreum-v2	thoreum	Thoreum V3
thors-mead	mead	Thors Mead
thorstarter	xrune	Thorstarter
thorswap	thor	THORSwap
thorus	tho	Thorus
thorwallet	tgt	THORWallet DEX
thought	tht	Thought
threefold-token	tft	ThreeFold
three-kingdoms	rtk	Three Kingdoms
threeoh-dao	3oh	ThreeOh DAO
threshold-network-token	t	Threshold Network
throne	thn	Throne
thrupenny	tpy	Thrupenny
thunderada-app	thunderada	ThunderADA.app
thunderbnb	thunderbnb	ThunderBNB
thunder-brawl	thb	Thunder Brawl
thundereth	thundereth	ThunderETH
thunder-lands	tndr	Thunder Lands
thunder-token	tt	ThunderCore
thx-network	thx	THX Network
tia	tia	TIA
tianyu-finance	tyc	Tianyu Finance
tiara	tti	Tiara
ticket-finance	ticket	Ticket Finance
tickr	tickr	Tickr
tictalk	tic	TicTalk
tidal-finance	tidal	Tidal Finance
tidex-token	tdx	Tidex
tierion	tnt	Tierion
tierra-meta	trmt	Tierra Meta
tifi-token	tifi	TiFi
tigercash	tch	TigerCash
tiger-king	tking	Tiger King Coin
tigerqueen	tqueen	TigerQueen
tiger-scrub-money-2	tiger	Tiger Scrub Money
tiger-token	tgnb	Tiger
tiger-trade	ti̇gr	Tiger.Trade
tigres-fan-token	tigres	Tigres Fan Token
tiki-token	tiki	Tiki
tikky-inu	tikky	Tikky Inu
tiktoken	tiktoken	TikToken
tillage	till	Tillage
tilwiki	tlw	TilWiki
timechain-swap-token	tcs	Timechain Swap
timeleap-finance	time	Timeleap Finance
timeless	lit	Timeless
time-new-bank	tnb	Time New Bank
tiny-bonez	t1ny	Tiny Bonez
tiny-coin	tinc	Tiny Coin
tiny-colony	tiny	Tiny Colony
tip-blue	blue	Tip.Blue
tipo-token	tipo	TIPO Token
tipsycoin	$tipsy	TipsyCoin
tiraverse	tvrs	TiraVerse
titan-coin	ttn	Titan Coin
titan-hunters	tita	Titan Hunters
titania-token	titania	Titania
titano	titano	Titano
titanswap	titan	TitanSwap
titi-financial	titi	Titi Financial
titi-protocol	titi	TiTi Protocol
title-network	tnet	Bitcoin Clashic
titsv2	tits	TitsV2
tlabs	tbs	TLabs
tlchain	tlc	TLChain
tlpt	tlpt	tLPT
t-mac-dao	tmg	T-mac DAO
tmatic	tmatic	tMATIC
tnc-coin	tnc	TNC Coin
tnns	tnns	TNNS
tokamak-network	ton	Tokamak Network
tokemak	toke	Tokemak
tokenarium	tknrm	Tokenarium
tokenasset	ntb	TokenAsset
tokenbank	tbank	Tokenbank
tokenbook	tbk	TokenBook
tokenbot	tkb	TokenBot
tokenbox	tbx	Tokenbox
tokencard	tkn	Monolith
tokenclub	tct	TokenClub
tokendesk	tds	TokenDesk
token-dforce-usd	usx	dForce USD
token-engineering-commons	tec	Token Engineering Commons
tokenfy	tknfy	Tokenfy
tokengo	gpt	GoPower
tokenize-xchange	tkx	Tokenize Xchange
tokenjenny	jenn	TokenJenny
token-kennel	kennel	Kennel
tokenlon	lon	Tokenlon
token-of-fire	rhllor	Token of Fire
tokenoid	noid	Tokenoid
tokenomy	ten	Tokenomy
tokenplace	tok	Tokenplace
tokenplay	top	Tokenplay
token-pocket	tpt	TokenPocket Token
token-runner	tkrn	Token Runner
token-shelby	tsy	Token Shelby
tokerr	tokr	Tokerr
tokes	tks	Tokes
toko	toko	Tokoin
tokocrypto	tko	Tokocrypto
tokonft	tkn	TokoNFT
tokpie	tkp	TOKPIE
toksi	toi	Toksi
tokyo	tokc	Tokyo Coin
tokyo-au	tokau	Tokyo AU
tokyo-inu	toki	Tokyo Inu
tolar	tol	Tolar
tomato-coin	bptc	Tomato Coin
tomb	tomb	Tomb
tomb-shares	tshare	Tomb Shares
tomcat	tcat	TomCat
tom-coin	tmc	Tom Coin
tom-finance	tom	TOM Finance
tominet	tomi	tomiNet
tomochain	tomo	TomoChain
tomoe	tomoe	TomoChain ERC-20
tomtomcoin	toms	TomTomCoin
tonestra	tnr	Tonestra
tongtong-coin	ttc	Tongtong Coin
tonstarter	tos	TONStarter
tontoken	ton	TON
toobcoin	toob	Toobcoin
tools	tools	TOOLS
topbidder	bid	TopBidder
topchain	topc	TopChain
top-coin-token	tct	Top Coin
topg-coin	topg	TopG Coin
topmanager	tmt	TopManager
top-network	top	TOP Network
top-one	top1	TOP ONE
topshelf-finance	liqr	Topshelf Finance
topss	topss	TOPSS
tor	tor	TOR
tora-inu	tora	Tora Inu
torches	tor	Torches
torekko	trk	Torekko
torg	torg	TORG
torii-finance	torii	Torii Finance
torkpad	tpad	TorkPad
tornado-cash	torn	Tornado Cash
torpedo	torpedo	Torpedo
torq-coin	torq	TORQ Coin
tortuga-staked-aptos	tapt	Tortuga Staked Aptos
torum	xtm	Torum
tosa-inu	tos	Tosa Inu
tosdis	dis	TosDis
toshinori-inu	toshinori	Toshinori Inu
toshi-token	toshi	Toshimon
tosidrop	ctosi	TosiDrop
total-crypto-market-cap-token	tcap	Total Crypto Market Cap
totally-a-rug-pull	tarp	Totally A Rug Pull
totem-earth-systems	ctzn	Totem
totemfi	totm	TotemFi
to-the-moon-token	ton	To The Moon Token
totoro-inu	totoro	Totoro Inu
toucan-protocol-base-carbon-tonne	bct	Toucan Protocol: Base Carbon Tonne
toucan-protocol-nature-carbon-tonne	nct	Toucan Protocol: Nature Carbon Tonne
touchcon	toc	TouchCon
tourismx	trmx	TourismX
tourist-shiba-inu	tourists	Tourist Shiba Inu
tourist-token	toto	Tourist
tower	tower	Tower
town-star	town	Town Star
toxicdeer-finance	deer	ToxicDeer Finance
toxicdeer-share	xdshare	ToxicDeer Share
toxicgamenft	txc	ToxicGameNft
tpro	tpro	TPRO
tp-swap	tp	Token Swap
tr3zor	tr3	Tr3zor
trabzonspor-fan-token	tra	Trabzonspor Fan Token
trace-network-labs	trace	Trace Network Labs
tracer	trc	Tracer
tracer-dao	tcr	Tracer DAO
tractor-joe	tractor	Tractor Joe
tradao	tod	Trava Capital
trade-fighter	tdf	Trade Fighter
tradeflow	tflow	TradeFlow
traders-coin	trdc	Traders Coin
tradestars	tsx	TradeStars
trade-win	twi	Trade.win
tradewix	wix	TradeWix
tranche-finance	slice	Tranche Finance
tranchess	chess	Tranchess
tranquil-finance	tranq	Tranquil Finance
tranquility-city	lumen	Tranquility City
tranquil-staked-one	stone	Tranquil Staked ONE
transcodium	tns	Transcodium
transhuman-coin	thc	Transhuman Coin
transient	tsct	Transient
tratok	trat	Tratok
trava-finance	trava	Trava Finance
travel-care-2	travel	Travel Care
travgopv	tpv	TravGoPV
traxx	traxx	Traxx
trazable	trz	Trazable
treasure-sl	tsl	Treasure SL
treasure-token-finance	trove	TroveDAO
treasure-under-sea	tus	Treasure Under Sea
treasury-bond-eth-tokenized-stock-defichain	dtlt	iShares 20+ Year Treasury Bond ETF Defichain
treat	treat	Treat
treatdao-v2	treat	TreatDAO
treeb	treeb	Retreeb
treecle	trcl	Treecle
tremendous-coin	tmds	Tremendous Coin
trendering	trnd	Trendering
trendsy	trndz	Trendsy
trezarcoin	tzc	TrezarCoin
triall	trl	Triall
trias-token	trias	TriasLab
tribalpunk-cryptoverse	anta	Tribalpunk Cryptoverse
tribal-token	tribl	Tribal Token
tribar	xtri	Tribar
tribe-2	tribe	Tribe
tribeland	trbl	Tribeland
tribeone	haka	TribeOne
trice	tri	Trice
trickle	h2o	Trickle
triflex-token	trfx	Triflex
triipmiles	tiim	TriipMiles
trillium	tt	Trillium
trinity	tty	Trinity
trinity-network-credit	tnc	Trinity Network Credit
trinity-swap	trinity	Trinity Swap
tripcandy	candy	TripCandy
tripedia	trip	Tripedia
tripolar	tripolar	Tripolar
trips-community	trips	Trips Community
trism	trism	Trism
trisolaris	tri	Trisolaris
triton	xeq	Equilibria
trittium	trtt	Trittium
triumphx	trix	TriumphX
triveum	trv	Triveum
trivian	trivia	Trivians
trodl	tro	Trodl
trolite	trl	Trolite
trollbox	tox	trollbox
trollcoin	troll	Trollcoin
tron	trx	TRON
tronado	trdo	TRONADO
tronbetlive	live	TRONbetLive
tron-bsc	trx	TRON (BSC)
tronclassic	trxc	TronClassic
troneuroperewardcoin	terc	TronEuropeRewardCoin
tronpad	tronpad	TRONPAD
tropical-finance	daiquiri	Tropical Finance
troy	troy	Troy
trubadger	trubgr	TruBadger
truebit-protocol	tru	Truebit Protocol
trueburn	true	TrueBurn
true-chain	true	TrueChain
truecnh	tcnh	TrueCNH
truedeck	tdp	TrueDeck
truefeedbackchain	tfbx	Truefeedback
truefi	tru	TrueFi
trueflip	tfl	TrueFlip
truefreeze	frz	TrueFreeze
true-pnl	pnl	True PNL
true-usd	tusd	TrueUSD
trustbase	tbe	TrustBase
trusted-node	tnode	Trusted Node
trustfi-network-token	tfi	TrustFi Network
trustkeys-network	trustk	TrustKeys Network
trustnft	trustnft	TrustNFT
trustpad	tpad	TrustPad
trustpay	tph	Trustpay
trustrise	trise	TrustRise
trustswap	swap	Trustswap
trustverse	trv	TrustVerse
trust-wallet-token	twt	Trust Wallet
trustworks	trust	Trustworks
trx3l	trx3l	TRX3L
tryc	tryc	TRYC
try-finance	try	Try.Finance
tryhards	try	TryHards
tryvium-2	tryv	Tryvium
tsilver	txag	tSILVER
tsuki-inu	tkinu	Tsuki Inu
tsuki-no-usagi	gyokuto	Tsuki no usagi
tsukiverse-galactic-adventures	tsuga	Tsukiverse:Galactic Adventures
tsukuyomi-no-mikoto	mikoto	Tsukuyomi-no-Mikoto
tsuzuki-inu	tzki	Tsuzuki Inu
ttcoin	tc	TTcoin
ttc-protocol	maro	Maro
ttx-metaverse	xmeta	TTX Metaverse
tudabirds	burd	tudaBirds
tuf-token	tuf	TUF Token
tundra-token	tundra	Tundra
tune	tun	TUNE
tune-fm	jam	Tune.Fm
tune-token	tune	TUNE TOKEN
tupan	tupan	Tupan
turbo-wallet	turbo	Turbo Wallet
turex	tur	Turex
turkiye-basketbol-federasyonu-token	tbft	Türkiye Basketbol Federasyonu Fan Token
turkiye-motosiklet-federasyonu-fan-token	tmft	Türkiye Motosiklet Federasyonu Fan Token
turnt-up-tikis	tut	Turnt Up Tikis
turtlecoin	trtl	TurtleCoin
turtle-shell-islands	shell	Turtle Shell Islands
turtles-token	trtls	Turtles
tusd-yvault	yvtusd	TUSD yVault
tutela	tutl	Tutela
tutellus	tut	Tutellus
tutti-frutti-finance	tff	Tutti Frutti
tuzlaspor	tuzla	Tuzlaspor Token
tvt	tvt	TVT
twelve-legions	ctl	Twelve Legions
twinci	twin	Twinci
twirl-governance-token	tgt	Twirl Governance
twitfi	twt	Twitfi
twitterx	twitterx	TwitterX
twoge-inu	twoge	Twoge Inu
two-monkey-juice-bar	$tmon	Two Monkey Juice Bar
txa	txa	TXA
txbit	txbit	Txbit
tycoon	tyc	Tycoon
typerium	type	Typerium
typhoon-cash	phoon	Typhoon Cash
typhoon-network	typh	Typhoon Network
tyv	tyv	TYV
tzbtc	tzbtc	tzBTC
uangmarket	uang	UangMarket
ubeswap	ube	Ubeswap
ubiner	ubin	Ubiner
ubiq	ubq	Ubiq
ubix-network	ubx	UBIX Network
ubu	ubu	UBU
ubxs-token	ubxs	UBXS
uca	uca	UCA Coin
ucash	ucash	U.CASH
uconetwork	ucoil	UCONetwork
ucrowdme	ucm	UCROWDME
ucx	ucx	UCX
udder-chaos-milk	milk	MILK
udinese-calcio-fan-token	udi	Udinese Calcio Fan Token
ufc-fan-token	ufc	UFC Fan Token
ufocoin	ufo	Uniform Fiscal Object
ufo-gaming	ufo	UFO Gaming
uhive	hve2	Uhive
uka-doge-coin	udoge	Uka Doge Coin
ukrainedao-flag-nft	love	UkraineDAO Flag NFT
ulanco	uac	Ulanco
uland	uland	ULAND
ulord	ut	Ulord
ultimate-champions	champ	Ultimate Champions
ultimogg	ultgg	UltimoGG
ultra	uos	Ultra
ultrachad	uchad	UltraChad
ultra-clear	ucr	Ultra Clear
ultragate	ulg	Ultragate
ultrain	ugas	Ultrain
ultralpha	uat	UltrAlpha
ultramoc	umc	Ultramoc
ultra-nft	unft	Ultra NFT
ultrasafe	ultra	UltraSafe
ultron	ulx	ULTRON
ultronglow	utg	UltronGlow
uma	uma	UMA
umami-finance	umami	Umami
umbra-network	umbr	Umbria Network
umbrellacoin	umc	Umbrella Coin
umbrella-network	umb	Umbrella Network
umee	umee	Umee
umetaworld	umw	UMetaWorld
ume-token	ume	UME
umi	umi	UMI
umi-digital	umi	Umi Digital
unagii-dai	udai	Unagii Dai
unagii-eth	ueth	Unagii ETH
unagii-tether-usd	uusdt	Unagii Tether USD
unagii-usd-coin	uusdc	Unagii USD Coin
unagii-wrapped-bitcoin	uwbtc	Unagii Wrapped Bitcoin
unbanked	unbnk	Unbanked
unbound-finance	unb	Unbound Finance
uncl	uncl	UNCL
unclemine	um	UncleMine
undead-blocks	undead	Undead Blocks
undead-finance	undead	Undead Finance
underminegold	umg	UnderMineGold
u-network	uuu	U Network
unfederalreserve	ersdl	unFederalReserve
unia-farms	unia	UNIA Farms
uniarts	uart	UniArts
unibright	ubt	Unibright
unicap-finance	ucap	Unicap.Finance
unicly	unic	Unicly
unicly-aavegotchi-astronauts-collection	ugotchi	Unicly Aavegotchi Astronauts Collection
unicly-cryptopunks-collection	upunk	Unicly CryptoPunks Collection
unicly-doki-doki-collection	udoki	Unicly Doki Doki Collection
unicly-fewocious-collection	ufewo	Unicly Fewocious Collection
unicly-genesis-collection	uunicly	Unicly Genesis Collection
unicly-mooncats-collection	umoon	Unicly MoonCats Collection
unicly-mystic-axies-collection	uaxie	Unicly Mystic Axies Collection
unicorn-milk	unim	Unicorn Milk
unicorn-token	uni	UNICORN
unicrypt-2	uncx	UniCrypt
unidef	u	Unidef
unidex	unidx	UniDex
unido-ep	udo	Unido
unidogefinance-token	unido	UnidogeFinance Token
unifarm	ufarm	UniFarm
unifees	fees	Unifees
unifi	unifi	Covenants
unification	fund	Unification
unifi-defi	unifi	UNIFI DeFi
unifi-protocol	up	UniFi Protocol
unifi-protocol-dao	unfi	Unifi Protocol DAO
unifty	nif	Unifty
unifund	ifund	Unifund
unikoin-gold	ukg	Unikoin Gold
unilab-network	ulab	Unilab
unilayer	layer	UniLayer
unilock-network-2	unl	Unilock.Network
unimex-network	umx	UniMex Network
union-protocol-governance-token	unn	UNION Protocol Governance
unipilot	pilot	Unipilot
uniplay	unp	UniPlay
unipower	power	UniPower
uniqly	uniq	Uniqly
uniqo	uniqo	Uniqo
unique-fans	fans	Unique Fans
unique-network	unq	Unique Network
unique-one	rare	Unique One
uniqueone-photo	foto	UniqueOne Photo
unique-utility-token	unqt	Unique Utility
unisocks	socks	Unisocks
unistake	unistake	Unistake
uniswap	uni	Uniswap
uniswap-state-dollar	usd	unified Stable Dollar
uniswap-wormhole	uni	Uniswap (Wormhole)
unite	unite	Unite
unitech	utc	Unitech
unitedcrowd	uct	UnitedCrowd
united-emirate-decentralized-coin	uedc	United Emirate Decentralized Coin
united-states-property-coin	uspc	United States Property Coin
united-token	uted	United
united-traders-token	utt	United Traders
unit-network	unit	Unit Network
unit-protocol-duck	duck	Unit Protocol
unitrade	trade	Unitrade
unitus	uis	Unitus
unity-network	unt	Unity Network
unityventures	uv	UnityVentures
unium	unm	UNIUM
universal-basic-income	ubi	Universal Basic Income
universal-basic-offset	ubo	Universal Basic Offset
universal-currency	unit	Universal Currency
universal-eth	unieth	Universal ETH
universal-floki-coin	ufloki	Universal Floki Coin
universal-gold	upxau	Universal Gold
universal-liquidity-union	ulu	Universal Liquidity Union
universal-pickle	$upl	Universal Pickle
universal-protocol-token	upt	Universal Protocol Token
universe-coin	unis	Universe Coin
universe-island	uim	Universe Island
universe-xyz	xyz	Universe.XYZ
universidad-de-chile-fan-token	uch	Universidad de Chile Fan Token
uniwhales	uwl	UniWhales
uniworld	unw	UniWorld
uniwswap	uniw	UniWswap
unix	unix	UniX
uni-yvault	yvuni	UNI yVault
unizen	zcx	Unizen
unkai	unkai	Unkai
unlend-finance	uft	UniLend Finance
unlimitedip	uip	UnlimitedIP
unlock	unlock	UNLOCK
unlockd	unlk	Unlockd
unlock-protocol	udt	Unlock Protocol
unmarshal	marsh	Unmarshal
unobtainium	uno	Unobtainium
unobtanium	uno	Unobtanium
unobtanium-tezos	uno	Unobtanium Tezos
uno-re	uno	Uno Re
unq	unq	Unique Venture clubs
unreal-finance	ugt	Unreal Finance
unslashed-finance	usf	Unslashed Finance
unus-dao	udo	Unus Dao
unvest	unv	Unvest
upark	upark	uPark
upbnb	upbnb	upBNB
upbots	ubxn	UpBots
upcoin	upcoin	Upcoin
updog	updog	UpDog
upfi-network	ups	UPFI Network
upfire	upr	Upfire
upfiring	ufr	Upfiring
uplexa	upx	uPlexa
uplift	lift	Uplift
uponly-token	upo	UpOnly
upper-dollar	usdu	Upper Dollar
upper-euro	euru	Upper Euro
upper-pound	gbpu	Upper Pound
upshib	upshib	upShib
upsorber	up	Upsorber
up-spiral	spiral	Up Spiral
uptrend	trend	UpTrend
uquid-coin	uqc	Uquid Coin
uramaki	maki	Uramaki
uraniumx	urx	UraniumX
ureeqa	urqa	UREEQA
urubit	urub	Urubit
urust-global	urust	Urust Global
urus-token	urus	Aurox
usd	usd+	USD+
usd-balance	usdb	USD Balance
usd-bancor	usdb	USD Bancor
usd-coin	usdc	USD Coin
usd-coin-avalanche-bridged-usdc-e	usdc	USD Coin Avalanche Bridged (USDC.e)
usd-coin-celer	ceusdc	USD Coin - Celer
usd-coin-nomad	nomadusdc	USD Coin - Nomad
usd-coin-pos-wormhole	usdcpo	USD Coin (PoS) (Wormhole)
usd-coin-wormhole-from-ethereum	usdcet	USD Coin (Wormhole from Ethereum)
usdc-yvault	yvusdc	USDC yVault
usdd	usdd	USDD
usdex-stablecoin	usdex	USDEX
usd-freedom	usdf	USD Freedom
usd-gambit	usdg	USD Gambit
usdh	usdh	USDH
usdk	usdk	USDK
usd-mars	usdm	USD Mars
usdo	usdo	USDO
usdp	usdp	USDP Stablecoin
usdtez	usdtz	USDtez
usdt-yvault	yvusdt	USDT yVault
usdx	usdx	USDX
usd-zee	usdz	USD ZEE
useless-2	use	Useless
usgold	usg	USGold
ushare	ushare	USHARE
ushi	ushi	Ushi
usk	usk	USK
usn	usn	USN
usp	usp	USP
utility-ape	$banana	Utility Ape
utip	utip	uTip
utopia	crp	Crypton
utopia-token	uto	Secret Skellies Society Utopia
utopia-usd	uusd	Utopia USD
utrust	utk	Utrust
utu-coin	utu	UTU Coin
uvtoken	uvt	UvToken
uwu-lend	uwu	UwU Lend
uwu-vault-nftx	uwu	UWU Vault (NFTX)
uxcord-token	uxt	Uxcord Token
uxd-protocol-token	uxp	UXD Protocol
uxd-stablecoin	uxd	UXD Stablecoin
uzumaki-inu	uzumaki	Uzumaki Inu
uzurocks	uzrs	UZUROCKS
uzyth	zyth	Uzyth
v3s-share	vshare	V3S Share
vabble	vab	Vabble
vacay	vacay	Vacay
vader-protocol	vader	Vader Protocol
vagabond	vgo	Vagabond
vai	vai	Vai
vaiot	vai	Vaiot
valas-finance	valas	Valas Finance
valencia-cf-fan-token	vcf	Valencia CF Fan Token
valentine-floki	flov	Valentine Floki
valhalla-protocol	val	Valhalla Protocol
valobit	vbit	VALOBIT
value-finance	vft	Value Finance
value-liquidity	value	Value DeFi
vancat	vancat	Vancat [OLD]
vancat-2	vancat	Vancat
vanesse	vnes	Vanesse
vanguard-real-estate-tokenized-stock-defichain	dvnq	Vanguard Real Estate Tokenized Stock Defichain
vanguard-sp-500-etf-tokenized-stock-defichain	dvoo	Vanguard S&P 500 ETF Tokenized Stock Defichain
vanilla-network	vnla	Vanilla Network
vanity	vny	Vanity
vankia-chain	vkt	Vankia Chain
vanspor-token	van	Vanspor Token
vantaur	vtar	Vantaur
vanywhere	vany	Vanywhere
vaperscoin	vprc	VapersCoin
vapornodes	vpnd	VaporNodes
vaporwave	vwave	Vaporwave
varen	vrn	Varen
vasco-da-gama-fan-token	vasco	Vasco da Gama Fan Token
vault	vault	VAULT
vaulteum	vault	Vaulteum
vault-hill-city	vhc	Vault Hill City
vaulty-token	vlty	Vaulty
vbswap	vbswap	vBSWAP
vcash	xvc	Vcash
vcgamers	vcg	VCGamers
veax	veax	Veax
vechain	vet	VeChain
veco	veco	Veco
vecrv-dao-yvault	yve-crvdao	veCRV-DAO yVault
vector-finance	vtx	Vector Finance
vectorium	vect	Vectorium
vectorspace	vxv	Vectorspace AI
vedao	weve	veDAO
veed	veed	VEED
vee-finance	vee	Vee Finance
vega-coin	vega	Vega Coin
vegannation-greencoin	grnc	VeganNation GreenCoin
vega-protocol	vega	Vega Protocol
vegasino	vegas	Vegasino
vega-sport	vega	Vega Sport
veggiecoin	vegi	VeggieCoin
veil	veil	VEIL
velas	vlx	Velas
velaspad	vlxpad	VelasPad
vela-token	vela	Vela Token
veldorabsc	vdora	VeldoraBSC
velerodao	vdgt	VeleroDAO
veles	vls	Veles
velhalla	scar	Velhalla
velo	velo	Velo
velodrome-finance	velo	Velodrome Finance
velorex	vex	Velorex
vemate	vmt	Vemate
vempire-ddao	vemp	VEMP
vendettadao	$v	VendettaDAO
vendetta-finance	ven	Vendetta Finance
vendit	vndt	Vendit
venera	vsw	Venera
veno	veno	Veno
veno-finance	vno	Veno Finance
venom	venom	Venom
venox	vnx	Venox
vent-finance	vent	Vent Finance
vention	vention	Vention
ventiswap	vst	VentiSwap
venus	xvs	Venus
venus-bch	vbch	Venus BCH
venus-beth	vbeth	Venus BETH
venus-btc	vbtc	Venus BTC
venus-busd	vbusd	Venus BUSD
venus-dai	vdai	Venus DAI
venus-doge	vdoge	Venus DOGE
venus-dot	vdot	Venus DOT
venus-eth	veth	Venus ETH
venus-fil	vfil	Venus FIL
venus-link	vlink	Venus LINK
venus-ltc	vltc	Venus LTC
venus-reward-token	vrt	Venus Reward
venus-sxp	vsxp	Venus SXP
venus-usdc	vusdc	Venus USDC
venus-usdt	vusdt	Venus USDT
venus-xrp	vxrp	Venus XRP
venus-xvs	vxvs	Venus XVS
vera	vera	Vera
vera-exchange	vera	VERA Exchange
veraone	vro	VeraOne
verasaw-plant-token	vrs	Verasaw Plant
verasity	vra	Verasity
verge	xvg	Verge
veriblock	vbk	VeriBlock
vericoin	vrc	VeriCoin
veridocglobal	vdg	VeriDocGlobal
verify	cred	Verify
verify-token	vrfy	Verify VRFY
veritaseum	veri	Veritaseum
veritise	vts	Veritise
verox	vrx	Verox
versagames	versa	VersaGames
versailles-heroes	vrh	Versailles Heroes
versatile-finance	$versa	Versatile Finance
verse	verse	Verse Token
verse-bitcoin	verse	Verse
version	v	Version
verso	vso	Verso
versoview	vvt	VersoView
vertcoin	vtc	Vertcoin
vertex-protocol	vrtx	Vertex Protocol
verus-coin	vrsc	Verus Coin
verve	verve	Verve
very-banking	vb	Very Banking
very-special-dragon	vito	Very Special Dragon
vesper-finance	vsp	Vesper Finance
vesper-vdollar	vusd	Vesper V-Dollar
vesq	vsq	VESQ
vesta-finance	vsta	Vesta Finance
vestallytoken	vtt	VesTally
vesta-stable	vst	Vesta Stable
vestchain	vest	VestChain
vestige	vest	Vestige
vethor-token	vtho	VeThor
vetme	vetme	VetMe
vetoken-finance	ve3d	veToken Finance
vetter-skylabs	vsl	Vetter Skylabs
vetter-token	vetter	Vetter
veusd	veusd	VeUSD
vexanium	vex	Vexanium
vfox	vfox	VFOX
viacoin	via	Viacoin
viagra-token	viagra	Viagra
vibe	vibe	VIBE
viberate	vib	Viberate
vibing	vbg	Vibing
vicat	vicat	ViCat
vica-token	vica	ViCA
vicdao-nelum	nelum	VICDAO NELUM
vicewrld	vicedao	ViceWRLD DAO
vicmove	vim	VicMove
vicstep	vic	VICSTEP
victoria-vr	vr	Victoria VR
victorum	vcc	Victorum
victory	avic	Victory
victory-gem	vtg	Victory Gem
vicuna	vina	VICUNA
videocoin	vid	Vivid Labs
vidiachange	vida	Vidiachange
vidt-dao	vidt	VIDT DAO
vidulum	vdl	Vidulum
vidy	vidy	VIDY
vidya	vidya	Vidya
vidyx	vidyx	VidyX
vig	vig	Vigor
vigorus	vis	Vigorus
viking-elon	velon	Viking Elon
vikings-valhalla	vv	Vikings Valhalla
vince-chain	vce	Vince Chain
vindax-coin	vd	VinDax Coin
vip-coin	vip	Vip Coin
viper	viper	Viper
viperpit	xviper	ViperPit
vips-token	vips	VIPS Token
vip-token	vip	VIP
viral	viral	Viral
vira-lata-finance	reau	Vira-Lata Finance
viral-inu	vinu	Viral Inu
viralup	viral	ViralUp
vires-finance	vires	Vires Finance
virgo	vgo	Virgo
virtualmeta	vma	Virtual Meta
virtual-reality-game-world	vrgw	Virtual Reality Game World
virtual-reality-glasses	vrg	Virtual Reality Glasses
virtual-tourist	vt	Virtual Tourist
virtual-trader	vtr	Virtual Trader
virtue	virtue	Virtue
virtue-poker	vpp	Virtue Poker Points
virtus-finance	vap	Virtus Finance
visio	visio	Visio
visiongame	vision	VisionGame
vision-metaverse	vs	Vision Metaverse
vision-network	vsn	Vision Network
visor	visr	Visor
vist	vist	VIST
vitadao	vita	VitaDAO
vita-inu	vinu	Vita Inu
vitality	vita	Vitality
vitall-markets	vital	Vitall Markets
vital-network	vital	Vital Network
vitamin-coin	vitc	Vitamin Coin
vite	vite	Vite
vitex	vx	ViteX Coin
vitoge	vitoge	Vitoge
vitteey	vity	Vitteey
viva	viva	Viva
viva-classic-2	viva	Viva Classic
vivaion	vivaion	Vivaion
vixco	vix	Vixco
vizslaswap	vizslaswap	VizslaSwap
vlaunch	vpad	VLaunch
vm-tycoons-businesses	businesses	VM Tycoons Businesses
vndc	vndc	VNDC
vnx-exchange	vnxlu	VNX Exchange
vnx-gold	vnxau	VNX Gold
vodra	vdr	Vodra
voice-street	vst	Voice Street
void-ad9a561a-8bca-4c17-9a3f-483f5cf20ac0	void	VOID
void-cash	vcash	void.cash
void-games	void	Void Games
volare-network	volr	Volare Network
volatility-protocol-token	vol	Volatility Protocol
volentix-vtx	vtx	Volentix
volt	acdc	Volt
voltage	volt	Voltage
volt-inu	volt	Volt Inu [OLD]
volt-inu-2	volt	Volt Inu
volt-protocol	volt	Volt Protocol
voltswap	volt	VoltSwap
voovoo	voo	VooVoo
vortex-defi	vtx	Vortex DeFi
vortex-protocol	vp	Vortex Protocol
voucher-dot	vdot	Voucher DOT
voucher-eth	veth	Voucher ETH
voucher-glmr	vglmr	Voucher GLMR
voucher-ksm	vksm	Voucher KSM
voucher-movr	vmovr	Voucher MOVR
vow	vow	Vow
voxel-x-network	vxl	Voxel X Network
vox-finance	vox	Vox.Finance
voxies	voxel	Voxies
voxnet	vxon	VoxNET
voyager	vgr	Voyager
voyce	voyce	Voyce
voyr	voyrme	VOYR
vpncoin	vash	VPNCoin
vr-blocks	vrblocks	VR Blocks
vres	vrs	VRES
vrjam	vrjam	VRJAM
vrynt	vrynt	VRYNT
vsolidus	vsol	VSolidus
v-systems	vsys	V.SYSTEMS
vulcan-forged	pyr	Vulcan Forged
vulcan-forged-lava	lava	Vulcan Forged LAVA
vulcano-2	vulc	Vulcano
vulkania-2	vlk	Vulkania
vulture-peak	vpk	Vulture Peak
vvs-finance	vvs	VVS Finance
vxxl	vxxl	VXXL
vybit	vi	Vybit
vyfinance	vyfi	VyFinance
vynk-chain	vync	VYNK Chain
wabi	wabi	Wabi
wadzpay-token	wtk	WadzPay
wagerr	wgr	Wagerr
waggle-network	wag	Waggle Network
wagie	wagie	WAGIE
wagmi	wagmi	WAGMI
wagmi-game-2	wagmigames	WAGMI Game
wagmi-on-solana	wagmi	WAGMI On Solana
wagyuswap	wag	WagyuSwap
waifer	waif	Waifer
waifu	waifu	Waifu
waifu-token	waif	Waifu Genesis Card Collection
waifu-vault-nftx	waifu	WAIFU Vault (NFTX)
wait	wait	WAIT
wakanda-inu	wkd	Wakanda Inu
waletoken	wtn	Wale
walken	wlkn	Walken
wallax	wlx	Wallax
wallet-defi	wdf	Wallet Defi
walletnow	wnow	WalletNow
wallet-plus-x	wpx	Wallet Plus X
wallet-swap	wswap	Wallet Swap
wallfair	wfair	Wallfair
wallphy	wallphy	Wallphy
wallstreetbets-com	wsb	Wallstreetbets.com
wall-street-bets-dapp	wsb	WallStreetBets DApp
wall-street-games	wsg	Wall Street Games
wall-street-inu	wallstreetinu	Wall Street Inu
wallstreetninja	wsn	WallStreetNinja
walrus	wlrs	Walrus
walter-inu	$winu	Walter Inu
waltonchain	wtc	Waltonchain
wam	wam	Wam
wanaka-farm	wana	Wanaka Farm
wanaka-farm-wairere-token	wai	Wanaka Farm WAIRERE
wanavax	wanavax	wanAVAX
wanbtc	wanbtc	wanBTC
wanchain	wan	Wanchain
wanda-exchange	we	Wanda Exchange
waneth	waneth	wanETH
wannaswap	wanna	WannaSwap
wanswap	wasp	WanSwap
wanusdc	wanusdc	wanUSDC
wanusdt	wanusdt	wanUSDT
wanxrp	wanxrp	wanXRP
war-bond	wbond	War Bond
warena	rena	Warena
warp-cash	warp	Warp Cash
warp-finance	warp	Warp Finance
warrior-rare-essentials	ware	Warrior Rare Essentials
warrior-token	war	Warrior
wasabix	wasabi	WasabiX
wasdaq-finance	wsdq	Wasdaq Finance
wasder	was	Wasder
waste-coin	waco	Waste Digital Coin
watchdo	wdo	WatchDO
wateenswap	wtn	Wateenswap
waterfall-finance	waterfall	Waterfall Finance
waterfall-governance-token	wtf	Waterfall Governance
water-reminder	water	Water Reminder
watr	watr	Watr
wattton	watt	WATTTON
waultswap	wex	WaultSwap
wavelength	wave	Wavelength
waves	waves	Waves
waves-community-token	wct	Waves Community
waves-ducks	egg	Waves Ducks
waves-enterprise	west	Waves Enterprise
waves-exchange	wx	WX.Network Token
wavesgo	wgo	WavesGo
wax	waxp	WAX
waxe	waxe	WAXE
wayawolfcoin	ww	WayaWolfCoin
waykichain	wicc	WaykiChain
waykichain-governance-coin	wgrt	WaykiChain Governance Coin
wazirx	wrx	WazirX
wb-mining	wbm	WB-Mining
wbnb	wbnb	Wrapped BNB
wbtc-yvault	yvwbtc	WBTC yVault
wdot	wdot	WDOT
wealthsecrets	wsc	WealthSecrets
wearesatoshi	n8v	NativeCoin
web3	web3.0	Web3
web3-betting	w3b	Web3 Betting
web3camp	3p	Web3Camp
web3-doge	web3	Web3 Doge
web3gold	wrb3g	Web3Gold
web3-inu	web3	WEB3 Inu
web5-inu	web5	WEB5 Inu
web69	web69	Web69
webchain	mintme	MintMe.com Coin
webdollar	webd	webdollar
webflix	wfx	WebFlix
web-four	webfour	WEBFOUR
weble-ecosystem-token	wet	Weble Ecosystem
webooswap	weboo	WebooSwap
webuy	we	WeBuy
wechain-coin	wxtc	WeChain Coin
wecoown	wcx	WeCoOwn
wednesday	wd	Wednesday
ween-token	weens	Ween
wegro	wegro	WeGro
wei	wei	WEI
weld	weld	WELD
wellness-convertible	wcv	Wellness Convertible
welltrado	wtl	Welltrado
we-love-gm	gm	we love gm
welups-blockchain	welups	Welups Blockchain
wemergetoken	mrg	WemergeToken
wemix-dollar	wemix$	WEMIX Dollar
wemix-token	wemix	WEMIX
wenlambo-2	wlbo	Wenlambo
wepiggy-coin	wpc	WePiggy Coin
wepower	wpr	WePower
wesendit	wsi	WeSendit
wesleep	wez	WeSleep
westarter	war	WeStarter
weta-vr	weta	WETA VR
wetc-hebeswap	wetc	WETC (HebeSwap)
weth	weth	WETH
weth-yvault	yvweth	WETH yVault
wettok-market	wto	Wettok Market
wetux	wetux	WETUX
weway	wwy	WeWay
weyu	weyu	WEYU
wgmi	wgmi	WGMI
whale	whale	WHALE
whale-coin	whale	Whale Coin
whale-fall	whale	Whale Fall
whale-maker-fund	wmf	Whale Maker Fund
whalemap	wmp	Whalemap
whaleroom	whl	WhaleRoom
whale-vault-nftx	whale	WHALE Vault (NFTX)
wheat-token	wheat	Wheat (BSC)
when-token	when	WhenHub
whey	whey	WHEY
whey-token	whey	Shredded Apes Whey
whitebit	wbt	WhiteBIT Token
whitecoin	xwc	Whitecoin
white-ethereum	white	White Ethereum
whiteheart	white	Whiteheart
whiteswap	wsd	WhiteSwap
whitex	whx	WhiteX
whive	whive	Whive
whole-earth-coin	wec	Whole Earth Coin
whole-network	node	Whole Network
wibx	wbx	WiBX
wicrypt	wnt	Wicrypt
widiland	widi	WidiLand
widi-soul	wso	Widi Soul
wifedoge	wifedoge	Wifedoge
wiggly-finance	wgl	Wiggly Finance
wigoswap	wigo	WigoSwap
wiki-cat	wkc	Wiki Cat
wild-beast-block	wbb	Wild Beast Block
wilder-world	wild	Wilder World
wild-island-game	wild	Wild Island Game
windex	wdex	Windex
windfall-token	wft	Windfall
winding-tree	lif	Lif
windoge95	wndg95	Windoge95
wine-protocol	wine	Wine Protocol
winerz	$wnz	Winerz
wine-shares	wine	Wine Shares
wing-finance	wing	Wing Finance
wingriders	wrt	WingRiders
wings	wings	Wings
wingswap	wis	WingSwap
wink	win	WINkLink
winklink-bsc	win	WINkLink BSC
winry-inu	winry	Winry Inu
winter	winter	Winter
winterdog	wdog	Winterdog
wipemyass	wipe	WipeMyAss
wirex	wxt	WXT Token
wirtual	wirtual	Wirtual
wise-token11	wise	Wise
wish-finance-2	wish	Wish Finance
wisteria-swap	wst	Wisteria Swap
witchain	wit	WITChain
witch-token	witch	Witch Token
witnet	wit	Witnet
wiva	wiva	WIVA
wizardia	wzrd	Wizardia
wizards-and-dragons	gp	Wizards And Dragons
wizard-token	wizard	Wizard BSC
wizard-token-8fc587d7-4b79-4f5a-89c9-475f528c6d47	wizt	Wizard Token
wizard-vault-nftx	wizard	WIZARD Vault (NFTX)
wizarre-scroll	scrl	Wizarre Scroll
wiz-protocol	wiz	WIZ Protocol
wjewel	wjewel	WJEWEL
wliti	wliti	wLITI
wlitidao	wld	wLitiDAO
wmatic	wmatic	Wrapped Matic
wodex	wmt	Wodex
wohlstand-token	wt	Wohlstand
wojak-finance	woj	Wojak Finance
wolfcoin	wolf	WOLFCOIN
wolfecoin	wolfe	Wolfecoin
wolf-game-wool	wool	Wolf Game Wool
wolf-pups-2	wolfies	WOLF PUPS
wolfsafepoorpeople	wspp	WolfSafePoorPeople
wolfsafepoorpeople-polygon	wspp	WolfSafePoorPeople Polygon
wolf-town-wool	wtwool	Wolf Town Wool
wolf-ventures	$wv	Wolf Ventures
wolfy	wolfy	WOLFY
wolverinu	wolverinu	WOLVERINU [OLD]
wolverinu-2	wolverinu	Wolverinu
wolves-of-wall-street	wows	Wolves of Wall Street
wombat	wombat	Wombat
wombat-exchange	wom	Wombat Exchange
wombex	wmx	Wombex
women-empowerment-token	wemp	Women Empowerment
wom-token	wom	WOM Protocol
wonderhero	wnd	WonderHero [OLD]
wonderhero-2	wnd	WonderHero
wonderhero-hon	hon	WonderHero HON
wonderland	time	Wonderland TIME
wonderman-nation	wndr	Wonderman Nation
woodcoin	log	Woodcoin
woof-token	woof	WOOF
woofwork-io	woof	WoofWork.io
woofy	woofy	Woofy
wool-token	wool	Wool
woo-network	woo	WOO Network
woonkly-power	woop	Woonkly Power
woop	woop	WOOP
woozoo-music	wzm	Woozoo Music
wordlex	wdx	Wordlex
workit	wkit	WORKIT
work-quest	wqt	Work Quest
worktips	wtip	Worktips
world-bet-inu	wbi	World Bet Inu
world-bet-token	wbt	World Bet Token
worldcoin	wdc	WorldCoin
worldcore	wrc	Worldcore
worldcup-fan-token-pow	wtf	WorldCup Fan Token PoW
world-cup-inu	wci	WORLD CUP INU
world-cup-willie	willie	World Cup Willie
world-football	wofo	World Football
world-mobile-token	wmt	World Mobile Token
world-of-defish	wod	World of Defish
world-of-farms	wof	World of Farms
world-of-waves	wow	World of Waves
world-pay-coin	wpc	World Pay Coin
worldpet	wpt	WORLDPET
world-token	world	World
worthwhile	whe	Worthwhile
wow100k	100k	Wow100K
wownero	wow	Wownero
wowswap	wow	WOWswap
wow-token	wow	WOWNFT
wozx	wozx	Efforce
wpp-token	wpp	WPP Token
wpt-investing-corp	wpt	WPT Investing Corp
wrap-governance-token	wrap	WRAP Governance
wrapped-accumulate	wacme	Wrapped Accumulate
wrapped-ada	wada	Wrapped ADA
wrapped-algo	xalgo	Wrapped ALGO
wrapped-ampleforth	wampl	Wrapped Ampleforth
wrapped-anatha	wanatha	Wrapped ANATHA
wrapped-ar	war	Wrapped AR
wrapped-astar	wastr	Wrapped Astar
wrapped-atromg8	wag8	Wrapped ATROMG8
wrapped-avax	wavax	Wrapped AVAX
wrapped-bch	wbch	Wrapped BCH
wrapped-bind	wbind	Wrapped BIND
wrapped-bitcoin	wbtc	Wrapped Bitcoin
wrapped-bitcoin-celer	cewbtc	Wrapped Bitcoin - Celer
wrapped-bitcoin-sollet	sobtc	Wrapped Bitcoin (Sollet)
wrapped-bitcoin-stacks	xbtc	Wrapped Bitcoin-Stacks
wrapped-bnb-celer	cewbnb	Wrapped BNB - Celer
wrapped-brise	wbrise	Wrapped Brise
wrapped-btt	wbtt	Wrapped BTT
wrapped-busd	wbusd	Wrapped BUSD
wrapped-busd-allbridge-from-bsc	abbusd	Wrapped BUSD (Allbridge from BSC)
wrapped-centrifuge	wcfg	Wrapped Centrifuge
wrapped-ckb	wckb	Wrapped CKB
wrapped-conflux	wcfx	Wrapped Conflux
wrapped-cro	wcro	Wrapped CRO
wrapped-cryptokitties	wck	Wrapped CryptoKitties
wrapped-cube	wcube	Wrapped Cube
wrapped-cusd-allbridge-from-celo	acusd	Wrapped CUSD (Allbridge from Celo)
wrapped-ecomi	womi	Wrapped ECOMI
wrapped-elastos	wela	Wrapped Elastos
wrapped-elrond	wegld	Wrapped EGLD
wrapped-energi	wnrg	Wrapped Energi
wrapped-ether-celer	ceweth	Wrapped Ether - Celer
wrapped-ethereum-sollet	soeth	Wrapped Ethereum (Sollet)
wrapped-ethw	wethw	Wrapped ETHW
wrapped-ever	wever	Wrapped Ever
wrapped-fantom	wftm	Wrapped Fantom
wrapped-fantom-celer	cewftm	Wrapped Fantom - Celer
wrapped-filecoin	wfil	Wrapped Filecoin
wrapped-flare	wflr	Wrapped Flare
wrapped-flow	wflow	Wrapped Flow
wrapped-gen-0-cryptokitties	wg0	Wrapped Gen-0 CryptoKitties
wrapped-hec	wshec	Wrapped HEC
wrapped-hoo	whoo	Wrapped HOO
wrapped-huobi-token	wht	Wrapped Huobi
wrapped-iotex	wiotx	Wrapped IoTex
wrapped-kava	wkava	Wrapped Kava
wrapped-kcs	wkcs	Wrapped KCS
wrapped-klay	wklay	Wrapped KLAY
wrapped-knoxfs	wkfx	Wrapped KnoxFS
wrapped-leo	wleo	Wrapped LEO
wrapped-memory	wmemo	Wonderful Memories
wrapped-metrix	mrxb	Wrapped Metrix
wrapped-millix	wmlx	Wrapped Millix
wrapped-moonbeam	wglmr	Wrapped Moonbeam
wrapped-moon-cats	mcat20	Wrapped Moon Cats
wrapped-ncg	wncg	Wrapped NCG
wrapped-near	wnear	Wrapped Near
wrapped-newyorkcoin	wnyc	Wrapped NewYorkCoin
wrapped-nxm	wnxm	Wrapped NXM
wrapped-oas	woas	Wrapped OAS
wrapped-okt	wokt	Wrapped OKT
wrapped-one	wone	Wrapped One
wrapped-paycoin	wpci	Wrapped Paycoin
wrapped-pkt	wpkt	Wrapped PKT
wrapped-pom	wpom	Wrapped POM
wrapped-reflect	wrft	Wrapped REFLECT
wrapped-shiden-network	sdn	Wrapped Shiden Network
wrapped-solana	sol	Wrapped Solana
wrapped-songbird	wsgb	Wrapped Songbird
wrapped-staked-scr	wsscr	Wrapped Staked SCR
wrapped-star	wstr	Wrapped Star
wrapped-statera	wsta	Wrapped Statera
wrapped-steth	wsteth	Wrapped stETH
wrapped-strax	wstrax	Wrapped Strax
wrapped-syscoin	wsys	Wrapped Syscoin
wrapped-telos	wtlos	Wrapped Telos
wrapped-terra	lunc	Wrapped Terra Classic
wrapped-tezos	wxtz	StakerDAO Wrapped Tezos
wrapped-tezos-2	wtz	Wrapped Tezos
wrapped-thunderpokt	wtpokt	Wrapped ThunderPOKT
wrapped-tomo	wtomo	Wrapped TOMO
wrapped-ton-crystal	wton	Wrapped TON Crystal
wrapped-tron	wtrx	Wrapped Tron
wrapped-turtlecoin	wtrtl	Wrapped TurtleCoin
wrapped-usdc	xusd	Wrapped USDC
wrapped-usdr	wusdr	Wrapped USDR
wrapped-usdt	wusdt	Wrapped USDT
wrapped-usdt-allbridge-from-polygon	apusdt	Wrapped USDT (Allbridge from Polygon)
wrapped-ust	ustc	Wrapped USTC
wrapped-velas	wvlx	Wrapped Velas
wrapped-virgin-gen-0-cryptokitties	wvg0	Wrapped Virgin Gen-0 CryptoKittties
wrapped-wan	wwan	Wrapped Wan
wrapped-wdoge	wwdoge	Wrapped WDOGE
wrapped-wwshib	wwshib	Wrapped WWSHIB
wrapped-xbtc	wxbtc	Wrapped xBTC
wrapped-xdai	wxdai	Wrapped XDAI
wrapped-xdc	wxdc	Wrapped XDC
wrapped-xmr-btse	wxmr	Wrapped XMR by BTSE
wrapped-xrp	wxrp	Wrapped XRP
wrapped-zcash	wzec	Wrapped Zcash
wrestling-shiba	wwe	Wrestling Shiba
wsb-sh	wsbt	WSB.sh
wtf-token	wtf	Fees.wtf
wusd	wusd	Wrapped USD
wwemix	wwemix	WWEMIX
wynd	wynd	WYND
x2	x2	X2
x-2	x	X
x2y2	x2y2	X2Y2
x42-protocol	x42	X42 Protocol
x7101	x7101	X7101
x7102	x7102	X7102
x7103	x7103	X7103
x7104	x7104	X7104
x7105	x7105	X7105
x7-coin	x7c	X7 Coin
x7dao	x7dao	X7DAO
x7r	x7r	X7R
x8-project	x8x	X8X
xaea-xii-token	xaea-xii	XAEA-Xii
xai	xai	XAI Stablecoin
xana	xeta	XANA
xank	xank	Xank
xaurum	xaur	Xaurum
xave-coin	xvc	Xave Coin
xave-token	xav	Xave
xaviera-tech	xts	Xaviera Tech
xaviera-techno-solutions	xts	Xaviera Techno Solutions
xbe-token	xbe	XBE
xbit	xbt	Xbit
x-blox	xbx	X-BLOX
xbn	xbn	Elastic BNB
xbn-community-token	xbc	XBN Community
xbullion	gold	XBullion
xbullion_silver	silv	XBullion Silver
xcad-network	xcad	XCAD Network
x-capital	xcap	X Capital
xcarnival	xcv	XCarnival
x-cash	xcash	X-CASH
xcavator	xca	Xcavator
xcdot	xcdot	xcDOT
xcel-swap	xld	Xcel Defi
xceltoken-plus	xlab	XCELTOKEN PLUS
xcf-token	xcf	XCF Token
xcksm	xcksm	xcKSM
xcom	xc	XCOM
x-consoles	game	X-Consoles
xcrx	xcrx	xCRX
xdai	xdai	XDAI
xdai-native-comb	xcomb	xDai Native Comb
xdai-stake	stake	STAKE
xdao	xdao	XDAO
xdce-crowd-sale	xdc	XDC Network
xdefi	xdefi	XDEFI
xdefi-governance-token	xdex	XDEFI Governance
xdeus	xdeus	xDEUS
xdoge	xdoge	Xdoge
xdollar-stablecoin	xusd	xDollar Stablecoin
x-ecosystem	xeco	X Ecosystem
xels	xels	XELS
xen-crypto	xen	XEN Crypto
xend-finance	xend	Xend Finance
xenios	xnc	Xenios
xeniumx	xemx	Xeniumx
xenoruntoken	xrt	XenoRunToken
xeno-token	xno	Xeno
xensor	xsr	Xensor
xeta	x3ta	XETA
xeus	xeus	XEUS
xfarmer	xf	xFarmer
xfinance	xfi	Xfinance
xfinite-entertainment-token	xet	Xfinite Entertainment
xfit	xfit	Xfit
xfuel	xfuel	XFUEL
xfund	xfund	xFUND
xgold-coin	xgold	Xgold Coin
x-hash	xsh	X-HASH
xhashtag	xtag	xHashtag
xhype	xhp	XHYPE
xiamipool	xmpt	XiamiPool
xiasi-inu	xiasi	Xiasi Inu
xiden	xden	Xiden
xido-finance	xido	Xido Finance
xiglute-coin	xgc	Xiglute Coin
xio	xio	Blockzero Labs
xion-finance	xgt	Xion Finance
xiotri	xiot	Xiotri
xi-token	xi	Xi
xjewel	xjewel	xJEWEL
xlist	xlist	XList
xl-moon	xlmn	XL-Moon
xmark	xmark	xMARK
x-mask	xmc	X-MASK
xmatic	xmatic	xMATIC
xmax	xmx	XMax
xmetaversal	xmeta	XMetaversal
x-metaverse	xmeta	X-Metaverse
xmine	xmn	Xmine
xmon	xmon	XMON
xmooney	xm	xMooney
xnft	xnft	xNFT Protocol
xodex	xodex	Xodex
xoloitzcuintli	xolo	xoloitzcuintli
xov	xov	XOVBank
xoycoin	xoy	XOYCoin
xp	xp	XP
xpansion-game	xps	Xpansion Game
xpendium	xpnd	Xpendium
xperps	xperps	xPERPS
xpla	xpla	XPLA
xplus-token	xpt	XPLUS Token
xpmarket	xpm	XPmarket
xp-network	xpnet	XP Network
xpool	xpo	Xpool
xpop	xpop	XPOP
xpose-protocol	xp	Xpose Protocol
xproject	xpro	XPROJECT
x-protocol	pot	X Protocol
xptp	xptp	xPTP
xquake	xqk	XQuake
xrdoge	xrdoge	XRdoge
xreators	ort	XREATORS
xrhodium	xrc	xRhodium
xriba	xra	Xriba
xrice-token	xrice	xRice Token
xrpaynet	xrpaynet	XRPayNet
xrp-classic-2	xrpc	XRP Classic
xrpfarm	xf	XRPFarm
xr-shiba-inu	xrshib	XR Shiba Inu
xrun	xrun	XRun
xsauce	xsauce	xSAUCE
xsgd	xsgd	XSGD
xshare	xshare	SpaceShipX
xsigma	sig	xSigma
xsl-labs	syl	XSL Labs
xspectar	xspectar	xSPECTAR
xstudio	txs	XStudio
xsushi	xsushi	xSUSHI
xswap	xsp	XSwap
xswap-protocol	xsp	XSwap Protocol
xswap-treasure	xtt	XSwap Treasure
xtal	xtal	XTAL
xtblock-token	xtt-b20	XTblock
xtcom-token	xt	XT.com
xtime	xtm	XTime
xtoken	xtk	xToken
xtrabytes	xby	XTRABYTES
xtremcoin	xtr	Xtremcoin
xtrm	xtrm	XTRM
xtusd	xtusd	XT Stablecoin XTUSD
xuez	xuez	Xuez Coin
xungible	xgbl	Xungible
xusd	xusd	xUSD
xusd-babelfish	xusd	XUSD (BabelFish)
xusd-token	xusd	xUSD Token
xverse	xvc	Xverse
xwalrus	xwlrs	xWalrus
xwin-finance	xwin	xWIN Finance
x-world-games	xwg	X World Games
xxcoin	xx	XX Network
xx-platform	xxp	XX Platform
xy-finance	xy	XY Finance
xyo-network	xyo	XYO Network
xysl	xysl	xYSL
y2b	y2b	Y2B
y2k	y2k	Y2K
y-5-finance	y5	Y5 Crypto
y5-trader	y5tt	Y5 Trader
yacoin	yac	YACoin
yadacoin	yda	YadaCoin
yaki-gold	yag	Yaki Gold
yaku	yaku	Yaku
yakushima	forest	YAKUSHIMA
yam-2	yam	YAM
yamp-finance	yamp	Yamp Finance
yam-v2	yamv2	YAM v2
yarloo	yarl	Yarloo
yas	yas	YAS
yasha-dao	yasha	YASHA
yawww	yaw	Yawww
yaxis	yaxis	yAxis
yay-games	yay	YAY Games
yayo-coin	yayo	Yayo Coin
yayswap	yay	YaySwap
ycash	yec	Ycash
yclub	syc	YCLUB
y-coin	yco	Y Coin
ydragon	ydr	YDragon
yearn-classic-finance	earn	Yearn Classic Finance
yearn-crv	ycrv	Yearn CRV
yearn-finance	yfi	yearn.finance
yearn-finance-bit2	yfb2	Yearn Finance Bit2
yearn-finance-diamond-token	yfdt	Yearn Finance Diamond
yearn-finance-management	yefim	Yearn Finance Management
yearn-finance-passive-income	yfpi	Yearn Finance Passive Income
yearnlab	ylb	Yearnlab
yearn-lazy-ape	yla	Yearn Lazy Ape
yearn-secure	ysec	Yearn Secure
yee	yee	Yee
yeld-finance	yeld	Yeld Finance
yel-finance	yel	Yel.Finance
yellowheart-protocol	hrts	YellowHeart Protocol
yellow-road	road	Yellow Road
yeni-malatyaspor-token	yms	Yeni Malatyaspor Token
yenten	ytn	YENTEN
yeon	yeon	Yeon
yesorno	yon	YESorNO
yes-token	yes	YES Token
yes-world	yes	Yes World
yeticoin	yetic	YetiCoin
yeti-finance	yeti	Yeti Finance
yfdai-finance	yf-dai	YfDAI.finance
yfe-money	yfe	YFE Money
yffi-finance	yffi	yffi finance
yfii-finance	yfii	DFI.money
yfii-gold	yfiig	YFII Gold
yfione	yfo	YFIONE
yfi-yvault	yvyfi	YFI yVault
yflink	yfl	YF Link
yfox-finance	yfox	YFOX Finance
yfx	yfx	Your Futures Exchange
yield-app	yld	Yield App
yieldblox	ybx	YieldBlox
yield-generating-enreach	ygnrch	Yield Generating Enreach
yield-guild-games	ygg	Yield Guild Games
yieldification	ydf	Yieldification
yieldly	yldy	Yieldly
yield-optimization-platform	yop	Yield Optimization Platform & Protocol
yield-parrot	lory	Yield Parrot
yield-protocol	yield	Yield Protocol
yieldwatch	watch	Yieldwatch
yield-yak	yak	Yield Yak
yield-yak-avax	yyavax	Yield Yak AVAX
yin-finance	yin	YIN Finance
yinyang	yy	YinYang
ymplepay	ympa	YmplePay
yobit-token	yo	Yobit
yocoin	yoc	Yocoin
yocoinyoco	yoco	YocoinYOCO
yoda-coin-swap	jedals	Yoda Coin Swap
yodeswap	yode	YodeSwap
yofune-nushi	koyo	Yofune Nushi
yogo	yogo	Yogo
yohero	yo	YoHero
yohero-yhc	yhc	YoHero (YHC)
yokaiswap	yok	YokaiSwap
yokcoin	yok	YOKcoin
yolo-cash	ylc	YOLOCash
yooshi	yooshi	YooShi
yoplex	yplx	Yoplex
yoshi-exchange	yoshi	Yoshi.exchange
youbie	$youb	Youbie
youcash	youc	YOUcash
you-chain	you	YOU Chain
youclout	yct	Youclout
youcoin-metaverse	ucon	YouCoin Metaverse
youliveeveryday	ule	YouLiveEveryday
youminter	umint	YouMinter
young-boys-fan-token	ybo	Young Boys Fan Token
youngparrot	ypc	YoungParrot
yourkiss	yks	YourKiss
yourwallet	yourwallet	YourWallet
yourwallet-eth	yourwallet	YourWallet ETH
youves-uusd	uusd	Youves uUSD
youves-you-governance	you	Youves YOU Governance
youwho	you	Youwho
yoyow	yoyow	YOYOW
ysl	ysl	YSL
ysoy-chain	ysoy	YSOY Chain
ystar	ysr	Ystar
ytofu	ytofu	yTOFU
ytv-coin	ytv	YTV Coin
yuan-chain-coin	ycc	Yuan Chain Coin
yu-coin-2	yucj	Yu Coin
yugi	yugi	Yugi
yummy	yummy	Yummy
yup	yup	Yup
yusd-stablecoin	yusd	YUSD Stablecoin
yuse	yuse	Yuse
yuzuswap	yuzu	YuzuSwap
yvault-lp-ycurve	yvault-lp-ycurve	yUSD
yvboost	yvboost	Yearn Compounding veCRV yVault
yvdai	yvdai	yvDAI
yvs-finance	yvs	YVS Finance
yye-energy	yye	YYE Energy
yzz	yzz	YZZ
z7dao	z7	Z7DAO
zabaku-inu	zabaku	Zabaku Inu
zada	zada	Zada
zaif-token	zaif	Zaif
zakumifi	zafi	ZakumiFi
zambesigold	zgd	ZambesiGold
zam-io	zam	Zam.io
zamzam	zamzam	ZAMZAM
zano	zano	Zano
zap	zap	Zap
zappay	zapc	Zappay
zappy	zap	Zappy
zarcash	zarh	Zarhexcash
zarp-stablecoin	zarp	ZARP Stablecoin
zasset-zusd	zusd	Zasset zUSD
zatcoin-2	zpro	ZAT Project
zb-token	zb	ZB
zcash	zec	Zcash
zclassic	zcl	Zclassic
zcoin	firo	Firo
zcore	zcr	ZCore
zcore-finance	zefi	ZCore Finance
zebec-protocol	zbc	Zebec Protocol
zebi	zco	Zebi
zebra-dao	zebra	Zebra DAO
zed-run	zed	ZED RUN
zedxion	zedxion	Zedxion
zedxion-usdz	usdz	Zedxion USDZ
zeedex	zdex	Zeedex
zeepin	zpt	Zeepin
zeitcoin	zeit	Zeitcoin
zeitgeist	ztg	Zeitgeist
zelaanft-2	nftz	ZelaaNFT
zelaapayae	zpae	ZelaaPayAE
zelcash	flux	Flux
zelda-inu	zlda	Zelda Inu
zeloop-eco-reward	erw	ZeLoop Eco Reward
zelwin	zlw	Zelwin
zenad	znd	Zenad
zencash	zen	Horizen
zenc-coin	zenc	Zenc Coin
zenfuse	zefu	Zenfuse
zenith-chain	zenith	Zenith Chain
zenith-finance	znt	Zenith Finance
zenlink-network-token	zlk	Zenlink Network
zennies	zeni	Zennies
zenon	znn	Zenon
zensports	sports	ZenSports
zenswap-network-token	znt	Zenswap Network ZNT
zent-cash	ztc	Zent Cash
zenzo	znz	ZENZO
zeon	zeon	ZEON Network
zeos	zeos	ZEOS
zeptagram	zptc	Zeptacoin
zer0zer0	00	00 Token
zero	zer	Zero
zero-exchange	zero	0.exchange
zerohybrid	zht	ZeroHybrid Network
zeronauts	zns	Zeronauts
zeroswap	zee	ZeroSwap
zero-tech	zero	Zero Tech
zero-utility-token	zut	Zero Utility
zerox	zerox	ZeroX
zerozed	x0z	Zerozed
zetachain	zeta	ZetaChain
zetacoin	zet	Zetacoin
zeto	ztc	ZeTo
zetrix	ztx	Zetrix
zeus10000	zeus10000	ZEUS10000
zeus-finance	zeus	Zeus Finance
zeusshield	zsc	Zeusshield
zfmcoin	zfm	ZFMCOIN
zhc-zero-hour-cash	zhc	ZHC : Zero Hour Cash
zibu	zibu	Zibu
zignaly	zig	Zignaly
zigzag-2	zz	ZigZag
zik-token	zik	Ziktalk
zilchess	zch	ZilChess
zillion-aakar-xo	zillionxo	Zillion Aakar XO
zillioncoin	zln	ZillionCoin
zilliqa	zil	Zilliqa
zilpay-wallet	zlp	ZilPay Wallet
zilstream	stream	ZilStream
zilswap	zwap	ZilSwap
zilwall	zwall	ZilWall
zilwall-paint	zpaint	ZilWall Paint
zimbocash	zash	ZIMBOCASH
zin	zin	Zin
zinari	zina	ZINARI
zinja	z	Zinja
ziobitx	zbtx	ZiobitX
zion	zion	Zion
ziontopia	zion	ZionTopia
ziot	ziot	Ziot
zip	zip	Zipper Network
zipmex-token	zmt	Zipmex
zippie	zipt	Zippie
zipswap	zip	ZipSwap
zircon-gamma-token	zrg	Zircon Gamma Token
ziticoin	ziti	Ziticoin
zjoe	zjoe	zJOE
zkb	zkb	ZK Cross Chain Bridge
zklend	zend	zkLend
zknftex	$zkn	zkNFTex
zkspace	zks	ZKSpace
zlot	zlot	zLOT
zmine	zmn	ZMINE
zodiacsv2	zdcv2	ZodiacsV2
zodium	zodi	Zodium
zogi	zogi	ZOGI
zoid-pay	zpay	ZoidPay
zombie-inu	zinu	Zombie Inu (OLD)
zombie-inu-2	zinu	Zombie Inu
zombie-runner	zombie	Zombie Runner
zombie-skrat	zskrat	ZOMBIE SKRAT
zombie-world-z	zwz	Zombie World Z
zomfi	zomfi	Zomfi
zomi	zomi	ZOMI
zone	zone	Zone
zonecoin	zne	Zonecoin
zone-of-avoidance	zoa	Zone of Avoidance
zoo-coin	zoo	ZooCoin
zoo-crypto-world	zoo	ZOO Crypto World
zoodao	zoo	ZooDAO
zookeeper	zoo	ZooKeeper
zoo-labs	zoo	Zoo Labs
zoomswap	zm	ZoomSwap
zoopad	zoopad	ZOOPAD
zooshi	zooshi	Zooshi
zoo-token	zoot	Zoo
zoracles	zora	Zoracles
zoro-inu	zoro	Zoro Inu
zrcoin	zrc	ZrCoin
zro	zro	Carb0n.fi
zudgezury	zzc	ZudgeZury
zufinance	zuf	ZuFinance
zuki-moba	zuki	Zuki Moba
zum-token	zum	ZUM
zuna	zuna	Zuna
zunami-protocol	uzd	Zunami USD
zupi-coin	zupi	Zupi Coin
zuplo	zlp	Zuplo
zurrency	zurr	ZURRENCY
zusd	zusd	ZUSD
zuz-protocol	zuz	ZUZ Protocol
z-versus-project	zversus	Z Versus Project
zyberswap	zyb	Zyberswap
zynecoin	zyn	Zynecoin
zyro	zyro	Zyro
zyrri	zyr	Zyrri
zyx	zyx	ZYX
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
19	2023-02-17	bitcoin	2	\N	amazing	\N
31	2023-02-24	ethereum	4	b8579086-35b6-4fc2-8e66-8a71a808f835	2	4
34	2023-02-09	dogecoin	4	\N	2	4
35	2023-02-23	dogecoin	6664	b8579086-35b6-4fc2-8e66-8a71a808f835	2	4
36	2023-02-24	ethereum	5	b8579086-35b6-4fc2-8e66-8a71a808f835	eeeeeeeeeaahhr	5
32	2023-02-12	ethereum	4445555	b8579086-35b6-4fc2-8e66-8a71a808f835	this is a test the date should be 0/2/14/2023	4444
39	2023-03-17	bitcoin	4	8aed2197-e6c4-4da8-a0c0-45d00674320d	4aegaed	4
40	2023-03-06	bitcoin	61	6c4c3d79-e56b-45a2-856b-2ecb5c1b5eb4	6geagdeag	5
47	2023-03-24	bitcoin	552	9f4e92f4-2734-4dbb-abc4-f2c3f7aeff05		4
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

