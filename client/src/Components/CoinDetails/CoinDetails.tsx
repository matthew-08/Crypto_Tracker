import React, { useEffect, useState } from 'react';
import { v4 as uuid } from 'uuid';
// eslint-disable-next-line import/no-extraneous-dependencies
import millify from 'millify';
import { DetailedCoinData, PercentageCoins, MarketPercentage } from '../../types/types';
import styles from './coindetails.module.css';
import { CoinPercentage } from './CoinPercentage/CoinPercentage';
import { MarketInfo } from './MarketInfo/MarketInfo';
import { MarketInfoPercentage } from './MarketInfoPercentage/MarketInfoPercentage';
import { Row } from './Row/Row';
import { SocialLinks } from './SocialLinks/SocialLinks';
import { CoinConverter } from '../CoinConverter/CoinConverter';

export function CoinDetails({ coinDetails, closeOverlay, addToCoinList }:
{ coinDetails: DetailedCoinData,
  closeOverlay: (arg0: boolean) => void
  addToCoinList: (coinId: string | number) => Promise<void>
}) {
  const [percentageRows, setPercentageRows] = useState([] as MarketPercentage[][]);

  useEffect(() => {
    const arrayOfCoinLabels = ['btc', 'eth', 'usd'];
    if (!percentageRows.length) {
      const finalArray:MarketPercentage[][] = [];
      arrayOfCoinLabels.map((coin) => {
        const array:MarketPercentage[] = [
          {
            label: `1h ${coin.toUpperCase()}`,
            percentage: coinDetails.marketData.percent1h[coin as keyof PercentageCoins],
            type: 'percentage',
          },
          {
            label: `24h ${coin.toUpperCase()}`,
            percentage: coinDetails.marketData.percent24h[coin as keyof PercentageCoins],
            type: 'percentage',
          },
          {
            label: `7d ${coin.toUpperCase()}`,
            percentage: coinDetails.marketData.percent7d[coin as keyof PercentageCoins],
            type: 'percentage',
          },
          {
            label: `30d ${coin.toUpperCase()}`,
            percentage: coinDetails.marketData.percent30d[coin as keyof PercentageCoins],
            type: 'percentage',
          },
        ];
        return finalArray.push(array);
      });
      console.log(CoinDetails);
      setPercentageRows(finalArray);
    }
  }, []);

  useEffect(() => {
  }, [percentageRows]);

  return (
    <section
      className={styles['main-container']}
    >
      <header
        className={styles.header}
      >
        <div
          className={styles['header-top']}
        >
          <div
            className={styles['header-top-left']}
          >
            <div
              className={styles.logo}
            >
              <div
                className={styles['img-container']}
              >
                <img src={coinDetails.image} alt="coin icon" />

              </div>
              <div
                className={styles['coin-name-container']}
              >
                <p>{coinDetails.name}</p>
                <small>{coinDetails.symbol.toUpperCase()}</small>
              </div>
            </div>
            <div
              className={styles['main-price-container']}
            >
              <span
                className={styles['price-main']}
              >
                {`$${coinDetails.marketData.current}`}
              </span>
              <CoinPercentage
                percentage={coinDetails.marketData.percent24h.usd}
                size="2rem"
              />
            </div>

          </div>
          <div>
            <button
              type="button"
              className={styles['exit-button']}
              onClick={() => closeOverlay(false)}

            >
              &#215;
            </button>

          </div>
        </div>
        <div
          className={styles['header-bottom']}
        >
          <div
            className={styles['bottom-info']}
          >
            <MarketInfo
              label="Market Cap"
              number={millify(coinDetails.marketData.marketCap)}
            />
            <MarketInfo
              label="Volume"
              number={millify(coinDetails.marketData.volume)}
            />
            <MarketInfo
              label="All-Time High"
              number={coinDetails.marketData.allTimeHigh}
            />
            <MarketInfo
              label="All-Time Low"
              number={coinDetails.marketData.allTimeLow}
            />

          </div>
          <CoinConverter />
        </div>

      </header>
      <div
        className={styles['container-bottom']}
      >
        <div
          className={styles['market-percentages-container']}
        >
          {percentageRows && percentageRows.map((row) => (
            <Row
              key={uuid()}
              arrayOfData={row}
            />
          ))}
        </div>
        <div
          className={styles['bottom-info-right']}
        >
          <Row
            key={uuid()}
            arrayOfData={
                [
                  {
                    label: 'Circ. Supply',
                    percentage: millify(coinDetails.marketData.circulating_supply, {
                      precision: 2,
                    }),
                    type: 'number',

                  },
                  {
                    label: 'Max Supply',
                    percentage: millify(coinDetails.marketData.maxSupply, {
                      precision: 2,
                    }),
                    type: 'number',
                  },
                  {
                    label: 'Total Supply',
                    percentage: millify(coinDetails.marketData.totalSupply, {
                      precision: 2,
                    }),
                    type: 'number',
                  },

                ]
            }
          />
          <Row
            key={uuid()}
            arrayOfData={
                [
                  {
                    label: 'Circ. Supply',
                    percentage: millify(coinDetails.marketData.circulating_supply, {
                      precision: 2,
                    }),
                    type: 'number',

                  },
                  {
                    label: 'Max Supply',
                    percentage: millify(coinDetails.marketData.maxSupply, {
                      precision: 2,
                    }),
                    type: 'number',
                  },
                  {
                    label: 'Total Supply',
                    percentage: millify(coinDetails.marketData.totalSupply, {
                      precision: 2,
                    }),
                    type: 'number',
                  },

                ]
            }
          />
          <Row
            key={uuid()}
            arrayOfData={
                [
                  {
                    label: 'Circ. Supply',
                    percentage: millify(coinDetails.marketData.circulating_supply, {
                      precision: 2,
                    }),
                    type: 'number',

                  },
                  {
                    label: 'Max Supply',
                    percentage: millify(coinDetails.marketData.maxSupply, {
                      precision: 2,
                    }),
                    type: 'number',
                  },
                  {
                    label: 'Total Supply',
                    percentage: millify(coinDetails.marketData.totalSupply, {
                      precision: 2,
                    }),
                    type: 'number',
                  },

                ]
            }
          />
        </div>
      </div>

      <div
        className={styles.footer}
      >
        <SocialLinks
          links={
            coinDetails.marketData.links
        }
        />
        <div
          className={styles['buttons-container']}
        >
          <button
            type="button"
          >
            Like
          </button>
          <button
            type="button"
            onClick={() => {
              closeOverlay(false);
              addToCoinList(coinDetails.id);
            }}
          >
            Add to collection
          </button>
        </div>
      </div>
    </section>
  );
}
