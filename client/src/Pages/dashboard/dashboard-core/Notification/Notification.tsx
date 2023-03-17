import styles from './notification.module.css';

export default function Notification({
  img,
  amountDisplay,
}: {
  img: string;
  amountDisplay: number | 'undefined';
}) {
  return (
    <div className={styles.container}>
      {amountDisplay && (
        <div className={styles.amount}>
          {amountDisplay && <span>{amountDisplay}</span>}
        </div>
      )}
      <img src={img} alt="img" />
    </div>
  );
}
