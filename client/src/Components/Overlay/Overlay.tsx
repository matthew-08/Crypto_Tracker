/* eslint-disable react/destructuring-assignment */
import React, { PropsWithChildren } from 'react';
import styles from './overlay.module.css';

export function Overlay(props: PropsWithChildren) {
  return <div className={styles.overlay}>{props.children}</div>;
}
