// TODO: add and export your own actions

export function selectMessage(channel) {
    return fetch(`/api/v1/channels/${channel}/messages`)
    .then(response => response.json())
    .then((data) => {
      return {
        type: 'SELECT_MESSAGE',
        payload: data
      };
    })
    .catch((error) => {
      return console.log(error, 'error with the fetch !');
    }
    );
}

export function createMessage(channel, content, author) {
  const body = { content: content, author: author };
  console.log(body, "body");
  return fetch(`/api/v1/channels/${channel}/messages`, {
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

