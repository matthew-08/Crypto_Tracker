import React, { useEffect } from 'react'
import styles from './signup.module.css'
import wave from './assets/wave.svg'
import { FormMethod, Link } from 'react-router-dom'
import { LandingPage } from '../main/LandingPage'
import { useState } from 'react'

type formFields = {
    email: string | number
    username: string | number
    password: string | number
    passwordConfirm: string | number
}

export const SignUp = () => {
    const [formFields, setFormFields] = useState({
        email: '',
        username: '',
        password: '',
        passwordConfirm: '',
    })

    const [invalidInputs, setInvalidInputs] = useState({
        email: false,
        username: false,
        password: false,
        passwordConfirm: false,
    })

    useEffect(() => {
        console.log(invalidInputs)
    }, [invalidInputs]);


    const handleInvalidInput = (inputType: string) => {
        console.log(inputType);
        return setInvalidInputs(prevState => ({ ...prevState, [inputType]: true }))
    }

    const checkForm = () => {
        for(let i in formFields) {
            setInvalidInputs(prevState => ({...prevState, [i as keyof formFields]: false }))
            if (!formFields[i as keyof formFields]) {
                handleInvalidInput(i)
            }
        }
    }

    const handleSubmit = (e: React.SyntheticEvent) => {
        e.preventDefault();
        checkForm();

    }

    const handleInput = (e: string, input: string) => {
        switch (input) {
            case 'email':
                return setFormFields({ ...formFields, [input]: e })
            case 'username':
                return setFormFields({ ...formFields, [input]: e })
            case 'password':
                return setFormFields({ ...formFields, [input]: e })
            case 'passwordConfirm':
                return setFormFields({ ...formFields, [input]: e })
        }
        return setFormFields
    }

    return (
        <main
            className={styles.main}
        >
            <img src={wave}
                className={styles.wave}
            />
            <div
                className={styles.container}
            >

                <form action=""
                    className={styles.form}
                    onSubmit={handleSubmit}
                >
                    <header
                        className={styles.header}
                    >
                        <h2>Sign Up</h2>
                        <small>Please fill in this form to create an account</small>
                    </header>
                    <div className={styles.inputs}>
                        <label htmlFor="email"></label>
                        <input type="email" id="email"
                            name="email" placeholder='Email'
                            className={invalidInputs.email ? styles.invalid : styles.input}
                            onChange={(e) => handleInput(e.target.value, 'email')}
                        />
                        <label htmlFor="name"></label>
                        <input type="text" id='name'
                            className={invalidInputs.username ? styles.invalid : styles.input}
                            onChange={(e) => handleInput(e.target.value, 'username')}
                            name='name' placeholder='Username' />
                        <label htmlFor="password"></label>
                        <input type="password" id="password"
                            className={invalidInputs.password ? styles.invalid : styles.input}
                            onChange={(e) => handleInput(e.target.value, 'password')}
                            name='password' placeholder='Password' />
                        <label htmlFor="confirm-password"></label>
                        <input type="password" id="confirm-password"
                            className={invalidInputs.passwordConfirm ? styles.invalid : styles.input}
                            onChange={(e) => handleInput(e.target.value, 'passwordConfirm')}
                            name='confirm-password' placeholder='Confirm Password' />
                    </div>
                    <button
                        type='submit'
                        className={styles['register-button']}
                    >Register</button>
                    <small>Already have an account?{' '}
                        <Link
                            to={'/'}
                        >Sign in here.</Link></small>
                </form>
            </div>
        </main>
    )
}
