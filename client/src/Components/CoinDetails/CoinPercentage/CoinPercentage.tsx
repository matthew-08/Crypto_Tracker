import React, { useState, useEffect } from 'react';
import styles from './coinpercent.module.css';
import arrow from '../assets/arrow.svg';

export function CoinPercentage({ percentage, size }
: { percentage: number | string, size: number | string }) {
  const [negative, setNegative] = useState(false);
  const [number, setNumber] = useState('');

  useEffect(() => {
    if (percentage < 0) {
      setNegative(true);
      setNumber(parseInt(percentage.toString().substring(1), 10).toFixed(2));
    } else if (typeof percentage === 'number') {
      setNumber(percentage.toFixed(2));
    } else {
      setNumber(parseInt(percentage, 10).toFixed(2));
    }
  }, []);

  return (
    <div
      className={styles.container}
    >
      <img
        src={arrow}
        alt="arrow"
        className={negative ? styles['negative-arrow'] : styles['positive-arrow']}
      />
      <span
        className={negative ? styles.negative : styles.positive}
        style={{ fontSize: size }}
      >
        {`${number}%`}
      </span>

    </div>
  );
}
