import React, { useState } from 'react';
import styles from './input.module.css';
import { ReducerProps } from '../../types/types';

type KeyOfReducerProps = keyof ReducerProps;

interface InputProps {
  labelText: string,
  date: boolean,
  sendInput: (type: KeyOfReducerProps, payload: string) => void
  type: KeyOfReducerProps
  value: string,
  coinType?: string,

}
export function Input({
  labelText, date, sendInput, type, value, coinType,
}: InputProps) {
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
        <span
          className={styles.required}
        >
          *

        </span>
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
          type={date ? 'date' : 'number'}
          required
          name="input"
          id="input"
          value={value}
          onChange={(e) => sendInput(type, e.target.value)}
        />
      </label>
    </div>
  );
}
