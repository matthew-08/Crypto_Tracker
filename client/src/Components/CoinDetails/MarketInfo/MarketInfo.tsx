/* eslint-disable react/require-default-props */
import styles from './marketinfo.module.css';

export function MarketInfo({
  label,
  number,
  labelFS = '1.2rem',
  numberFS = '1.2rem',
}: {
  label: string;
  number: string | number;
  labelFS?: string;
  numberFS?: string;
}) {
  return (
    <div className={styles['market-info']}>
      <span className={styles.label} style={{ fontSize: labelFS }}>
        {label}
      </span>
      <span className={styles.number} style={{ fontSize: numberFS }}>
        {number}
      </span>
    </div>
  );
}
