<script lang="ts">
    import logo from '/icon.svg'
</script>

<div class="chat-header">
    <img class="header-logo" src={logo} alt="Assistant Logo">
    <span class="material-symbols-outlined" id="resetButton">refresh</span>
</div>

<style>
.chat-header {
    position: relative;
    min-width: 472px;
    font-size: 28px;
    font-weight: 500;
    text-align: center;
    height: 45px;
    background: linear-gradient(to right, #0d652d , #174ea6);
    color: white;
    margin-bottom: 30px;
    padding-top: 15px;
    padding-left: 20px;
    padding-right: 20px;
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
}

.chat-header .header-logo {
    float: left;
    height: 100%;
    margin-top: -7px;
    -webkit-filter: invert(1);
    filter: invert(1);
}

.chat-header .title {
    position: fixed;
    left: calc(50% - 70px);
}

#resetButton {
    position: fixed;
    top: 20px;
    right: 15px;
    color: white;
    cursor: pointer;
    z-index: 1000000;
}
</style>