import React, { useState } from 'react';
import styles from './userinfo.module.css';
import defaultIcon from './assets/default-icon.png';
import { UserInfo } from '../../types/types';
import { Dropdown } from '../Dropdown/Dropdown';
import feedback from './assets/feedback.svg';
import key from './assets/key.svg';
import logout from './assets/logout.svg';
import user from './assets/user.svg';

export function UserInfoSection({ userInfo }:{ userInfo: UserInfo }) {
  return (
    <div
      className={styles.container}
    >
      <div
        className={styles['img-container']}
      >
        <img
          src={defaultIcon}
          alt="default-user-icon"
        />
      </div>
      <div
        className={styles['user-greeting']}
      >
        <span
          className={styles['user-name']}
        >
          {userInfo.user_name}
          <br />
        </span>
        <span
          className={styles.email}
        >
          {userInfo.email}
        </span>
      </div>
    </div>
  );
}
