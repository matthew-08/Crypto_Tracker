import { CoinData } from '../types/types';
import apiURL from './apiURL';
import currencyAdjust from './currencyAdjust';
import combineTransactions from './combineTransactions';

type AddCoin = {
  mainPath: 'coins';
  coinId: string | number;
};
type Args = AddCoin;

const coinHandler = async ({ mainPath, coinId }: Args) => {
  try {
    await fetch(`${apiURL}/${mainPath}?coinId=${coinId}`, {
      credentials: 'include',
      method: 'PUT',
    });
  } catch (error) {
    console.log(error);
  }
};

const fetchAllCoins = async (coins: string[]) => {
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
          transactions: combineTransactions(userInfo.transactions, c.id),
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

export default coinHandler;
export { fetchAllCoins };
