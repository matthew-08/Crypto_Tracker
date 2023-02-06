import React from 'react';
import styles from './dashboardbottom.module.css';
import { SearchBar } from '../../components/searchbar/SearchBar';
import { Cards } from './Cards/Cards';

export function DashboardBottom() {
  return (
    <section
      className={styles['dashboard-bottom']}
    >
      <header
        className={styles.header}
      >
        <SearchBar />
      </header>
      <Cards />
    </section>
  );
}
