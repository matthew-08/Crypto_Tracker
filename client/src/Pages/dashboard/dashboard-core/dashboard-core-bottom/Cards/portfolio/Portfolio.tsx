import React from 'react';
import styles from './portfolio.module.css';
import add from './assets/add.svg';
import trash from './assets/trash.svg';
import edit from './assets/edit.svg';

export function Portfolio() {
  return (
    <>
      <header
        className={styles.header}
      >
        <div
          className={styles['stats-container']}
        >
          <p>Total Balance:</p>
          <span>$10000</span>
        </div>

        <div
          className={styles['stats-container']}
        >
          <p>Total Balance:</p>
          <span>$10000</span>
        </div>
      </header>
      <table
        className={styles.table}
      >
        <thead>
          <tr>
            <th>
              Coin
            </th>
            <th>
              Price
            </th>
            <th>
              Holdings
            </th>
            <th />
          </tr>

        </thead>
        <tr>
          <td>
            Bitcoin
          </td>
          <td>
            $1000
          </td>
          <td>
            1.2404t
          </td>
          <td
            className={styles.buttons}
          >
            <button>
              <img src={add} alt="" />
            </button>
            <button>
              <img src={edit} alt="" />
            </button>
            <button>
              <img src={trash} alt="" />
            </button>
          </td>
        </tr>

      </table>
      <div />
    </>
  );
}
