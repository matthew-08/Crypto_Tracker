import {
  CoinData,
  UserInfo,
  ParsedCoins,
  DetailedCoinData,
  ServerCoin,
} from '../types/types';
import apiURL from './apiURL';
import currencyAdjust from './currencyAdjust';
import combineTransactions from './combineTransactions';

type AddCoin = {
  mainPath: 'coins';
  coinId: string | number;
  type: 'put';
};
type DeleteCoin = {
  mainPath: 'coins';
  coinId: string | number;
  type: 'delete';
};

const HTTPVerbs = {
  delete: 'DELETE',
  put: 'PUT',
};
type Args = AddCoin | DeleteCoin;

const coinHandler = async ({ mainPath, coinId, type }: Args) => {
  try {
    await fetch(`${apiURL}/${mainPath}?coinId=${coinId}`, {
      credentials: 'include',
      method: HTTPVerbs[type],
    });
  } catch (error) {
    console.log(error);
  }
};

const fetchAllCoins = async (userInfo: UserInfo) => {
  const { coins, transactions } = userInfo;
  try {
    const result: CoinData[] = [];
    const res = await Promise.all(
      coins.map((c) =>
        fetch(
          `https://api.coingecko.com/api/v3/coins/${c}?localization=false&tickers=false&market_data=true&developer_data=true`
        )
      )
    );
    await Promise.all(res.map((c) => c.json())).then((response) =>
      response.forEach((c) => {
        const cData: CoinData = {
          name: c.name,
          id: c.id,
          symbol: c.symbol.toUpperCase(),
          image: c.image.large,
          marketData: {
            current: currencyAdjust(c.market_data.current_price.usd),
            low24: currencyAdjust(c.market_data.low_24h.usd),
            high24: currencyAdjust(c.market_data.high_24h.usd),
            capPercentage: c.market_data.market_cap_change_percentage_24h,
          },
          transactions: combineTransactions(transactions, c.id),
        };
        result.push(cData);
        return result;
      })
    );
    return result;
  } catch (error) {
    return console.log(error);
  }
};

const searchCoins = async (input: string) => {
  const matchingCoins = await fetch(`${apiURL}/search/coins?coin=${input}`, {
    credentials: 'include',
  });
  const parseCoins: ParsedCoins = await matchingCoins.json();
  const extractArray = await parseCoins.rows;
  return extractArray;
};

const fetchCoinDetails = async (coin: ServerCoin) => {
  const fetchCoin = await fetch(
    `https://api.coingecko.com/api/v3/coins/${coin.coin_id}`
  )
    .then((res) => res.json())
    .then((res: Record<string, any>) => {
      const obj: DetailedCoinData = {
        id: res.id,
        image: res.image.large,
        name: res.name,
        symbol: res.symbol,
        marketData: {
          capPercentage: '',
          current: res.market_data.current_price.usd,
          description: res.description,
          high24: res.market_data.high_24h.usd,
          low24: res.market_data.low_24h.usd,
          links: {
            facebook: res.links.facebook_username,
            reddit: res.links.subreddit_url,
            twitter: res.links.twitter_screen_name,
          },
          marketCap: res.market_data.market_cap.usd,
          maxSupply: res.market_data.max_supply,
          socialMediaStats: {
            facebookLikes: res.community_data.facebook_likes,
            redditSubscribers: res.community_data.reddit_subscribers,
            twitterFollowers: res.community_data.twitter_followers,
          },
          totalSupply: res.market_data.total_supply,
          percent1h: {
            btc: res.market_data.price_change_percentage_1h_in_currency.btc,
            eth: res.market_data.price_change_percentage_1h_in_currency.eth,
            usd: res.market_data.price_change_percentage_1h_in_currency.usd,
          },
          percent24h: {
            btc: res.market_data.price_change_percentage_24h_in_currency.btc,
            eth: res.market_data.price_change_percentage_24h_in_currency.eth,
            usd: res.market_data.price_change_percentage_24h_in_currency.usd,
          },
          percent30d: {
            btc: res.market_data.price_change_percentage_30d_in_currency.btc,
            eth: res.market_data.price_change_percentage_30d_in_currency.eth,
            usd: res.market_data.price_change_percentage_30d_in_currency.usd,
          },
          percent7d: {
            btc: res.market_data.price_change_percentage_7d_in_currency.btc,
            eth: res.market_data.price_change_percentage_7d_in_currency.eth,
            usd: res.market_data.price_change_percentage_7d_in_currency.usd,
          },
          volume: res.market_data.total_volume.usd,
          allTimeHigh: res.market_data.ath.usd,
          allTimeLow: res.market_data.atl.usd,
          circulating_supply: res.market_data.circulating_supply,
          market_cap_change_percentage_24h:
            res.market_cap_change_percentage_24h,
        },
      };
      return obj;
    });
  return fetchCoin;
};

export default coinHandler;
export { fetchAllCoins, searchCoins, fetchCoinDetails };
