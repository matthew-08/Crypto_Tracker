import React from 'react'
import styles from './dashboardcore.module.css'
import { DashboardBottom } from './dashboard-bottom/DashboardBottom'

export const DashboardCore = () => {
  return (
    <>
    <header
    className={styles.header}
    ></header>
    <section
    className={styles['dashboard-top']}
    >     
    </section>
    <DashboardBottom />
     
    </>
  )
}
