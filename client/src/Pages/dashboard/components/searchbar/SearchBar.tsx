import React, { useState, useEffect, useRef } from 'react';
import {
  CoinData,
  ServerCoin,
  ServerResponse,
  ParsedCoins,
} from '../../../../types/types';
import { searchCoins } from '../../../../utils/coinsHandler';
import searchIcon from '../../assets/search.svg';
import styles from './searchbar.module.css';
import { SearchDropdown } from './SearchDropdown';
import { Coin } from './types/types';

export function SearchBar({
  setOverlay,
}: {
  setOverlay: (coin: ServerCoin | false) => void;
}) {
  const [input, setInput] = useState('');
  const [coins, setCoins] = useState<ServerCoin[]>([]);
  const [dropdown, enableDropdown] = useState(false);
  const searchInput = useRef(null);

  useEffect(() => {
    const fetchSearchCoins = async () => {
      await searchCoins(input).then((res) => setCoins(res));
      enableDropdown(true);
    };

    if (input) {
      fetchSearchCoins();
    }
  }, [input]);
  const checkInputFocus = () => {
    if (searchInput && document.activeElement === searchInput.current) {
      enableDropdown(true);
    } else {
      enableDropdown(false);
    }
  };
  useEffect(() => {
    document.body.addEventListener('click', checkInputFocus);

    return () => document.body.removeEventListener('click', checkInputFocus);
  }, []);

  return (
    <div className={styles.container}>
      <input
        ref={searchInput}
        type="text"
        onChange={(e) => setInput(e.target.value)}
        placeholder="Search for a coin..."
      />
      {dropdown && <SearchDropdown coins={coins} setOverlay={setOverlay} />}
      <img src={searchIcon} alt="" />
    </div>
  );
}
