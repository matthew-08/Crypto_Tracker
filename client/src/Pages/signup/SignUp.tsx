import React, { useEffect, useState } from 'react';
import { FormMethod, Link, redirect } from 'react-router-dom';
import styles from './signup.module.css';
import wave from '../../assets/wave.svg';
import { LandingPage } from '../main/LandingPage';
import { FormComponent } from '../../Components/FormComponent/FormComponent';

interface FormFields {
  [key: string]: string | boolean
}

export function SignUp() {
  const [error, setError] = useState('');

  const handleUserAlreadyExists = (type:string) => {
    if ('username') {
      setError('Username already exist');
    }
    if ('email') {
      setError('Email already exists');
    }
  };

  const postNewUser = async (data:FormFields) => {
    const { username, email, password } = data;
    const dataToPost = {
      username,
      email,
      password,
    };
    console.log(dataToPost);
    try {
      const newUser = await fetch('http://localhost:8000/auth/createUser', {
        method: 'POST',
        mode: 'cors',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(dataToPost),
      });
      await newUser.json().then((r) => {
        if (r.type === 'username') {
          handleUserAlreadyExists('username');
        } else if (r.type === 'email') {
          handleUserAlreadyExists('email');
        } else {
          redirect;
        }
      });
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <main
      className={styles.main}
    >
      <img
        src={wave}
        className={styles.wave}
        alt="wave"
      />
      <div
        className={styles.container}
      >
        <FormComponent
          apiCallback={postNewUser}
          buttonText="Register"
          linkPath="/signIn"
          header="Sign Up"
          headerSubtitle="Please fill in this form to create an account"
          formInputFields={['email', 'username', 'password', 'confirm_Password']}
          smallTextBottom="Already have an account?"
          key={1}
          errorMessage={error}
        />
      </div>
    </main>
  );
}
