import React, { useState } from 'react';
import { redirect } from 'react-router-dom';
import styles from './signup.module.css';
import { FormComponent } from '../../Components/FormComponent/FormComponent';
import { useNavigate } from "react-router-dom";


interface FormFields {
  [key: string]: string | boolean
}

export function SignUp() {
  const navigate = useNavigate()
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
        credentials:'include',
        body: JSON.stringify(dataToPost),
      });
      await newUser.json().then((r) => {
        if (r.type === 'username') {
          handleUserAlreadyExists('username');
        } else if (r.type === 'email') {
          handleUserAlreadyExists('email');
        } else {
          console.log('redirect');
          return navigate('/Dashboard')
        }
      });
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <main
      className={styles.main}
    >
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
