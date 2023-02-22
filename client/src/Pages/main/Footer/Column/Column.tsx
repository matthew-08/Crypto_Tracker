import React, { Children } from 'react';
import { v4 as uuid } from 'uuid';
import styles from './column.module.css';

type Props = {
  title: string,
  listItems:string[]
};

export function Column({ title, listItems }: Props) {
  return (
    <div
      className={styles.align}
    >
      <h2>{title}</h2>
      <div
        className={styles.column}
      >
        <ul>
          {listItems.map((item) => (
            <li
              key={uuid()}
            >
              {item}
            </li>
          ))}

        </ul>
      </div>
    </div>
  );
}
