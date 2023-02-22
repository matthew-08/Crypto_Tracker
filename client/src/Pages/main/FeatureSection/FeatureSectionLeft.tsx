import React from 'react';
import styles from './featuresection.module.css';

type FeatureProps = {
  featureTopLogo: string,
  featureTitle: string,
  featureDescription: string,
  featureImg: string,
};

export function FeatureSectionLeft({
  featureTopLogo, featureTitle, featureDescription,
  featureImg,
}: FeatureProps) {
  return (
    <section
      className={styles['section-left']}
    >
      <div
        className={styles['big-img-container']}
      >
        <img src={featureImg} alt="feature-img" />
      </div>
      <div
        className={styles['main-info-container']}
      >
        <div
          className={styles['img-container-left']}
        >
          <img src={featureTopLogo} alt="logo-img" />
        </div>
        <h2
          className={styles.title}
        >
          {featureTitle}

        </h2>
        <p
          className={styles.description}
        >
          {featureDescription}

        </p>
      </div>
    </section>
  );
}
