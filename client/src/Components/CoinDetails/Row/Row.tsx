import React from 'react';
import { v4 as uuid } from 'uuid';
import styles from './row.module.css';
import { MarketPercentage } from '../../../types/types';
import { MarketInfoPercentage } from '../MarketInfoPercentage/MarketInfoPercentage';
import { MarketInfo } from '../MarketInfo/MarketInfo';

export function Row({ arrayOfData }: { arrayOfData: MarketPercentage[] }) {
  return (

    <div
      className={styles.row}
    >
      {
        arrayOfData.map((data) => {
          if (data.type === 'percentage') {
            return (
              <MarketInfoPercentage
                key={uuid()}
                label={data.label}
                percentage={data.percentage}
              />
            );
          }
          return (
            <MarketInfo
              key={uuid()}
              label={data.label}
              number={data.percentage}
              labelFS="1rem"
              numberFS="1rem"
            />
          );
        })
      }
    </div>
  );
}
