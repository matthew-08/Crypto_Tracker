import { v4 as uuid } from 'uuid';
import { useNavigate } from 'react-router-dom';
import styles from './landingpage.module.css';
import twitter from './assets/twitter.svg';
import amazon from './assets/amazon.svg';
import instagram from './assets/instagram.svg';
import { Logo } from './components/Logo';
import facebook from './assets/facebook.svg';
import { Footer } from './Footer/Footer';
import { FeatureSectionRight } from './FeatureSection/FeatureSectionRight';
import paper from './assets/paper.svg';
import portfolio from './assets/portfolio.png';
import { FeatureSectionLeft } from './FeatureSection/FeatureSectionLeft';
import chart from './assets/cryptochart.png';
import chartlogo from './assets/chart.svg';
import coindetails from './assets/coindetails.png';
import coin from './assets/coin.svg';
import maincoin from '../../assets/coin.svg';

const logoImages = {
  twitter,
  instagram,
  amazon,
  facebook,
};

export function LandingPage() {
  const navigate = useNavigate();
  return (
    <div className={styles['main-page-container']}>
      <div className={styles['page-top']}>
        <div>
          <img src={maincoin} width="100px" alt="main-logo" />
        </div>
        <h2>Noic Crypto Tracker</h2>
        <h2>Try it now</h2>
        <p>Easily track your favorite coins</p>
        <p>Trusted by 2 users.</p>
      </div>
      <button
        type="button"
        className={styles.button}
        onClick={() => navigate('/signIn')}
      >
        Try it free!
      </button>
      <h2>(Un)Official Partner Of:</h2>
      <div className={styles.logos}>
        {Object.values(logoImages).map((logoSrc) => (
          <Logo key={uuid()} img={logoSrc} />
        ))}
      </div>
      <main className={styles.features}>
        <FeatureSectionRight
          featureImg={chart}
          featureTopLogo={chartlogo}
          featureTitle="Efficiently track data about your favorite coins."
          featureDescription="Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat saepe odio laborum in. Voluptatem nam libero distinctio neque natus soluta voluptates atque rem harum commodi."
        />
        <FeatureSectionLeft
          featureImg={portfolio}
          featureTopLogo={paper}
          featureTitle="Track all of your purchases with a peronsal portfolio"
          featureDescription="Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat saepe odio laborum in. Voluptatem nam libero distinctio neque natus soluta voluptates atque rem harum commodi."
        />
        <FeatureSectionRight
          featureImg={coindetails}
          featureTopLogo={coin}
          featureTitle="Get detailed and up-to-date data about the newest coins."
          featureDescription="Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat saepe odio laborum in. Voluptatem nam libero distinctio neque natus soluta voluptates atque rem harum commodi."
        />
      </main>
      <Footer />
    </div>
  );
}
