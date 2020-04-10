export default function(state = null, action) {
  const divUser = document.getElementById('root');
  const userId = divUser.dataset.user
  switch (action.type) {
    default:
      return userId;
  }
}
