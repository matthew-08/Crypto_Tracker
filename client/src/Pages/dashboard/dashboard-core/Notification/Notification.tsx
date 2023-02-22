import React from 'react';
import styles from './notification.module.css';

export default function Notification(
  { img, amountDisplay }: { img: string, amountDisplay:number },
) {
  return (
    <div
      className={styles.container}
    >
      {amountDisplay && (
      <div
        className={styles.amount}
      >
        <span>{amountDisplay}</span>
      </div>
      )}
      <img
        src={img}
        alt="img"
      />
    </div>
  );
}
