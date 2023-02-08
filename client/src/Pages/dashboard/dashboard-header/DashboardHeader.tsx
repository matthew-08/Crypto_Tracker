import React from 'react';
import styles from './dashboardheader.module.css';
import coin from '../assets/coin-logo.svg';

export function DashboardHeader() {
  return (
    <header
      className={styles.header}
    >
      <h2>Nioc</h2>
      <img src={coin} alt="main-logo" />
    </header>
  );
}
