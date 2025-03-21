type Message = {
    type: string;
    data: {
        content: string;
    };
}

export const messageState = $state({
    messages: [
    ] as Message[],
    currentMessage: ''
})

export function sendMessage() {
    promptLLM(messageState.currentMessage).then((message) => {
        addMessage({ type: 'ai', data: { content: message }})
    })

    addMessage({ type: 'human', data: { content: messageState.currentMessage }})
    clearMessageInput();
}

function clearMessageInput() {
    messageState.currentMessage = ''
}

function addMessage(message: Message) {
    messageState.messages.push(message)
}

async function promptLLM(prompt: string) {
    const response = await fetch(`/api/chat`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            message: prompt
        }),
    });

    if (response.ok) {
        const text = await response.text();
        const resp = JSON.parse(text);
        return resp.content
    } else {
        console.error(await response.text())
        return { type: "message", content: "Something went wrong" }
    }
}