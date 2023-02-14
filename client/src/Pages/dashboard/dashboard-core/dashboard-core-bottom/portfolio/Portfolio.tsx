/* eslint-disable no-param-reassign */
/* eslint-disable no-return-assign */
import React, { useEffect, useState } from 'react';
import { v4 as uuid } from 'uuid';
import styles from './portfolio.module.css';
import { CoinData, Transaction, CoinId } from '../../../../../types/types';
import { Tablerow } from './Tablerow';
import { CoinConverter } from '../../../../../Components/CoinConverter/CoinConverter';
import { CoinPercentage } from '../../../../../Components/CoinDetails/CoinPercentage/CoinPercentage';

interface PortfolioInfo {
  totalBalance: number,
  '24hPortfolioChange': number,
}

interface SimpleMarketData {
  current: number | string,
  low24: number | string,
  high24: number | string,
  capPercentage: number | string,
}

interface UserTransctions {
  transaction_id: number,
  transaction_date: Date,
  coin_id: string,
  quantity: number
}

export function Portfolio({ userCoins, userTransactions, updateUser }: {
  userCoins: CoinData[],
  userTransactions: Transaction[],
  updateUser: () => Promise<void>
}) {
  const [userStats, setUserStats] = useState({
    total: 0,
    '24hChange': 0,
  });
  useEffect(() => {
    console.log(userTransactions);
    if (userTransactions && userTransactions.length > 0) {
      const userTotal = userTransactions
        .reduce((acc, { price, quantity }) => {
        // eslint-disable-next-line no-param-reassign
          acc += (Number(price) * Number(quantity));
          return acc;
        }, 0);
      console.log(userTotal);
      const transactionCoins = userTransactions.map((transaction) => transaction.coin);
      const removeDuplications:CoinId[] = [...new Set(transactionCoins)];
      const getTotalPercentageChange = userCoins.map((coin) => {
        if (removeDuplications.includes(coin.id)) {
          return coin.marketData.capPercentage;
        }
      }) as number[];
      const finalPercentage = getTotalPercentageChange
        .reduce((acc, total) => acc += total, 0);
      setUserStats((prev) => ({
        ...prev,
        total: userTotal,
        '24hChange': finalPercentage,
      }));

      console.log(userTotal);
    }
  }, [userTransactions]);

  return (
    <>
      <header
        className={styles.header}
      >
        <div
          className={styles['stats-container']}
        >
          <p>Total Balance:</p>
          <span
            className={styles.total}
          >
            {' '}
            $
            {' '}
            {userStats.total}
          </span>
        </div>

        <div
          className={styles['stats-container']}
        >
          <p>24h Change:</p>
          <CoinPercentage
            percentage={userStats['24hChange']}
            size="2rem"
          />
        </div>
      </header>
      <table
        className={styles.table}
      >
        <thead>
          <tr>
            <th>
              Coin
            </th>
            <th>
              Price
            </th>
            <th>
              Holdings
            </th>
            <th />
          </tr>

        </thead>
        {userCoins && userCoins.map((coin) => (
          <Tablerow
            updateUser={updateUser}
            key={uuid()}
            coinData={coin}
          />
        ))}
      </table>
      <div />
    </>
  );
}
