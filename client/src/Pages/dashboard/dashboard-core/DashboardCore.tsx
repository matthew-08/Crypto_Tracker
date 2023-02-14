import React, { useState, useEffect } from 'react';
import styles from './dashboardcore.module.css';
import { DashboardBottom } from './dashboard-core-bottom/DashboardBottom';
import { UserInfo, CoinData, Transaction } from '../../../types/types';
import { UserInfoSection } from './UserInfo/UserInfoSection';
import { DashboardGraph } from './dashboard-graph/DashboardGraph';
import currencyAdjust from '../../../utils/currencyAdjust';

const combineTransactions = (
  transactions:Transaction[],
  coinId: string,
) => transactions.filter(({ coin }) => coin === coinId);

export default function DashboardCore({ userInfo, reRenderUser }:
{ userInfo: UserInfo,
  reRenderUser: () => Promise<void>
}) {
  const [userCoins, setUserCoins] = useState([] as CoinData[]);

  const fetchCoins = async () => {
    try {
      const { coins } = userInfo;
      const result:CoinData[] = [];
      const res = await Promise.all(coins.map((c) => fetch(`https://api.coingecko.com/api/v3/coins/${c}?localization=false&tickers=false&market_data=true&developer_data=true`)));
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
              capPercentage: c.market_data.market_cap_change_percentage_24h,
            },
            transactions: combineTransactions(userInfo.transactions, c.id),
          };
          result.push(coinData);
          console.log(result);
          setUserCoins(result);
        }));
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    if (userInfo.coins) {
      console.log(userInfo);
      fetchCoins();
    }
  }, [userInfo]);

  const addToCoinList = async (coinId:string | number) => {
    const addCoin = await fetch(`http://localhost:8000/add/coin?coinId=${coinId}`, {
      credentials: 'include',
      method: 'PUT',
    }).then((res) => reRenderUser());
  };
  return (
    <>
      <header
        className={styles.header}
      >
        <h1>Dashboard</h1>
        <UserInfoSection
          userInfo={userInfo}
        />

      </header>
      {
        userCoins.length >= 1
        && (
        <DashboardGraph
          coinToGraph={userCoins[0].name}
        />
        )
}
      <DashboardBottom
        userCoins={userCoins}
        addToCoinList={addToCoinList}
        userTransactions={userInfo.transactions}
        updateUser={reRenderUser}
      />

    </>
  );
}
