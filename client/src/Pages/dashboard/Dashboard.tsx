/* eslint-disable import/no-extraneous-dependencies */
import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Grid } from 'react-loader-spinner';
import styles from './dashboard.module.css';
import DashboardCore from './dashboard-core/DashboardCore';
import { UserInfo } from '../../types/types';
import { Sidebar } from './Sidebar/Sidebar';
import useWindowDimensions from '../../Components/Hooks/useWindowDimensions';
import apiURL from '../../utils/apiURL';

export function Dashboard({ closeNav }: { closeNav: (arg: boolean) => void }) {
  const { width, height } = useWindowDimensions();
  const [collapse, setCollapse] = useState(false);
  const navigate = useNavigate();
  const [userInfo, setUserInfo] = useState({} as UserInfo);

  useEffect(() => {
    if (width <= 1200) {
      setCollapse(true);
    } else {
      setCollapse(false);
    }
  }, [width]);

  const getUserInfo = async (): Promise<UserInfo | string> => {
    try {
      const fetchUserInfo = await fetch(`${apiURL}/get/dashboard`, {
        credentials: 'include',
      });
      const parseUserInfo: UserInfo = await fetchUserInfo
        .json()
        .then((res: UserInfo) => res);
      return parseUserInfo;
    } catch (error) {
      return 'Problem fetching details';
    }
  };

  const reRender = async () => {
    getUserInfo().then((res: UserInfo | string) => {
      if (typeof res === 'string') {
        return navigate('/signin');
      }
      return setUserInfo(res);
    });
  };

  useEffect(() => {
    closeNav(false);
    try {
      getUserInfo().then((res: UserInfo | string) => {
        if (typeof res === 'string') {
          navigate('/signin');
        } else {
          setUserInfo(res);
        }
      });
    } catch (error) {
      navigate('/signin');
    }
  }, []);

  return (
    <main className={styles['dashboard-main']}>
      {!collapse && <Sidebar userInfo={userInfo} />}
      <section className={styles.main}>
        {userInfo ? (
          <DashboardCore userInfo={userInfo} reRenderUser={reRender} />
        ) : (
          <Grid />
        )}
      </section>
    </main>
  );
}
