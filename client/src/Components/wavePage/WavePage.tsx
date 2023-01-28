import React from 'react'
import styles from './wavepage.module.css'
import wave from '../../assets/wave.svg'

type WavePage = {
  children: React.ReactNode
}

export const WavePage = (props: WavePage) => {
  return (
    <main
    className={styles.main}
>
    <img src={wave}
        className={styles.wave}
    />
    <div
        className={styles.container}
    >
      {props.children}
    </div>
    </main>
  )
}
