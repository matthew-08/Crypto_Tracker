import React from 'react'
import styles from './dashboardcore.module.css'
import { DashboardBottom } from './dashboard-bottom/DashboardBottom'
import { useState } from 'react'
import { UserInfo } from '../Dashboard'
import { UserInfoSection } from './UserInfo/UserInfoSection'

export const DashboardCore = ({userInfo}:{userInfo: UserInfo} ) => {

  return (
    <>
    <header
    className={styles.header}
    >
      <UserInfoSection
      userInfo = {userInfo}
      />

    </header>
    <section
    className={styles['dashboard-top']}
    >
    </section>
    <DashboardBottom />
     
    </>
  )
}
