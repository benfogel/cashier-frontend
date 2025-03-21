<script lang="ts">
    import logo from '/icon.svg'
    import user from '/user.svg'
    import { messageState } from './messages.svelte.ts'
</script>

<div class="chat-wrapper">
    <div class="chat-content">
        <div class="inner-content">
        {#each messageState.messages as message}
            <div class="chat-bubble {message.type}">
                {#if message.type == "ai"}
                    <div class="sender-icon">
                        <img class="chat-ai-image" src={logo} />
                    </div>
                {:else if message.type == "human"}
                    <div class="sender-icon">
                        <img class="chat-user-image" src="{ user }" alt="user image" />
                    </div>
                {:else}
                {/if}
                <span>{ message.data.content }</span>
            </div>
        {/each}
        </div>
        <div id="loader-container" style="display:none;" class="chat-bubble ai">
            <div class="sender-icon"><img src="static/logo.png"></div>
            <span>
                <div class="loader"></div>
            </span>
        </div>
    </div>
</div>

<style>
    .chat-wrapper {
    display: flex;
    flex-direction: column;
    overflow: hidden;
    height: 100%;
    padding-left: 20px;
    padding-right: 20px;
    }

    .chat-content {
    overflow-y: scroll;
    margin-bottom: 10px;
    width: 100%;
    height: 100%;
}

    div.chat-content>span {
        margin-bottom: 12px;
    }

    .chat-bubble {
        display: inline-block;
        overflow-wrap: break-word;
        clear: both;
        margin-bottom: 10px;
        width: 100%;
    }

    .chat-bubble p {
        margin: 0;
        padding: 0;
    }

    .chat-bubble span {
        font-size: 15px;
    }

    .chat-user-image {
        border-radius: 50%;
        height: 36px;
        width: 36px;
        border: 2px solid white;
        margin-top: -2px;
        margin-right: 20px;
    }

    .chat-ai-image {
        border-radius: 90%;
        height: 36px;
        width: 36px;
        border: 2px solid white;
        margin-top: -2px;
        margin-right: 30px;
    }

    div.chat-wrapper div.chat-content div.ai span {
        position: relative;
        width: 70%;
        height: auto;
        display: inline-block;
        padding: 10px 12px;
        background: #e6f4ea;
        color: #212A3E;
        border-radius: 10px;
    }

    div.chat-wrapper div.chat-content div.ai span .innermsg {
        padding-right: 25px;
    }

    div.chat-wrapper div.chat-content div.ai span .info-icon {
        position: absolute;
        right: 13px;
        top: 12px;
        font-size: 20px;
        color: #585858;
        cursor: pointer;
    }

    div.chat-wrapper div.chat-content div.human span {
        position: relative;
        float: right;
        width: 70%;
        height: auto;
        display: inline-block;
        padding: 10px 12px;
        background: #e8f0fe;
        color: #000;
        border-radius: 10px;
    }

    div.chat-wrapper div.chat-content div.human span .info-icon {
        display: none;
    }

    div.chat-wrapper div.chat-content div.human .sender-icon {
        border-radius: 50%;
        width: 40px;
        height: 40px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        float: right;
        margin-left: 10px;;
        border: 2px solid #e9e7f2;
        margin-top: -2px;
    }

    div.chat-wrapper div.chat-content div.ai .sender-icon {
        border-radius: 50%;
        width: 40px;
        height: 40px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        float: left;
        margin-right: 5px;
    }

    div.chat-wrapper div.chat-content div .sender-icon img {
        width: 75%;
        height: 75%;
        margin-left: 20px;
        object-fit: cover;
    }

    div.chat-wrapper div.chat-content div#loader-container span {
        position: relative;
        height: auto;
        display: inline-block;
        padding: 10px 12px;
        background: #f6e6ec;
        color: #212A3E;
        border-radius: 10px;
        width: 50px;
        padding-left: 25px;
    }
</style>