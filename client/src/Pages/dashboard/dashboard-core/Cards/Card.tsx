import React from 'react';
import styles from './cards.module.css';
import { CoinData } from '../../../../types/types';
import { MarketInfoPercentage } from '../../../../Components/CoinDetails/MarketInfoPercentage/MarketInfoPercentage';

interface CardProps {
  coinData: CoinData
}

export function Card({ coinData }: CardProps) {
  return (
    <div
      className={styles.card}
    >
      <header
        className={styles.header}
      >
        <div
          className={styles['coin-name']}
        >
          {coinData.name}

        </div>
        <div
          className={styles['card-right']}
        >
          <MarketInfoPercentage
            label=""
            percentage={coinData.marketData.capPercentage}
          />

        </div>
      </header>
      <div
        className={styles['card-middle']}
      >
        <div
          className={styles['coin-icon']}
        >

          <div
            className={styles['icon-container']}
          >
            <img src={coinData.image} alt="coin-icon" />

          </div>

          <div
            className={styles['coin-icon-right']}
          >
            <p>{coinData.symbol}</p>
            <p
              className={styles['current-price']}
            >
              {coinData.marketData.current}

            </p>
          </div>
        </div>
      </div>
      <div
        className={styles.footer}
      >
        <div
          className={styles['market-data-bottom']}
        />
      </div>

    </div>
  );
}
