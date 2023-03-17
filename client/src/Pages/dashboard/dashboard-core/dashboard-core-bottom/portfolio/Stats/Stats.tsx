import React from 'react';
import styles from './stats.module.css';
import { CoinPercentage } from '../../../../../../Components/CoinDetails/CoinPercentage/CoinPercentage';

interface Props {
  title: string | number;
  data: string | number;
  type: 'number' | 'percentage';
}

export function Stats({ title, data, type }: Props) {
  return (
    <div className={styles['stats-container']}>
      <p className={styles.title}>{title}</p>
      <span className={styles.total}>
        {title !== 'Total' ? '' : '$'}
        {type === 'number' ? (
          data
        ) : (
          <CoinPercentage percentage={data} size="1.2rem" />
        )}
      </span>
    </div>
  );
}
