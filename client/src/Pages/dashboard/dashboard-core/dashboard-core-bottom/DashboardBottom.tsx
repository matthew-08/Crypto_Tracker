import React from 'react';
import styles from './dashboardbottom.module.css';
import { SearchBar } from '../../components/searchbar/SearchBar';
import { Cards } from './Cards/Cards';
import { CoinData } from '../../../../types/types';

export function DashboardBottom({ userCoins }: { userCoins: CoinData[] }) {
  return (
    <section
      className={styles['dashboard-bottom']}
    >
      <header
        className={styles.header}
      >
        <SearchBar />
      </header>
      <Cards
        userCoins={userCoins}
      />
    </section>
  );
}
