/* eslint-disable jsx-a11y/control-has-associated-label */
/* eslint-disable no-param-reassign */
/* eslint-disable no-return-assign */
import React, { useEffect, useState } from 'react';
import { v4 as uuid } from 'uuid';
import styles from './portfolio.module.css';
import {
  CoinData, Transaction, CoinId,
} from '../../../../../types/types';
import { Tablerow } from './Tablerow';
import { CoinConverter } from '../../../../../Components/CoinConverter/CoinConverter';
import { CoinPercentage } from '../../../../../Components/CoinDetails/CoinPercentage/CoinPercentage';
import { Stats } from './Stats/Stats';

export function Portfolio({
  userCoins, userTransactions, updateUser, focusSearchBar,
}: {
  userCoins: CoinData[],
  userTransactions: Transaction[],
  updateUser: () => Promise<void>,
  focusSearchBar: () => void

}) {
  const [userStats, setUserStats] = useState({
    total: 0,
    '24hChange': 0,
  });
  useEffect(() => {
    if (userCoins.length > 0 && userTransactions.length > 0) {
      /* addTransactions(userCoins, userTransactions); */
      const userTotal = userTransactions
        .reduce((acc, { price, quantity }) => {
        // eslint-disable-next-line no-param-reassign
          acc += (Number(price) * Number(quantity));
          return acc;
        }, 0);
      const transactionCoins = userTransactions.map((transaction) => transaction.coin);
      const removeDuplications:CoinId[] = [...new Set(transactionCoins)];
      const getTotalPercentageChange = userCoins.map((coin) => {
        if (removeDuplications.includes(coin.id)) {
          return coin.marketData.capPercentage;
        }
        return 0;
      }) as number[];
      const finalPercentage = getTotalPercentageChange
        .reduce((acc, total) => acc += total, 0);
      console.log(userTransactions);
      setUserStats((prev) => ({
        ...prev,
        total: userTotal,
        '24hChange': finalPercentage,
      }));
    }
  }, [userTransactions, userCoins]);

  return (
    <div
      className={styles['portfolio-container']}
    >
      <header
        className={styles.header}
      >
        <div
          className={styles['top-row']}
        >
          <h1>My Portfolio</h1>
          <button
            className={styles.button}
            type="button"
            onClick={focusSearchBar}
          >
            Add Coin

          </button>
        </div>
        <div
          className={styles['stats-row']}
        >
          <Stats
            title="Total"
            data={userStats.total}
            type="number"
          />
          <Stats
            type="percentage"
            title="24H Change"
            data={userStats['24hChange']}
          />
          <Stats
            type="number"
            title="Transactions"
            data={userTransactions && userTransactions.length}
          />
        </div>
      </header>
      <div
        className={styles['table-container']}
      >
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
                24h Low
              </th>
              <th>
                24h High
              </th>
              <th>
                Transactions
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
      </div>
      <div />
    </div>
  );
}
