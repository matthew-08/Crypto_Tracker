import React from 'react'
import styles from './dashboard.module.css'
import coin from "./assets/coin-logo.svg"
import { DashboardCore } from './dashboard-core/DashboardCore'
import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { DashboardHeader } from './dashboard-header/DashboardHeader'
import { useState } from 'react'

export interface UserInfo {
  username: string,
  email: string
}

export const Dashboard = () => {
  const navigate = useNavigate()
  const [userInfo, setUserInfo] = useState({} as UserInfo)  

  useEffect(() => {
    const getUserInfo = async () => {
      try {
        const getUserInfo = await fetch('http://localhost:8000/get/dashboard', {
          credentials: 'include',
        })
        const parseUserInfo = await getUserInfo.json().then((res: UserInfo) => setUserInfo(res))
      } catch (error) {
        navigate('/signIn')
      }
    }
    getUserInfo()
  })
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
        userInfo = {userInfo}
        />
        </section>
    </main>
  )
}
