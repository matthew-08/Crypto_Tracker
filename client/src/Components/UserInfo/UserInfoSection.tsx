import styles from './userinfo.module.css';
import defaultIcon from './assets/default-icon.png';
import { UserInfo } from '../../types/types';

export function UserInfoSection({ userInfo }: { userInfo: UserInfo }) {
  return (
    <div className={styles.container}>
      <div className={styles['img-container']}>
        <img src={defaultIcon} alt="default-user-icon" />
      </div>
      <div className={styles['user-greeting']}>
        <span className={styles['user-name']}>
          {userInfo.user_name}
          <br />
        </span>
        <span className={styles.email}>{userInfo.email}</span>
      </div>
    </div>
  );
}
