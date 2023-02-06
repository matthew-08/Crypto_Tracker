import React, { useEffect, useState } from 'react';
import styles from './cards.module.css';
import currencyAdjust from '../../../../../utils/currencyAdjust';
import { Card } from './Card';
import { CoinData } from '../../../../../types/types';

export function Cards({ userCoins }: { userCoins: CoinData }) {
  const [passedUserCoins, setPassedUserCoins] = useState<CoinData[]>([] as CoinData[]);

  useEffect(() => {
    const defaultCoins = ['bitcoin', 'ethereum', 'dogecoin'];
    const fetchCoins = async () => {
      try {
        const result:CoinData[] = [];
        const res = await Promise.all(defaultCoins.map((c) => fetch(`https://api.coingecko.com/api/v3/coins/${c}?localization=false&tickers=false&market_data=true&developer_data=true`)));
        const resJson = await Promise.all(res.map((c) => c.json()))
          .then((response) => response.forEach((c) => {
            const coinData: CoinData = {
              name: c.name,
              id: c.id,
              symbol: c.symbol.toUpperCase(),
              image: c.image.large,
              marketData: {
                current: currencyAdjust(c.market_data.current_price.usd),
                low24: currencyAdjust(c.market_data.low_24h.usd),
                high24: currencyAdjust(c.market_data.high_24h.usd),
                capPercentage: `${c.market_data.market_cap_change_percentage_24h}%`,
              },
            };
            result.push(coinData);
            setUserCoins(result);
          }));
      } catch (error) {
        console.log(error);
      }
    };
    fetchCoins();
  }, []);

  useEffect(() => {
    console.log(userCoins);
  }, [userCoins]);

  return (
    <section
      className={styles.cards}
    >
      {userCoins && userCoins.map((coin) => (
        <Card
          coinData={coin}
        />
      ))}
    </section>
  );
}
