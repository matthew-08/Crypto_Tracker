import React from 'react';
import styles from './dropdown.module.css';
import { UserInfo, DropdownButtons } from '../../types/types';

interface DropdownProps {
  dropDownButtons: DropdownButtons,
  textTop: string
  textTopSub?: string
}

export function Dropdown({ dropDownButtons, textTop, textTopSub }: DropdownProps) {
  console.log(textTop);
  return (
    <div
      className={styles.dropdown}
    >
      <div
        className={styles['user-info']}
      >
        <div
          className={styles['user-info-top']}
        >
          {textTop}
          <br />
          {textTopSub && textTopSub}
        </div>
        <div
          className={styles['buttons-grid']}
        >
          {
            dropDownButtons.map((button, index) => (
              <button
                type="button"
                key={index}
              >
                <img src={button.image} alt="button-icon" />
                {button.buttonText}
              </button>
            ))
          }
        </div>
      </div>
    </div>
  );
}

Dropdown.defaultProps = {
  textTopSub: '',
};
