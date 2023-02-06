import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import styles from './dashboard.module.css';
import coin from './assets/coin-logo.svg';
import DashboardCore from './dashboard-core/DashboardCore';
import { DashboardHeader } from './dashboard-header/DashboardHeader';
import { UserInfo } from '../../types/types';

export function Dashboard() {
  const navigate = useNavigate();
  const [userInfo, setUserInfo] = useState({} as UserInfo);

  useEffect(() => {
    const getUserInfo = async () => {
      try {
        const fetchUserInfo = await fetch('http://localhost:8000/get/dashboard', {
          credentials: 'include',
        });
        const parseUserInfo = await fetchUserInfo.json().then((res: UserInfo) => setUserInfo(res));
      } catch (error) {
        navigate('/signIn');
      }
    };
    getUserInfo();
  });
  return (
    <main
      className={styles['dashboard-main']}
    >
      <aside
        className={styles.sidebar}
      >
        <DashboardHeader />
      </aside>
      <section
        className={styles.main}
      >
        <DashboardCore
          userInfo={userInfo}
        />
      </section>
    </main>
  );
}
