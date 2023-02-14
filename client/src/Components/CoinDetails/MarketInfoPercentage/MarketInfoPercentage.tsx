import React from 'react';
import styles from './marketinfopercentage.module.css';
import { CoinPercentage } from '../CoinPercentage/CoinPercentage';

export function MarketInfoPercentage({ label, percentage }:
{ label: string, percentage: string | number }) {
  return (
    <div
      className={styles['market-info']}
    >
      <span
        className={styles.label}
      >
        {label}
      </span>
      <CoinPercentage
        percentage={percentage}
        size="1.3rem"
      />
    </div>
  );
}
