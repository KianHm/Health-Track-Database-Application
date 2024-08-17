const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3030;

// Simulated database entries
let entries = [
    { id: 1, content: 'Sample entry 1' },
    { id: 2, content: 'Sample entry 2' }
];

// Middleware to parse JSON and urlencoded form data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Serving static files from 'public' directory
app.use(express.static('public'));

// Sample API for testing database connection
app.get('/api/test-connection', (req, res) => {
    // Simulated database connection test
    console.log("Testing database connection...");
    res.json({ success: true, message: "Connection successful", entries: entries });
});

// API to handle form submissions (placeholder)
app.post('/api/submit', (req, res) => {
    const { content } = req.body;
    const newEntry = {
        id: entries.length + 1,
        content: content
    };
    entries.push(newEntry);
    res.status(201).send({ message: 'Entry added successfully', entry: newEntry });
});

// Catch-all for 404 Errors (Resource not found)
app.use((req, res) => {
    res.status(404).send('404: Page not found');
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
