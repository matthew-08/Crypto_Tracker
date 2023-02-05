    import React from 'react'
import styles from './navbar.module.css'

export const Navbar = () => {
  return (
    <header>
        <nav
        className={styles.nav}
        >
            <h1>A Logo</h1>
            <ul
            className={styles.options}
            >
                <li>Option 1</li>
                <li>Option 2</li>
                <li>Option 3</li>
            </ul>
        </nav>
    </header>
  )
}
