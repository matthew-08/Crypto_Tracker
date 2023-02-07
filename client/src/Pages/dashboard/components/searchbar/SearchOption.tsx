import React from 'react';
import styles from './searchbar.module.css';
import { ServerCoin } from '../../../../types/types';

export function SearchOption({ coin }:{ coin: ServerCoin }) {
  return (
    <div
      className={styles['search-option']}
    >
      <div>{coin.coin_name}</div>
      <div>{coin.coin_symbol}</div>
    </div>
  );
}
