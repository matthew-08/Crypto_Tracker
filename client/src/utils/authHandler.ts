import apiURL from './apiURL';

type Register = {
  mainPath: 'auth';
  subPath: 'createUser';
  body: {
    username: string;
    password: string;
  };
};

type SignIn = {
  mainPath: 'auth';
  subPath: 'signIn';
  body: {
    username: string;
    password: string;
  };
};

const HTTPVerbs = {
  signIn: 'POST',
  createUser: 'POST',
};

type Auth = Register | SignIn;
const authHanlder = async ({ body, mainPath, subPath }: Auth) => {
  try {
    const data = await fetch(`${apiURL}/${mainPath}/${subPath}`, {
      method: HTTPVerbs[subPath],
      body: JSON.stringify(body),
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
      },
    });
    return await data.json();
  } catch (error) {
    console.log(error);
    return {
      status: 'error',
    };
  }
};

export default authHanlder;
