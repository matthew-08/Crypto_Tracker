import React from 'react';
import styles from './logo.module.css';

export function Logo({ img }: { img: string }) {
  return (
    <div className={styles['img-container']}>
      <img src={img} alt="logo" />
    </div>
  );
}
