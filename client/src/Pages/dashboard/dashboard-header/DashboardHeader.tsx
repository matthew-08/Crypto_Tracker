import React from 'react';
import styles from './dashboardheader.module.css';
import coin from '../assets/coin-logo.svg';
import hamburger from './assets/hamburger.png';

export function DashboardHeader() {
  return (
    <header className={styles.header}>
      <h2>Nioc</h2>
      {/* <img src={coin} alt="main-logo" /> */}
      <button className={styles.closebutton} type="button">
        <img src={hamburger} alt="" />
      </button>
    </header>
  );
}
