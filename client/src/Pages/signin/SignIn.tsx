import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { FormComponent } from '../../Components/FormComponent/FormComponent';
import authHanlder from '../../utils/authHandler';
import styles from './signin.module.css';

export function SignIn({ closeNav }: { closeNav: () => void }) {
  const navigate = useNavigate();
  const [error, setError] = useState('');
  const handleSignIn = async (data: {
    username: string;
    password: string;
    [key: string]: string;
    // eslint-disable-next-line consistent-return
  }) => {
    const { username, password } = data;
    const dataToPost = {
      username,
      password,
    };
    try {
      const fetchUser = authHanlder({
        body: dataToPost,
        mainPath: 'auth',
        subPath: 'signIn',
      });
      const checkUser: { username: string } = await fetchUser;
      if (checkUser.username === username) {
        closeNav();
        return navigate('/Dashboard');
      }
    } catch (err) {
      return console.log(err);
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
