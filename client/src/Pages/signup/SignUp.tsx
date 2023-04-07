import { useState } from 'react';

import { useNavigate } from 'react-router-dom';
import styles from './signup.module.css';
import { FormComponent } from '../../Components/FormComponent/FormComponent';
import authHanlder from '../../utils/authHandler';

interface FormFields {
  [key: string]: string | boolean;
}

export function SignUp() {
  const navigate = useNavigate();
  const [error, setError] = useState('');

  const handleUserAlreadyExists = (type: string) => {
    if (type === 'username') {
      setError('Username already exist');
    }
    if (type === 'email') {
      setError('Email already exists');
    }
  };

  const postNewUser = async (data: FormFields) => {
    const dataToPost = {
      ...data,
    };
    try {
      await authHanlder({
        body: dataToPost as {
          username: string;
          password: string;
        },
        mainPath: 'auth',
        subPath: 'createUser',
      }).then((r: { type: string }) => {
        console.log(r);
        if (r.type === 'username') {
          return handleUserAlreadyExists('username');
        }
        if (r.type === 'email') {
          return handleUserAlreadyExists('email');
        }
        return navigate('/Dashboard');
      });
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <main className={styles.main}>
      <div className={styles.container}>
        <FormComponent
          apiCallback={postNewUser}
          buttonText="Register"
          linkPath="/signIn"
          header="Sign Up"
          headerSubtitle="Please fill in this form to create an account"
          formInputFields={[
            'email',
            'username',
            'password',
            'confirm_Password',
          ]}
          smallTextBottom="Already have an account?"
          key={1}
          errorMessage={error}
        />
      </div>
    </main>
  );
}
