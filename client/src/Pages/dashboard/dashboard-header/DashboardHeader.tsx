import styles from './dashboardheader.module.css';
import hamburger from './assets/hamburger.png';

export function DashboardHeader() {
  return (
    <header className={styles.header}>
      <h2>Nioc</h2>
      <button className={styles.closebutton} type="button">
        <img src={hamburger} alt="" />
      </button>
    </header>
  );
}
