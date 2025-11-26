// Project Sankofa - Site Functionality
// Ancient wisdom meets modern interaction

document.addEventListener('DOMContentLoaded', function() {
    // Smooth scrolling for anchor links
    const anchorLinks = document.querySelectorAll('a[href^="#"]');
    
    anchorLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            
            // Skip if it's just a hash
            if (href === '#') return;
            
            const target = document.querySelector(href);
            if (target) {
                e.preventDefault();
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                
                // Update URL without triggering scroll
                history.pushState(null, null, href);
            }
        });
    });
    
    // Navigation active state management
    function updateActiveNavLink() {
        const currentPage = window.location.pathname.split('/').pop() || 'index.html';
        const navLinks = document.querySelectorAll('.nav-link');
        
        navLinks.forEach(link => {
            link.classList.remove('active');
            
            // Check if link matches current page
            const linkHref = link.getAttribute('href');
            if (
                (currentPage === 'index.html' && (linkHref === 'index.html' || linkHref.startsWith('#'))) ||
                (currentPage === 'visuals.html' && linkHref === 'visuals.html') ||
                linkHref === currentPage
            ) {
                link.classList.add('active');
            }
        });
    }
    
    // Update active nav on page load
    updateActiveNavLink();
    
    // Intersection Observer for section highlighting
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-link[href^="#"]');
    
    if (sections.length > 0) {
        const observerOptions = {
            root: null,
            rootMargin: '-20% 0px -70% 0px',
            threshold: 0
        };
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const sectionId = entry.target.getAttribute('id');
                    
                    // Update nav links for current page sections
                    navLinks.forEach(link => {
                        link.classList.remove('active');
                        if (link.getAttribute('href') === `#${sectionId}`) {
                            link.classList.add('active');
                        }
                    });
                }
            });
        }, observerOptions);
        
        sections.forEach(section => {
            observer.observe(section);
        });
    }
    
    // Enhanced visual card interactions
    const visualCards = document.querySelectorAll('.visual-card');
    
    visualCards.forEach(card => {
        // Add loading state for images
        const img = card.querySelector('.visual-image');
        if (img) {
            img.addEventListener('load', function() {
                card.classList.add('loaded');
            });
            
            // Add error handling
            img.addEventListener('error', function() {
                card.classList.add('error');
                console.warn(`Failed to load image: ${img.src}`);
            });
        }
        
        // Add hover analytics tracking (placeholder)
        card.addEventListener('mouseenter', function() {
            const title = card.querySelector('.visual-title')?.textContent;
            // Analytics: track visual engagement
            console.log(`Visual engaged: ${title}`);
        });
    });
    
    // Audio player enhancements
    const audioElements = document.querySelectorAll('audio');
    
    audioElements.forEach(audio => {
        // Track audio engagement
        audio.addEventListener('play', function() {
            console.log('Audio playback started');
        });
        
        audio.addEventListener('pause', function() {
            console.log('Audio playback paused');
        });
        
        // Add loading states
        audio.addEventListener('loadstart', function() {
            const container = audio.closest('.audio-player');
            if (container) {
                container.classList.add('loading');
            }
        });
        
        audio.addEventListener('canplaythrough', function() {
            const container = audio.closest('.audio-player');
            if (container) {
                container.classList.remove('loading');
                container.classList.add('ready');
            }
        });
    });
    
    // Progressive enhancement for visual placeholders
    const placeholders = document.querySelectorAll('.placeholder-visual, .framework-placeholder');
    
    placeholders.forEach(placeholder => {
        placeholder.addEventListener('click', function() {
            const card = placeholder.closest('.visual-card, .framework-section');
            if (card) {
                card.classList.add('interest-expressed');
                console.log('Interest expressed in upcoming visual');
            }
        });
    });
    
    // Back to top functionality
    function addBackToTop() {
        const backToTop = document.createElement('button');
        backToTop.innerHTML = '↑';
        backToTop.className = 'back-to-top';
        backToTop.setAttribute('aria-label', 'Back to top');
        backToTop.style.cssText = `
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            background: var(--accent-gold);
            color: var(--primary-dark);
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            z-index: 1000;
        `;
        
        document.body.appendChild(backToTop);
        
        // Show/hide based on scroll position
        window.addEventListener('scroll', () => {
            if (window.scrollY > 500) {
                backToTop.style.opacity = '1';
                backToTop.style.visibility = 'visible';
            } else {
                backToTop.style.opacity = '0';
                backToTop.style.visibility = 'hidden';
            }
        });
        
        // Smooth scroll to top
        backToTop.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
    
    // Initialize back to top if page is long enough
    if (document.body.scrollHeight > window.innerHeight * 2) {
        addBackToTop();
    }
    
    // Performance: Lazy load images
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    if (img.dataset.src) {
                        img.src = img.dataset.src;
                        img.removeAttribute('data-src');
                        observer.unobserve(img);
                    }
                }
            });
        });
        
        document.querySelectorAll('img[data-src]').forEach(img => {
            imageObserver.observe(img);
        });
    }
});

// Utility functions
function trackEngagement(action, element) {
    // Placeholder for analytics tracking
    console.log(`Engagement: ${action}`, element);
}

// Export for potential module use
window.SankofaUtils = {
    trackEngagement
};
