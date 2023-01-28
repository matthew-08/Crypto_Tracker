import React from 'react'
import styles from './formcomponent.module.css'
import { useState, useEffect } from 'react'
import { RouterProvider, Link } from 'react-router-dom'

interface FormProps {
    header: string,
    headerSubtitle: string,
    buttonText: string,
    smallTextBottom: string,
    linkPath: string,
    formInputFields: string[]
    apiCallback: (data: FormFields) => Promise<void>
    errorMessage: string
}

interface FormFields {
    [key: string]: string | Boolean
}

export const FormComponent = ({header, headerSubtitle, buttonText, smallTextBottom, linkPath, formInputFields, apiCallback, errorMessage}: FormProps) => {
    const [formFields, setFormFields] = useState<FormFields>({})

    const [invalidInputs, setInvalidInputs] = useState<FormFields>({})

    useEffect(() => {
        const formInputs = formInputFields.reduce((prev:FormFields, current) => {
            prev[current] = '';
            return prev
        }, {})
       setFormFields(formInputs)
       const formValidation = formInputFields.reduce((prev:FormFields, current) => {
            prev[current] = false;
            return prev
       }, {})
       setInvalidInputs(formValidation);

    }, []);


    const handleInvalidInput = (inputType: string) => {
        console.log(inputType);
        return setInvalidInputs(prevState => ({ ...prevState, [inputType]: true }))
    }

    const checkForm = () => {
        let valid = true
        for(let i in formFields) {
            setInvalidInputs(prevState => ({...prevState, [i]: false }))
            if (!formFields[i]) {
                valid = false
                handleInvalidInput(i)
            }
        }
        if (formFields.confirm_password) {
            console.log('password check')
            if(formFields.confirm_password !== formFields.password) {
                valid = false
                setInvalidInputs(prevState => ({...prevState, confirm_password: true}))
            }
        }
        return valid
    }

    /* const postNewUser = async () => {
        const data = {
            username: formFields.username,
            email: formFields.email,
            password: formFields.password
        }
        const newUser = await fetch('http://localhost:8000/auth/createUser', { 
            method: 'POST',
            mode: 'cors',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data) 
        
        })
    } */

    const handleSubmit = (e: React.SyntheticEvent) => {
        e.preventDefault();
        if(checkForm()){
            const data = formFields
            apiCallback(data)
        }
    }

    const handleInput = (e: string, input: string) => {
        console.log(formFields);
        return setFormFields({ ...formFields, [input]: e })
    }
    const getType = (input:string):string => {
        if(input === 'email') {
            return 'email'
        } else if (input === 'password' || input === 'confirm_password'){
            return 'password'
        } else {
            return 'text'
        }
    }
    const getPlaceholder = (input:string):string => {
        if(input === 'confirm_password') {
            return 'Confirm Password'
        } else {
        return input.charAt(0).toUpperCase() + input.slice(1)
        }  
    }
  return (
                <form action=""
                    className={styles.form}
                    onSubmit={handleSubmit}
                >
                    <header
                    className={styles.header}
                    >
                    <h2>{header}</h2>
                    <small>{headerSubtitle}</small>
                    </header>
                    <div className={styles.inputs}>
                        {formInputFields.map(input => {
                           return <input 
                           type={getType(input)}
                           name={input}
                           placeholder={getPlaceholder(input)}
                           onChange={e => handleInput(e.target.value, input)}
                           className={invalidInputs[input] ? styles.invalid : styles.input}
                           />
                        })}
                    </div>
                    <small
                    className={styles.error}
                    >{errorMessage && errorMessage}</small>
                    <button
                        type='submit'
                        className={styles['register-button']}
                    >{buttonText}</button>
                    <small>{smallTextBottom}{' '}
                        <Link
                            to={linkPath}
                        >Click here.</Link></small>
                </form>
  )
}
