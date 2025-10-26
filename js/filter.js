// Product Filter Functionality
function filterProducts(category, clickedButton) {
    const products = document.querySelectorAll('.product-card');
    const buttons = document.querySelectorAll('.filter-btn');
    
    // Update active button
    buttons.forEach(btn => btn.classList.remove('active'));
    if (clickedButton) {
        clickedButton.classList.add('active');
    }
    
    // Filter products
    products.forEach(product => {
        if (category === 'all') {
            product.style.display = 'block';
            setTimeout(() => {
                product.style.opacity = '1';
                product.style.transform = 'scale(1)';
            }, 10);
        } else {
            const productCategories = product.getAttribute('data-category');
            const categoriesArray = productCategories ? productCategories.split(' ') : [];
            if (categoriesArray.includes(category)) {
                product.style.display = 'block';
                setTimeout(() => {
                    product.style.opacity = '1';
                    product.style.transform = 'scale(1)';
                }, 10);
            } else {
                product.style.opacity = '0';
                product.style.transform = 'scale(0.8)';
                setTimeout(() => {
                    product.style.display = 'none';
                }, 300);
            }
        }
    });
}

// Add transition styles for smooth filtering
document.addEventListener('DOMContentLoaded', function() {
    const products = document.querySelectorAll('.product-card');
    products.forEach(product => {
        product.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
    });
});
