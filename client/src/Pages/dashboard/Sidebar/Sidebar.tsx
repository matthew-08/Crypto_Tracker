import React from 'react';
// eslint-disable-next-line import/no-extraneous-dependencies
import { AnimatePresence } from 'framer-motion';
import styles from './sidebar.module.css';
import { DashboardHeader } from '../dashboard-header/DashboardHeader';
import github from './assets/github.svg';
import account from './assets/account.svg';
import activity from './assets/activity.svg';
import friend from './assets/friend.svg';
import support from './assets/support.svg';
import blog from './assets/blogicon.svg';
import { SidebarButton } from '../../../Components/SidebarButton/SidebarButton';
import { UserInfo } from '../../../types/types';
import { UserInfoSection } from '../../../Components/UserInfo/UserInfoSection';

export function Sidebar({ userInfo }: { userInfo: UserInfo }) {
  return (
    <AnimatePresence>
      <aside className={styles.sidebar}>
        <DashboardHeader />
        <div>
          <UserInfoSection userInfo={userInfo} />
        </div>
        <div className={styles['buttons-container']}>
          <SidebarButton buttonText="My Account" img={account} />
          <SidebarButton buttonText="My Activity" img={activity} />
          <SidebarButton buttonText="Refer a Friend" img={friend} />
          <SidebarButton buttonText="Support" img={support} />
          <SidebarButton buttonText="Blog" img={blog} />
        </div>
        <footer className={styles.footer}>
          <a href="https://github.com/matthew-08">
            <img src={github} alt="github link" />
          </a>
        </footer>
      </aside>
    </AnimatePresence>
  );
}
