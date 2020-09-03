const keys = {
  public: 'BL0AQWPUewYu69fazElPky9CC2JLSSa9bUbQvQMcafeUNhvIq9o2GtWadPQw3rrkORas5JUSgHRROuoNpSZG5Os',
  private: 'cw7ZOjZEfnU1GyL4T1OkeKdi6HJBwG1wj66X6bUdqis'
}

const express = require('express');
const bodyParser = require('body-parser')
const webPush = require('web-push')
const cors = require('cors')

const app = express();
const PORT = process.env.PORT || 60

app.use(bodyParser.json());
app.use(cors());

app.post('/notification', (req, res) => {
  const subscription = req.body
  res.set('Content-Type', 'application/json')

  webPush.setVapidDetails('mailto:noti@gmail.com', keys.public, keys.private)

  let payload = JSON.stringify({
    notification: {
      title: 'Party',
      body: '123',
      icon: null
    }
  })

  Promise.resolve(webPush.sendNotification(subscription, payload))
    .then(() => {
      res.status(200).send({
        message: 'Notification sent'
      })
    }, err => {
      console.log(err)
    })

})

app.get('/', (req, res) => {
  res.send('Hellow')
})

app.listen(PORT, () => {
  console.log(`Connection To ${PORT}`)
})