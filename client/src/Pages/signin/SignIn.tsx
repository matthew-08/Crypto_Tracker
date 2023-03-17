import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { FormComponent } from '../../Components/FormComponent/FormComponent';
import styles from './signin.module.css';

export function SignIn({ closeNav }: { closeNav: () => void }) {
  const navigate = useNavigate();
  const [error, setError] = useState('');
  const handleSignIn = async (data: {
    username: string;
    password: string;
    [key: string]: string;
  }) => {
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
    } catch (err) {
      console.log(err);
    }
  };
  return (
    <section className={styles.main}>
      <FormComponent
        buttonText="Sign In"
        smallTextBottom="Forgot your password?"
        headerSubtitle="Please sign in below"
        formInputFields={['username', 'password']}
        header="Sign-In"
        linkPath="/ok"
        errorMessage={error}
        apiCallback={handleSignIn}
        key={2}
      />
    </section>
  );
}
