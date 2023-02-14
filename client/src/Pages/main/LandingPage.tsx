import React from 'react';
import styles from './landingpage.module.css';
import mainimg from './assets/main-img.svg';

export function LandingPage() {
  return (
    <main
      className="main-page-container"
    >
      <div
        className={styles.container}
      >
        <div
          className={styles['container-left']}
        >
          <h2
            className={styles.header}
          >
            Coin tracking
            <br />
            Safe, Reliable
            <br />
            {' '}
            Start your free trial today.
          </h2>
          <button
            className={styles.button}
            type="button"
          >
            Sign Up Today
          </button>
        </div>
        <img src={mainimg} alt="" />
      </div>
    </main>
  );
}
