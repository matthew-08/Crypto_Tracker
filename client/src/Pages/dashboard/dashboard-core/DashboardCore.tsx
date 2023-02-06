import React, { useState } from 'react';
import styles from './dashboardcore.module.css';
import { DashboardBottom } from './dashboard-bottom/DashboardBottom';
import { UserInfo } from '../../../types/types';
import { UserInfoSection } from './UserInfo/UserInfoSection';

export default function DashboardCore({ userInfo }:{ userInfo: UserInfo }) {
  return (
    <>
      <header
        className={styles.header}
      >
        <UserInfoSection
          userInfo={userInfo}
        />

      </header>
      <section
        className={styles['dashboard-top']}
      />
      <DashboardBottom />

    </>
  );
}
