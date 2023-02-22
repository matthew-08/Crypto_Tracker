/* eslint-disable import/no-extraneous-dependencies */
import React, { useEffect, useState } from 'react';
import { v4 as uuid4 } from 'uuid';
import styles from './cards.module.css';
import currencyAdjust from '../../../../utils/currencyAdjust';
import { Card } from './Card';
import { CoinData } from '../../../../types/types';

export function Cards({ userCoins }: { userCoins: CoinData[] }) {
  const [passedUserCoins, setPassedUserCoins] = useState<CoinData[]>([] as CoinData[]);

  useEffect(() => {
    setPassedUserCoins(userCoins);
  }, []);

  useEffect(() => {

  }, [userCoins]);

  return (
    <section
      className={styles.cards}
    >
      {userCoins && userCoins.map((coin) => (
        <Card
          coinData={coin}
          key={uuid4()}
        />
      ))}
    </section>
  );
}
