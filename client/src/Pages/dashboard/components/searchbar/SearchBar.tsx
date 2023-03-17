import React, { useState, useEffect, useRef } from 'react';
import {
  CoinData,
  ServerCoin,
  ServerResponse,
  ParsedCoins,
} from '../../../../types/types';
import searchIcon from '../../assets/search.svg';
import styles from './searchbar.module.css';
import { SearchDropdown } from './SearchDropdown';
import { Coin } from './types/types';

export function SearchBar({
  setOverlay,
  setSearchBarFocus,
}: {
  setOverlay: (coin: ServerCoin | false) => void;
  setSearchBarFocus: boolean;
}) {
  const [input, setInput] = useState('');
  const [coins, setCoins] = useState<ServerCoin[]>([]);
  const [dropdown, enableDropdown] = useState(false);

  const searchInput = useRef(null);

  useEffect(() => {
    /* const getAllCoins = async () => {
      const allCoins = await fetch('https://api.coingecko.com/api/v3/coins/list')
      .then(res => res.json())
      .then((res) => setCoins(res))
    }

    getAllCoins() */
  }, []);

  const checkInputFocus = () => {
    if (document.activeElement === searchInput.current) {
      enableDropdown(true);
    } else {
      enableDropdown(false);
    }
  };
  useEffect(() => {
    document.body.addEventListener('click', checkInputFocus);
    if (searchInput && setSearchBarFocus) {
      searchInput.current!.focus();
    }

    return () => document.body.removeEventListener('click', checkInputFocus);
  }, []);

  useEffect(() => {
    const searchCoins = async () => {
      const matchingCoins = await fetch(
        `http://localhost:8000/search/coins?coin=${input}`,
        {
          credentials: 'include',
        }
      );
      const parseCoins: ParsedCoins = await matchingCoins.json();
      const extractArray = await parseCoins.rows;
      await setCoins(extractArray);
    };

    if (input) {
      searchCoins();
    }
  }, [input]);

  return (
    <div className={styles.container}>
      <input
        type="text"
        onChange={(e) => setInput(e.target.value)}
        ref={searchInput}
        placeholder="Search for a coin..."
      />
      {dropdown && <SearchDropdown coins={coins} setOverlay={setOverlay} />}
      <img src={searchIcon} alt="" />
    </div>
  );
}
