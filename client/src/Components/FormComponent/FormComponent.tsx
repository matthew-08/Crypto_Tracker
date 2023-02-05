import React from 'react'
import styles from './formcomponent.module.css'
import { useState, useEffect } from 'react'
import { RouterProvider, Link } from 'react-router-dom'
import { formFields } from '../../Pages/signup/SignUpOld'
import currencyAdjust from '../../utils/currencyAdjust'

type FormInputFields = ['username', 'password'] | ['username', 'password', 'email', 'confirm_Password']

type FormObject = {
    [key in FormInputFields[number]]: string
 }

type FormObjectValidation =  {
    [key in FormInputFields[number]]: boolean | string
}

interface FormProps<T, K> {
    header: string,
    headerSubtitle: string,
    buttonText: string,
    smallTextBottom: string,
    linkPath: string,
    formInputFields: T[],
    apiCallback: (data: FormObject) => void
    errorMessage: string
}






export const FormComponent = <T extends FormInputFields[number], K extends keyof T>({header, headerSubtitle, buttonText, smallTextBottom, linkPath, formInputFields, apiCallback, errorMessage}: FormProps<T, K>) => {
    
    const [formFields, setFormFields] = useState<FormObject>({} as FormObject)

    const [invalidInputs, setInvalidInputs] = useState<FormObjectValidation>({} as FormObjectValidation)


    useEffect(() => {
        const formInputs = formInputFields.reduce((prev:FormObject, current: T) => {
            prev[current] = ''
            return prev
        },{} as FormObject)
    
       setFormFields(formInputs)
       const formValidation = formInputFields.reduce((prev:FormObjectValidation, current: T) => {
            prev[current] = false;
            return prev
       }, {} as FormObjectValidation)
       setInvalidInputs(formValidation);

       
    }, []);


    const handleInvalidInput = (inputType: string) => {
        console.log(inputType);
        return setInvalidInputs(prevState => ({ ...prevState, [inputType]: true }))
    }

    const checkForm = (form: FormObject) => {
        let valid = true
        for(const key in formFields) {
            setInvalidInputs(prevState => ({...prevState, [key]: false }))
            if (!formFields[key as keyof FormObject]) {
                valid = false
                handleInvalidInput(key)
            }
        }
        if ('confirm_Password' in form) { 
            if(form['confirm_Password'] !== form['password']) {
                valid = false
                setInvalidInputs(prevState  => ({...prevState, confirm_Password: true}))
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
        if(checkForm(formFields)){
            const data = formFields
            apiCallback(data!)
        }
    }

    const handleInput = (e: string, input: string) => {
        console.log(formFields);
        return setFormFields({ ...formFields, [input]: e })
    }
    const getType = (input:string):string => {
        if(input === 'email') {
            return 'email'
        } else if (input === 'password' || input === 'confirm_Password'){
            return 'password'
        } else {
            return 'text'
        }
    }
    const getPlaceholder = (input:string):string => {
        if(input === 'confirm_Password') {
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
