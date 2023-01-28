import React from 'react'
import styles from './searchbar.module.css'
import { SearchOption } from './SearchOption'
import { Coin } from './types/types'

export const SearchDropdown = ({coins, searchInput}: {coins: Coin[], searchInput: string}) => {
  return (
    <div
    className={styles['search-dropdown']}
    >
        <SearchOption />
    </div>
  )
}
