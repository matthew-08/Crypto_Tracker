import React from 'react'
import styles from './dashboard.module.css'
import coin from "./assets/coin-logo.svg"
import { DashboardCore } from './dashboard-core/DashboardCore'



export const Dashboard = () => {
  return (
    <main
    className={styles['dashboard-main']}
    >
        <aside
        className={styles.sidebar}
        >
        <header
        className={styles.header}
        >
            <h2>Nioc</h2>
            <img src={coin}/>
        </header>
        </aside>
        <section
        className={styles.main}
        >
        <DashboardCore/>
        </section>
    </main>
  )
}
