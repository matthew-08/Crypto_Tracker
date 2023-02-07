import React from 'react';
import { v4 as uuid } from 'uuid';
import styles from './searchbar.module.css';
import { SearchOption } from './SearchOption';
import { ServerCoin } from '../../../../types/types';

interface SearchDropdownProps {
  setOverlay: (coin: ServerCoin | false) => void,
  coins: ServerCoin[]
}

export function SearchDropdown({ coins, setOverlay }: SearchDropdownProps) {
  return (
    <div
      className={styles['search-dropdown']}
    >
      {coins && coins.map((coin) => (
        <button
          className={styles['coin-button']}
          type="button"
          key={uuid()}
          onClick={() => setOverlay(coin)}
        >
          <SearchOption
            coin={coin}
          />
        </button>
      ))}
    </div>
  );
}
