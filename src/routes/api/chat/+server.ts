import { json } from '@sveltejs/kit'

export const POST = function post(prompt: { message: string }) {
    console.log(prompt)

    return json("Hello from the backend!")
}

export const GET = () => {
    return json("Hello from the backend!")
}