import styles from './coinconverter.module.css';
import exchangeIcon from './assets/exchange.svg';

export function CoinConverter() {
  return (
    <div className={styles.container}>
      <div className={styles['input-container']}>
        <div className={styles['currency-wrapper']}>
          <span>BTC</span>
        </div>
        <input type="text" />
      </div>
      <img src={exchangeIcon} alt="exchange-icon" />
      <div className={styles['input-container']}>
        <div className={styles['currency-wrapper']}>
          <span>BTC</span>
        </div>
        <input type="text" />
      </div>
    </div>
  );
}
