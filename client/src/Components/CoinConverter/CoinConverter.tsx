import React from 'react';
import styles from './coinconverter.module.css';
import exchangeIcon from './assets/exchange.svg';

interface Props {
  coinToConvert?: {
    coin: string;
    value: number;
    usdValue: number;
  };
}

export function CoinConverter() {
  return (
    <div className={styles.container}>
      <div className={styles['input-container']}>
        <div className={styles['currency-wrapper']}>
          <span>BTC</span>
        </div>
        <input type="text" />
      </div>
      <img src={exchangeIcon} alt="exchange-icon" />
      <div className={styles['input-container']}>
        <div className={styles['currency-wrapper']}>
          <span>BTC</span>
        </div>
        <input type="text" />
      </div>
    </div>
  );
}
