const express = require('express');
const app = express();
const routes = require('./routes/appRoutes');

app.use(express.json());
app.use('/', routes);

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});