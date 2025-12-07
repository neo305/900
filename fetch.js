const https = require('https');
const fs = require('fs');

const url = 'https://raw.githubusercontent.com/ciss84/PSFree900/main/index.html';
const file = fs.createWriteStream('PSFree900_index.html');

https.get(url, (response) => {
  response.pipe(file);
  file.on('finish', () => {
    file.close();
    console.log('Downloaded PSFree900_index.html');
  });
}).on('error', (err) => {
  console.error('Error:', err);
});
