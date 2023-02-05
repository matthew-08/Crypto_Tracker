import React from 'react'
import { UserInfo } from '../../Dashboard'
import styles from './userinfo.module.css'
import defaultIcon from './assets/default-icon.png'

export const UserInfoSection = ({userInfo}:{userInfo: UserInfo}) => {
  return (
    <div
    className={styles['img-container']}
    >
        <img 
        src={defaultIcon}
        alt="default-user-icon"
        />
    </div>
  )
}
