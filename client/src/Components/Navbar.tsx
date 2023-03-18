import React from 'react';
import { useNavigate } from 'react-router-dom';
import styles from './navbar.module.css';

export function Navbar() {
  const navigate = useNavigate();

  const routeChange = (route: 'signIn' | 'signUp') => {
    navigate(`/${route}`);
  };
  return (
    <header>
      <nav className={styles.nav}>
        <h1>Noic</h1>

        <div className={styles.buttons}>
          <button type="button" onClick={() => routeChange('signIn')}>
            Login
          </button>
          <button type="button" onClick={() => routeChange('signUp')}>
            Sign Up
          </button>
        </div>
      </nav>
    </header>
  );
}
