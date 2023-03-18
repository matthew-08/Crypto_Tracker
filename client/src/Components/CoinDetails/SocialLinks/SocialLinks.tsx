import React from 'react';
import styles from './sociallinks.module.css';
import facebook from './assets/facebook.svg';
import reddit from './assets/reddit.svg';
import twitter from './assets/twitter.svg';

interface Links {
  facebook: string;
  reddit: string;
  twitter: string;
}

export function SocialLinks({ links }: { links: Links }) {
  return (
    <div className={styles.container}>
      <a href={links.reddit}>
        <img src={reddit} alt="" />
      </a>
      <a href={`http://facebook.com/${links.facebook}`}>
        <img src={facebook} alt="" />
      </a>
      <a href={`http://twitter.com/${links.twitter}`}>
        <img src={twitter} alt="" />
      </a>
    </div>
  );
}
