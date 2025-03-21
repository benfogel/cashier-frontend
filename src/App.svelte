<script lang="ts">
  import logo from '/icon.svg'
  import ChatHeader from './lib/ChatHeader.svelte'
  import ChatContent from './lib/ChatContent.svelte'
  import ChatInput from './lib/ChatInput.svelte'
</script>

<main>
  <div class="container">
    <ChatHeader />
    <ChatContent />
    <ChatInput />
  </div>
</main>

<style>
  .container {
    position: relative;
    width: 100%;
    margin: 0px auto;
    height: 100%;
    display: flex;
    flex-direction: column;
  }
</style>
