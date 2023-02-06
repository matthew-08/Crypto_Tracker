import React, { useState, useEffect, useRef } from 'react';
import searchIcon from '../../assets/search.svg';
import styles from './searchbar.module.css';
import { SearchDropdown } from './SearchDropdown';
import { Coin } from './types/types';

export function SearchBar() {
  const [input, setInput] = useState('');
  const [coins, setCoins] = useState<Coin[]>([]);
  const [filteredCoins, setFilteredCoins] = useState<Coin[]>([]);
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

    return () => document.body.removeEventListener('click', checkInputFocus);
  }, []);

  useEffect(() => {
    const searchCoins = async () => {
      const matchingCoins = await fetch(`http://localhost:8000/search/coins?coin=${input}`, {
        credentials: 'include',
      });
      const parseCoins = await matchingCoins.json();
      await console.log(parseCoins.rows);
    };
    if (input) {
      searchCoins();
    }
    setFilteredCoins(coins.filter((coin, i) => console.log(coin)));
    console.log(filteredCoins);
  }, [input]);

  return (
    <div
      className={styles.container}
    >
      <input
        type="text"
        onChange={(e) => setInput(e.target.value)}
        ref={searchInput}
      />
      {dropdown
        && (
        <SearchDropdown
          coins={coins}
          searchInput={input}
        />
        )}
      <img src={searchIcon} alt="" />
    </div>
  );
}
