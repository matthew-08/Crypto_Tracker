import React, { useState } from 'react';
import { Navigate, redirect, useNavigate } from 'react-router-dom';
import { WavePage } from '../../Components/wavePage/WavePage';
import { FormComponent } from '../../Components/FormComponent/FormComponent';
import styles from './signin.module.css';
import wave from './wave.svg';
import wavewhite from './wavewhite.svg';

export function SignIn({ closeNav }: { closeNav: () => void }) {
  const navigate = useNavigate();
  const [error, setError] = useState('');
  const handleSignIn = async (
    data:{ username: string, password: string, [key: string]: string },
  ) => {
    const { username, password } = data;
    const dataToPost = {
      username,
      password,
    };
    try {
      const userSignIn = await fetch('http://localhost:8000/auth/signIn', {
        method: 'POST',
        mode: 'cors',
        headers: {
          'Content-Type': 'application/json',
        },
        credentials: 'include',
        body: JSON.stringify(dataToPost),
      });
      const ok = await userSignIn.json().then((res) => res);
      await console.log(ok);
      if (ok.username === username) {
        closeNav();
        return navigate('/Dashboard');
      }
    } catch (error) {
      console.log(error);
    }
  };
  return (
    <section
      className={styles.main}
    >
      <img
        src={wave}
        className={styles.wavetop}
      />
      <FormComponent
        buttonText="Sign In"
        smallTextBottom="Forgot your password?"
        headerSubtitle="Please sign in below"
        formInputFields={['email', 'username', 'password']}
        header="Sign-In"
        linkPath="/ok"
        errorMessage={error}
        apiCallback={handleSignIn}
        key={2}
      />
      <img
        src={wave}
        className={styles.wave}
      />
    </section>

  );
}
