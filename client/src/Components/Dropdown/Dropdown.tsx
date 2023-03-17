import React from 'react';
import { v4 as uuid } from 'uuid';
import styles from './dropdown.module.css';
import { UserInfo, DropdownButtons } from '../../types/types';

interface DropdownProps {
  dropDownButtons: DropdownButtons;
  textTop: string;
  textTopSub?: string;
}

export function Dropdown({
  dropDownButtons,
  textTop,
  textTopSub,
}: DropdownProps) {
  console.log(textTop);
  return (
    <div className={styles.dropdown}>
      <div className={styles['user-info']}>
        <div className={styles['user-info-top']}>
          {textTop}
          <br />
          {textTopSub && textTopSub}
        </div>
        <div className={styles['buttons-grid']}>
          {dropDownButtons.map((button, index) => (
            <button type="button" key={uuid()}>
              <img src={button.image} alt="button-icon" />
              {button.buttonText}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
}

Dropdown.defaultProps = {
  textTopSub: '',
};
