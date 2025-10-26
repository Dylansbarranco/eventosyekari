// Contact Form Functionality
document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contact-form');
    const formMessage = document.getElementById('form-message');
    
    // Check if there's a pending order from the cart
    const pendingOrder = sessionStorage.getItem('pendingOrder');
    if (pendingOrder) {
        const cart = JSON.parse(pendingOrder);
        const messageField = document.getElementById('message');
        
        // Pre-fill the message with order details
        let orderDetails = 'Me gustaría reservar los siguientes productos:\n\n';
        cart.forEach(item => {
            orderDetails += `- ${item.name} x${item.quantity} ($${(item.price * item.quantity).toLocaleString()} MXN)\n`;
        });
        
        const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
        orderDetails += `\nTotal estimado: $${total.toLocaleString()} MXN\n\n`;
        orderDetails += 'Por favor, confirmen disponibilidad para la fecha del evento.';
        
        if (messageField) {
            messageField.value = orderDetails;
        }
        
        // Clear the pending order
        sessionStorage.removeItem('pendingOrder');
    }
    
    // Handle form submission
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(contactForm);
            const data = {};
            formData.forEach((value, key) => {
                data[key] = value;
            });
            
            // Validate form
            if (!data.name || !data.email || !data.phone || !data.message) {
                showFormMessage('Por favor, completa todos los campos requeridos.', 'error');
                return;
            }
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(data.email)) {
                showFormMessage('Por favor, ingresa un email válido.', 'error');
                return;
            }
            
            // In a real application, this would send the data to a server
            console.log('Form data:', data);
            
            // Simulate successful submission
            showFormMessage(
                '¡Gracias por contactarnos! Nos pondremos en contacto contigo pronto.',
                'success'
            );
            
            // Reset form
            contactForm.reset();
            
            // Scroll to message
            formMessage.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        });
    }
});

function showFormMessage(message, type) {
    const formMessage = document.getElementById('form-message');
    if (formMessage) {
        formMessage.textContent = message;
        formMessage.className = `form-message ${type}`;
        
        // Hide message after 5 seconds
        setTimeout(() => {
            formMessage.style.display = 'none';
        }, 5000);
    }
}

// Set minimum date to today for event date field
document.addEventListener('DOMContentLoaded', function() {
    const eventDateField = document.getElementById('event-date');
    if (eventDateField) {
        const today = new Date().toISOString().split('T')[0];
        eventDateField.setAttribute('min', today);
    }
});
