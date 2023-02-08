import React from 'react';
import styles from './sidebar.module.css';
import { DashboardHeader } from '../dashboard-header/DashboardHeader';

export function Sidebar() {
  return (
    <aside
      className={styles.sidebar}
    >
      <DashboardHeader />
      <div
        className={
        styles['buttons-container']
      }
      >
        <button
          type="button"
        >
          My Account
        </button>
        <button
          type="button"
        >
          Activity
        </button>
        <button
          type="button"
        >
          Refer a friend
        </button>
        <button
          type="button"
        >
          Support Center
        </button>
        <button
          type="button"
        >
          Blog
        </button>
      </div>
    </aside>
  );
}
