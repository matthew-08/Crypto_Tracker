import React, { useEffect } from 'react';
import { v4 as uuid } from 'uuid';
import styles from './portfolio.module.css';
import { CoinData } from '../../../../../types/types';
import { Tablerow } from './Tablerow';
import { CoinConverter } from '../../../../../Components/CoinConverter/CoinConverter';

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

export function Portfolio({ userCoins, userTransactions }: {
  userCoins: CoinData[],
  userTransactions: UserTransctions[],
}) {
  const mergeCoins = () => {
    // transactions, coin.id
    userCoins.forEach((coin) => {
      const getTransactions = userTransactions.filter(({ coin_id }) => coin_id === coin.id);
      // eslint-disable-next-line no-param-reassign
      coin.transactions = getTransactions;
    });
    console.log(userCoins);
  };
  useEffect(() => {
    mergeCoins();
  });

  return (
    <>
      <header
        className={styles.header}
      >
        <div
          className={styles['stats-container']}
        >
          <p>Total Balance:</p>
          <span>$10000</span>
        </div>

        <div
          className={styles['stats-container']}
        >
          <p>Total Balance:</p>
          <span>$10000</span>
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
            key={uuid()}
            coinData={coin}
          />
        ))}
      </table>
      <div />
    </>
  );
}
