<script lang="ts">
    import { messageState, sendMessage } from './messages.svelte.ts'

    function handleEnter(event) {
        if (event.key === 'Enter') {
            sendMessage();
        }
    }
</script>

<div class="chat-bar-wrapper">
    <div class="chat-bar">
        <div class="mdl-progress mdl-js-progress mdl-progress__indeterminate"></div>
        <div class="chat-input-container">
            <input type="text" class="ip-msg" placeholder="type your question here..." bind:value={messageState.currentMessage} on:keydown={handleEnter}>
            <span class="btn-group send-button" on:click={sendMessage}>
                <span class="material-symbols-outlined">
                    send
                </span>
            </span>
        </div>
    </div>
</div>

<style>
    .send-icon {
        margin-top:12px;
        margin-right:12px;
    }

    *:focus {
        outline: none;
    }

    .mdl-progress {
        width: 100%;
        display: none;
    }

    .mdl-progress.mdl-progress__indeterminate>.bar1 {
        background-color: #394867
    }

    .send-button {
        margin-top: 12px;
        margin-right: 12px;
        color: #86629E;
    }

    .chat-bar-wrapper {
        padding-left: 20px;
        padding-right: 20px;
        background: #F2F0FB;
        padding-top: 10px;
    }

    .chat-bar {
        position: relative;
        margin-top: auto;
        margin-bottom: 15px;
        border: 1px solid #362A81;
        border-radius: 10px;
        overflow: hidden;
        min-height: 48.1px;
        background: #FFF;
        cursor: pointer;
    }

    .chat-input-container {
        display: flex;
    }

    .chat-input-container .ip-msg {
        width: 100%;
        font-size: 14px;
        padding: 15px;
        color: #212A3E;
        border: none;
    }
</style>