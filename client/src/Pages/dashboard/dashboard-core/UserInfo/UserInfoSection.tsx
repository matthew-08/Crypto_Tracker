import React, { useState } from 'react';
import styles from './userinfo.module.css';
import defaultIcon from './assets/default-icon.png';
import { UserInfo } from '../../../../types/types';
import { Dropdown } from '../../../../Components/Dropdown/Dropdown';
import feedback from './assets/feedback.svg';
import key from './assets/key.svg';
import logout from './assets/logout.svg';
import user from './assets/user.svg';

export function UserInfoSection({ userInfo }:{ userInfo: UserInfo }) {
  const [showDropdown, setShowDropdon] = useState(false);

  return (
    <div
      className={styles['img-container']}
    >
      <button
        type="button"
        onClick={(e) => setShowDropdon(!showDropdown)}
      >
        <img
          src={defaultIcon}
          alt="default-user-icon"
        />
      </button>
      {showDropdown
      && (
      <Dropdown
        dropDownButtons={
          [
            { buttonText: 'Account Info', image: user },
            { buttonText: 'Reset Password', image: key },
            { buttonText: 'Send Feedback', image: feedback },
            { buttonText: 'Log Out', image: logout },
          ]
        }
        textTop={userInfo.user_name}
        textTopSub={userInfo.email}
      />
      )}
    </div>
  );
}
