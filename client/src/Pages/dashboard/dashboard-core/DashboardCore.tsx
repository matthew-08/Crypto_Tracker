import React, { useState, useEffect } from 'react';
import styles from './dashboardcore.module.css';
import { DashboardBottom } from './dashboard-core-bottom/DashboardBottom';
import { UserInfo, CoinData } from '../../../types/types';
import { UserInfoSection } from './UserInfo/UserInfoSection';
import { DashboardGraph } from './dashboard-graph/DashboardGraph';
import currencyAdjust from '../../../utils/currencyAdjust';

export default function DashboardCore({ userInfo }:{ userInfo: UserInfo }) {
  const [userCoins, setUserCoins] = useState([] as CoinData[]);

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
  return (
    <>
      <header
        className={styles.header}
      >
        <UserInfoSection
          userInfo={userInfo}
        />

      </header>
      <DashboardGraph />
      <DashboardBottom />

    </>
  );
}
