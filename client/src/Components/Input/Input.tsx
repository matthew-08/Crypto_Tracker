import React, { useState, useEffect } from 'react';
import styles from './input.module.css';
import { ReducerProps } from '../../types/types';

type KeyOfReducerProps = keyof ReducerProps;

interface InputProps {
  labelText: string,
  date: boolean,
  sendInput: (type: KeyOfReducerProps, payload: string) => void
  type: KeyOfReducerProps
  value: string,
  inputType: 'date' | 'number' | 'text'
  coinType?: string,
  invalid: boolean,

}
export function Input({
  labelText, date, sendInput, type, value, coinType, inputType, invalid,
}: InputProps) {
  const [inputStyles, setStyles] = useState({ styles: styles.input });
  const [invalidInput, setInvalidInput] = useState(false);
  useEffect(() => {
    const arrayOfStyles:string[] = [];
    if (date) {
      arrayOfStyles.push(styles.date);
    }
    if (invalid) {
      arrayOfStyles.push(styles.invalid);
      setInvalidInput(true);
    } else {
      arrayOfStyles.push(styles.input);
      setInvalidInput(false);
    }
    setStyles((prev) => ({ prev, styles: arrayOfStyles.join(' ') }));
  }, [date, invalid]);

  return (
    <div
      className={styles.container}
    >

      <label
        htmlFor="input"
        className={styles.label}
      >
        {labelText}
        {' '}
        {type !== 'note' && (
        <span
          className={styles.required}
        >
          *

        </span>
        )}
        {type === 'price' ? (
          <span
            className={styles.usd}
          >
            USD
          </span>
        ) : null}
        {type === 'quantity' ? (
          <span
            className={styles.usd}
          >
            {coinType}
          </span>
        ) : null}
        <input
          type={inputType}
          required={type !== 'note'}
          name="input"
          id="input"
          className={inputStyles.styles}
          value={value}
          onChange={(e) => sendInput(type, e.target.value)}
        />
        {invalidInput && (
        <small
          className={styles['invalid-message']}
        >
          This field is required
        </small>
        )}
      </label>
    </div>
  );
}
