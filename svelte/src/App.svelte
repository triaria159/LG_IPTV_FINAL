<script>
  import Welcome from './Welcome.svelte';
  import InfoInput from './InfoInput.svelte';
  import InfoConfirm from './InfoConfirm.svelte';
  import MainPage from './MainPage.svelte';

  let currentPage = 'welcome'; // 초기 페이지 설정
  let userInfo = {}; // 사용자 정보 저장

  // 페이지 전환 함수
  function startInfoInput() {
    currentPage = 'infoInput';
  }

  function finishInfoInput(event) {
    userInfo = event.detail; // 이벤트에서 전달된 사용자 데이터 저장
    saveUserData(userInfo); // API를 통해 사용자 데이터 저장
    currentPage = 'infoConfirm';
  }

  function goBack() {
    if (currentPage === 'infoConfirm') {
      currentPage = 'infoInput';
    }
  }

  function goToWelcome() {
    currentPage = 'welcome';
  }

  function goToMainPage() {
    currentPage = 'mainPage';
  }

  // 사용자 데이터를 API로 저장
  async function saveUserData(data) {
    try {
      const response = await fetch('/api/save_user_data', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
      });
      if (!response.ok) {
        console.error('Failed to save user data');
      }
    } catch (error) {
      console.error('Error saving user data:', error);
    }
  }
</script>

<main>
  {#if currentPage === 'welcome'}
    <Welcome on:start={startInfoInput} />
  {:else if currentPage === 'infoInput'}
    <InfoInput on:finish={finishInfoInput} on:goToWelcome={goToWelcome} />
  {:else if currentPage === 'infoConfirm'}
    <InfoConfirm {userInfo} on:back={goBack} on:confirm={goToMainPage} />
  {:else if currentPage === 'mainPage'}
    <MainPage />
  {/if}
</main>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  @media (min-width: 640px) {
    main {
      max-width: none;
    }
  }
</style>
