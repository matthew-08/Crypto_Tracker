/* eslint-disable import/no-extraneous-dependencies */
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Grid } from 'react-loader-spinner';
import { stringify } from 'uuid';
import styles from './dashboard.module.css';
import coin from './assets/coin-logo.svg';
import DashboardCore from './dashboard-core/DashboardCore';
import { DashboardHeader } from './dashboard-header/DashboardHeader';
import { UserInfo } from '../../types/types';
import { Sidebar } from './Sidebar/Sidebar';
import useWindowDimensions from '../../Components/Hooks/useWindowDimensions';

export function Dashboard() {
  const { width, height } = useWindowDimensions();
  const navigate = useNavigate();
  const [userInfo, setUserInfo] = useState({} as UserInfo);

  const getUserInfo = async ():Promise<UserInfo | string> => {
    try {
      const fetchUserInfo = await fetch('http://localhost:8000/get/dashboard', {
        credentials: 'include',
      });
      const parseUserInfo:UserInfo = await fetchUserInfo.json().then((res: UserInfo) => res);
      console.log(parseUserInfo);
      return parseUserInfo;
    } catch (error) {
      return 'Problem fetching details';
    }
  };

  const reRender = async () => {
    getUserInfo().then((res: UserInfo | string) => {
      if (typeof res === 'string') {
        return console.log(res);
      }
      return setUserInfo(res);
    });
  };

  useEffect(() => {
    try {
      getUserInfo().then((res: UserInfo | string) => {
        if (typeof res === 'string') {
          console.log('Problem detected');
        } else {
          setUserInfo(res);
        }
      });
    } catch (error) {
      navigate('/signin');
    }
  }, []);
  return (
    <main
      className={styles['dashboard-main']}
    >
      {width >= 1200
      && <Sidebar />}
      <section
        className={styles.main}
      >
        {/* {
          userInfo
            ? (
              <DashboardCore
                userInfo={userInfo}
                reRenderUser={reRender}
              />
            )
            : <Grid />
} */}
      </section>
    </main>
  );
}
