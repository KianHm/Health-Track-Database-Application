document.addEventListener("DOMContentLoaded", function() {
    // Handle form submission with AJAX
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(form);

            fetch('/api/submit', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                alert(data.message); // Display a success message or handle response
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('An error occurred while submitting the form.');
            });
        });
    }

    // Function to fetch sample data from an API
    function fetchData() {
        fetch('/api/data')
            .then(response => response.json())
            .then(data => {
                console.log('API Data:', data);
                // You can dynamically update the DOM based on this data
                document.getElementById('api-response').textContent = data.message;
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // Optionally call fetchData on load or based on some events
    fetchData();
});
