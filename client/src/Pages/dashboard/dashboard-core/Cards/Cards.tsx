/* eslint-disable import/no-extraneous-dependencies */
import React, { useEffect, useState } from 'react';
import { v4 as uuid4 } from 'uuid';
import styles from './cards.module.css';
import { Card } from './Card';
import { CoinData } from '../../../../types/types';

export function Cards({
  userCoins,
  setGraphCoin,
}: {
  userCoins: CoinData[];
  setGraphCoin: (arg0: string) => void;
}) {
  const [passedUserCoins, setPassedUserCoins] = useState<CoinData[]>(
    [] as CoinData[]
  );

  useEffect(() => {
    setPassedUserCoins(userCoins);
  }, []);

  useEffect(() => {}, [userCoins]);

  return (
    <section className={styles.cards}>
      {userCoins &&
        userCoins.map((coin) => (
          <Card coinData={coin} key={uuid4()} setGraphCoin={setGraphCoin} />
        ))}
    </section>
  );
}
