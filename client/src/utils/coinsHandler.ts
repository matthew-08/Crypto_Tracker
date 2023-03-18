import apiURL from './apiURL';

type AddCoin = {
  mainPath: 'coins';
  coinId: string | number;
};

type Args = AddCoin;
const coinHandler = async ({ mainPath, coinId }: Args) => {
  try {
    await fetch(`${apiURL}/coins?coinId=${coinId}`, {
      credentials: 'include',
      method: 'PUT',
    });
  } catch (error) {
    console.log(error);
  }
};

export default coinHandler;
