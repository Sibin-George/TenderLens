var express = require('express');
var app = express();
const sdk = require('api')('@verbwire/v1.0#1pdgiyl8x6o4im');

const API_KEY = 'sk_live_e1535350-3d4f-4b7b-8b7f-d6f5f4e96dd3';
const nftSlug =  'azuki'; //'boredapeyachtclub';

app.get('/', function(req, res){

    sdk.auth(API_KEY);
    sdk.get('/nft/data/ownershipForSlug', {
      slug: nftSlug,
      chain: 'ethereum',
      limit: '10',
      page: '1',
      sortDirection: 'DESC'
    })
      .then((data)=>{

        
        res.send(data.ownership.results.splice(0,10))

      })
      .catch(err => console.error(err));
});

app.listen(8080, ()=>{console.log("")});