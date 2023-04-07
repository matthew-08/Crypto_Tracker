/* eslint-disable no-param-reassign */
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import styles from './formcomponent.module.css';

type FormInputFields =
  | ['username', 'password']
  | ['username', 'password', 'email', 'confirm_Password'];

type FormObject = {
  [key in FormInputFields[number]]: string;
};

type FormObjectValidation = {
  [key in FormInputFields[number]]: boolean | string;
};

interface FormProps<T, K> {
  header: string;
  headerSubtitle: string;
  buttonText: string;
  smallTextBottom: string;
  linkPath: string;
  formInputFields: T[];
  apiCallback: (data: FormObject) => void;
  errorMessage: string;
}

export function FormComponent<
  T extends FormInputFields[number],
  K extends keyof T
>({
  header,
  headerSubtitle,
  buttonText,
  smallTextBottom,
  linkPath,
  formInputFields,
  apiCallback,
  errorMessage,
}: FormProps<T, K>) {
  const [formFields, setFormFields] = useState<FormObject>({} as FormObject);

  const [invalidInputs, setInvalidInputs] = useState<FormObjectValidation>(
    {} as FormObjectValidation
  );

  useEffect(() => {
    const formInputs = formInputFields.reduce(
      (prev: FormObject, current: T) => {
        prev[current] = '';
        return prev;
      },
      {} as FormObject
    );

    setFormFields(formInputs);
    const formValidation = formInputFields.reduce(
      (prev: FormObjectValidation, current: T) => {
        prev[current] = false;
        return prev;
      },
      {} as FormObjectValidation
    );
    setInvalidInputs(formValidation);
  }, []);

  const handleInvalidInput = (inputType: string) =>
    setInvalidInputs((prevState) => ({
      ...prevState,
      [inputType]: true,
    }));

  const checkForm = (form: FormObject) => {
    let valid = true;
    // eslint-disable-next-line no-restricted-syntax, guard-for-in
    for (const key in formFields) {
      setInvalidInputs((prevState) => ({ ...prevState, [key]: false }));
      if (!formFields[key as keyof FormObject]) {
        valid = false;
        handleInvalidInput(key);
      }
    }
    if ('confirm_Password' in form) {
      if (form.confirm_Password !== form.password) {
        valid = false;
        setInvalidInputs((prevState) => ({
          ...prevState,
          confirm_Password: true,
        }));
      }
    }

    return valid;
  };

  const handleSubmit = (e: React.SyntheticEvent) => {
    e.preventDefault();
    if (checkForm(formFields)) {
      const data = formFields;
      apiCallback(data!);
    }
  };

  const handleInput = (e: string, input: string) => {
    return setFormFields({ ...formFields, [input]: e });
  };
  const getType = (input: string): string => {
    if (input === 'email') {
      return 'email';
    }
    if (input === 'password' || input === 'confirm_Password') {
      return 'password';
    }
    return 'text';
  };
  const getPlaceholder = (input: string): string => {
    if (input === 'confirm_Password') {
      return 'Confirm Password';
    }
    return input.charAt(0).toUpperCase() + input.slice(1);
  };
  return (
    <form action="" className={styles.form} onSubmit={handleSubmit}>
      <header className={styles.header}>
        <h2>{header}</h2>
        <small>{headerSubtitle}</small>
      </header>
      <div className={styles.inputs}>
        {formInputFields.map((input) => (
          // eslint-disable-next-line react/jsx-key
          <input
            value={formFields[input]}
            type={getType(input)}
            name={input}
            placeholder={getPlaceholder(input)}
            onChange={(e) => handleInput(e.target.value, input)}
            className={invalidInputs[input] ? styles.invalid : styles.input}
          />
        ))}
      </div>
      <small className={styles.error}>{errorMessage && errorMessage}</small>
      <button type="submit" className={styles['register-button']}>
        {buttonText}
      </button>
      <small>
        {smallTextBottom}
        <Link to={linkPath}> Click here.</Link>
      </small>
    </form>
  );
}
