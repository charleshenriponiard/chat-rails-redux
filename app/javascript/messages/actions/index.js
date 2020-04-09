// TODO: add and export your own actions

export function selectMessage(channel) {
  const url = `api/v1/channels/${channel}/messages`;
    return fetch({url})
    .then(response => response.json())
    .then((data) => {
      return {
        type: 'SELECT_MESSAGE',
        payload: data.messages
      };
    })
    .catch((error) => {
      return console.log(error, 'error with the fetch !');
    }
    );
}

export function createMessage(channel, content, author) {
  const url = `/api/v1/channels/${channel}`
  const body = { content: content, author: author };
  return fetch(url, {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  }).then((data) => data.json())
    .then((body) => {
      return {
        type: 'CREATE_MESSAGE',
        payload: body
      };
    });
}

