import React from 'react';
import styles from './wavepage.module.css';
import wave from '../../assets/wave.svg';

type Props = {
  children: React.ReactNode;
};

export function WavePage({ children }: Props) {
  return (
    <main className={styles.main}>
      <img src={wave} className={styles.wave} alt="wave" />
      <div className={styles.container}>{children}</div>
    </main>
  );
}
