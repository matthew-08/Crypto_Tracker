import React from 'react';
import styles from './sidebarbutton.module.css';

type Props = {
  img: string,
  buttonText:string,
};

export function SidebarButton({ img, buttonText }:Props) {
  return (
    <button
      type="button"
    >
      <div
        className={styles['img-container']}
      >
        <img
          src={img}
          alt="icon"
        />

      </div>
      {buttonText}
    </button>
  );
}
