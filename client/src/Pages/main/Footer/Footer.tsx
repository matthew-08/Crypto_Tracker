/* eslint-disable jsx-a11y/anchor-is-valid */
import React from 'react';
import styles from './footer.module.css';
import { Column } from './Column/Column';
import git from '../../../assets/git.png';

export function Footer() {
  return (
    <footer className={styles.footer}>
      <div className={styles.grid}>
        <Column
          title="Products"
          listItems={['Coin', 'API', 'Educational System', 'Another Thing']}
        />
        <Column
          title="Education"
          listItems={['Lorem', 'School', 'Training', 'Internship', 'Diseom']}
        />
        <Column
          title="Support"
          listItems={['Email', 'Telephone', 'Chat', 'Urgent', 'Assistance']}
        />
        <Column
          title="Socials"
          listItems={[
            'Telegram',
            'Discord',
            'Facebook',
            'Instagram',
            'MySpace',
            'Reddit',
            'Blog',
            'CrazyWebsite',
          ]}
        />
      </div>
      <div className={styles.bottom}>
        Made by{' '}
        <a href="github.com/matthew-08">
          Matthew Crosby
          <img className={styles.gitimg} src={git} alt="git" />
        </a>
      </div>
    </footer>
  );
}
